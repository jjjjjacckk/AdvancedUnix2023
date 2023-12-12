#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
// #include <sys/ioctl.h>
#include <string.h>

// #define	DEVFILE	"/dev/kshram0"

int main() {
	int fd;
	// char buf[64];

	for (int idx = 0; idx < 8; ++idx) {
		char devName[64] = "";
		sprintf(devName, "/dev/kshram%d", idx); 
		if((fd = open(devName, O_RDWR)) < 0) {
			perror("open");
			return -1;
		}
		close(fd);
	}

	// read(fd, buf, sizeof(buf));
	// write(fd, buf, sizeof(buf));
	// ioctl(fd, 0x1234);
	// ioctl(fd, 0x5678, 0xabcd);
	// close(fd);

	return 0;
}
