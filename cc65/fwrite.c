#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#include "_file.h"

extern void __fastcall__  run6502_putchar(unsigned char);

/*
	we need this function to be reentrant
*/

size_t __fastcall__ fwrite (const void* buf, size_t size, size_t count, FILE* file)
{
	// FIXME: check if file is open
	int cnt;
	unsigned char *b;

//	run6502_putchar('a');
	
	count*=size;
	if(count)
	{
		//count=write(((struct _FILE*)file)->f_fd,buf,count);
		cnt=count;
		b=(unsigned char*)buf;
		while(cnt)
		{
			run6502_putchar(*b++);
			--cnt;
		}
//	run6502_putchar('b');
		
		return count/size;
	}
//	run6502_putchar('c');
	return 0;
}