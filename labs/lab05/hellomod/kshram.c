/*
 * Lab problem set for UNIX programming course
 * by Chun-Ying Huang <chuang@cs.nctu.edu.tw>
 * License: GPLv2
 */
#include <linux/module.h>	// included for all kernel modules
#include <linux/kernel.h>	// included for KERN_INFO
#include <linux/init.h>		// included for __init and __exit macros
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/errno.h>
#include <linux/sched.h>	// task_struct requried for current_uid()
#include <linux/cred.h>		// for current_uid();
#include <linux/slab.h>		// for kmalloc/kfree
#include <linux/uaccess.h>	// copy_to_user
#include <linux/string.h>
#include <linux/device.h>
#include <linux/cdev.h>
#include <asm/ioctl.h>		// for _IO()
#include <linux/mm.h> 		// for remap_pfn_range()

static dev_t devnum;
static struct cdev c_dev;
static struct class *clazz;

static void* memPointer[8] = {NULL}; 	// pointer of memory of kshram0~7
static long memSize[8] = {0};    	// size of memory of kshram0~7

static int kshram_dev_open(struct inode *i, struct file *f) {
	// printk(KERN_INFO "kshram: device opened.\n");
	// printk(KERN_INFO "inode->i_ino = %lu\n", i->i_ino);
	// printk(KERN_INFO "file->f_inode->i_no = %lu\n", f->f_inode->i_ino);
	

	return 0;
}

static int kshram_dev_close(struct inode *i, struct file *f) {
	// printk(KERN_INFO "kshram: device closed.\n");
	return 0;
}

static ssize_t kshram_dev_read(struct file *f, char __user *buf, size_t len, loff_t *off) {
	// printk(KERN_INFO "kshram: read %zu bytes @ %llu.\n", len, *off);
	return len;
}

static ssize_t kshram_dev_write(struct file *f, const char __user *buf, size_t len, loff_t *off) {
	// printk(KERN_INFO "kshram: write %zu bytes @ %llu.\n", len, *off);
	return len;
}

static long kshram_dev_ioctl(struct file *fp, unsigned int cmd, unsigned long arg) {
	// printk(KERN_INFO "kshram: ioctl cmd=%u arg=%lu.\n", cmd, arg);

	// MINOR(fp->f_inode->i_rdev) = devnum of kshram%d
	if (cmd == _IO('K', 0)) 
		return 8;
	else if (cmd == _IO('K', 1)) 
		return memSize[MINOR(fp->f_inode->i_rdev)]; 
	else if (cmd == _IO('K', 2)) {
		memPointer[MINOR(fp->f_inode->i_rdev)] = krealloc(memPointer[MINOR(fp->f_inode->i_rdev)], arg, GFP_KERNEL);
		memSize[MINOR(fp->f_inode->i_rdev)] = (long)arg;
		
		return (long)arg;
	}

	return 0;
}

/**
 * remap_pfn_range - remap kernel memory to userspace
 * @vma: user vma to map to
 * @addr: target user address to start at
 * @pfn: physical address of kernel memory
 * @size: size of map area
 * @prot: page protection flags for this mapping
 *
 *  Note: this is only safe if the mm semaphore is held when called.
 */
static int kshram_dev_mmap(struct file *filp, struct vm_area_struct *vma) {
	// void *ret = mmap(addr, length, prot, flags, fd, offset);

	unsigned long vma_size = vma->vm_end - vma->vm_start;
	unsigned long pfn = page_to_pfn(virt_to_page(memPointer[MINOR(filp->f_inode->i_rdev)]));

	int ret = remap_pfn_range(vma, vma->vm_start, pfn, vma_size, vma->vm_page_prot);
	if (ret < 0) {
		pr_err("could not map the address area\n");
		return -EIO;
	}

	printk(KERN_INFO "kshram/mmap: idx %d size %lu\n", MINOR(filp->f_inode->i_rdev), vma_size);
	return ret;
}

static const struct file_operations kshram_dev_fops = {
	.owner = THIS_MODULE,
	.open = kshram_dev_open,
	.read = kshram_dev_read,
	.write = kshram_dev_write,
	.unlocked_ioctl = kshram_dev_ioctl,
	.release = kshram_dev_close,
	.mmap = kshram_dev_mmap
};

static int kshram_proc_read(struct seq_file *m, void *v) {
	// char buf[] = "`hello, world!` in /proc.\n";
	// seq_printf(m, buf);
	
	for (int idx = 0; idx < 8; ++idx) {
		char buf[20] = "";\
		sprintf(buf, "0%u: %ld\n", idx, memSize[idx]);
		seq_printf(m, buf);
		// printk(KERN_INFO "%s\n", buf);
	}
	return 0;
}

static int kshram_proc_open(struct inode *inode, struct file *file) {
	return single_open(file, kshram_proc_read, NULL);
}

static const struct proc_ops kshram_proc_fops = {
	.proc_open = kshram_proc_open,
	.proc_read = seq_read,
	.proc_lseek = seq_lseek,
	.proc_release = single_release,
};

static char *kshram_devnode(const struct device *dev, umode_t *mode) {
	if(mode == NULL) return NULL;
	*mode = 0666;
	return NULL;
}

static int __init kshram_init(void)
{
	// create char dev
	// int alloc_chrdev_region(dev_t *dev, unsigned baseminor, unsigned count, const char *name);
	if(alloc_chrdev_region(&devnum, 0, 8, "updev") < 0)
		return -1;
	if((clazz = class_create(THIS_MODULE, "upclass")) == NULL)
		goto release_region;
	clazz->devnode = kshram_devnode;

	// create device & char device
	for (int idx = 0; idx < 8; ++idx) {
		// since MAJOR() are the same
		if(device_create(clazz, NULL, MKDEV(MAJOR(devnum), idx), NULL, "kshram%d", idx) == NULL)
			goto release_class;
	}
	cdev_init(&c_dev, &kshram_dev_fops);
	if(cdev_add(&c_dev, MKDEV(MAJOR(devnum), 0), 8) == -1)
		goto release_device;

	// create proc
	proc_create("kshram", 0, NULL, &kshram_proc_fops);

	// memory allocation
	for (int idx = 0; idx < 8; ++idx) {
		memSize[idx] = 4096u;
		memPointer[idx] = kmalloc(memSize[idx], GFP_KERNEL);
		printk(KERN_INFO "kshram%d: %ld bytes allocated @ %px\n", idx, memSize[idx], memPointer[idx]);
	}

	printk(KERN_INFO "kshram: initialized.\n");
	return 0;    // Non-zero return means that the module couldn't be loaded.

release_device:
	for (int idx = 0; idx < 8; ++idx)
		device_destroy(clazz, MKDEV(MAJOR(devnum), idx));
release_class:
	class_destroy(clazz);
release_region:
	unregister_chrdev_region(MKDEV(MAJOR(devnum), 0), 8);
	return -1;
}

static void __exit kshram_cleanup(void)
{
	remove_proc_entry("kshram", NULL);
	cdev_del(&c_dev);

	for (int idx = 0; idx < 8; ++idx)
		device_destroy(clazz, MKDEV(MAJOR(devnum), idx));
	
	class_destroy(clazz);
	unregister_chrdev_region(MKDEV(MAJOR(devnum), 0), 8);

	// memory allocation
	for (int idx = 0; idx < 8; ++idx) 
		kfree(memPointer[idx]);

	printk(KERN_INFO "kshram: cleaned up.\n");
}

module_init(kshram_init);
module_exit(kshram_cleanup);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Chun-Ying Huang");
MODULE_DESCRIPTION("The unix programming course demo kernel module.");
