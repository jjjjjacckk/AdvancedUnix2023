
obj-m     += hellomod.o
obj-m     += kshram.o
ccflags-y += -DEXPORT_SYMTAB

all: hello k_test
	make -C ../dist/modulebuild M=$(PWD) modules

hello: hello.c
	$(CROSS_COMPILE)gcc -o $@ $< -Wall -static

k_test: k_test.c
	$(CROSS_COMPILE)gcc -o $@ $< -Wall -static

clean:
	rm -f hello
	make -C ../dist/modulebuild M=$(PWD) clean

install: all
	mkdir -p ../rootfs/modules
	cp hello hellomod.ko k_test kshram.ko ../rootfs/modules
