
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

extern void __fastcall__  run6502_putchar(unsigned char);
extern void __fastcall__  run6502_logerror(unsigned char);

unsigned char n;
unsigned char bf[0x10];


int main(void)
{

	unsigned char *b=&bf[0];


	memset(b,0xfe,0x10);

	run6502_logerror(1);
	
//	printf("Hello World!\n");
//	fprintf(stdout,"Hello World! %d xyz\n",123);

//	n=read(0,b,0x10);

#if 0
	printf("n:%02x '%c'\n",*b,*b);b++;
	printf("n:%02x '%c'\n",*b,*b);b++;
	printf("n:%02x '%c'\n",*b,*b);b++;
	printf("n:%02x '%c'\n",*b,*b);b++;
	printf("n:%02x '%c'\n",*b,*b);b++;
	printf("n:%02x '%c'\n",*b,*b);b++;
	printf("n:%02x '%c'\n",*b,*b);b++;
	printf("n:%02x '%c'\n",*b,*b);b++;
#endif
			       
#if 0
	n=read(0,&n,1);
	printf("n:%02x '%c'\n",n,n);
	n=read(0,&n,1);
	printf("n:%02x '%c'\n",n,n);
	n=read(0,&n,1);
	printf("n:%02x '%c'\n",n,n);
	n=fgetc(stdin);
	printf("n:%02x '%c'\n",n,n);
	n=fgetc(stdin);
	printf("n:%02x '%c'\n",n,n);
	n=fgetc(stdin);
	printf("n:%02x '%c'\n",n,n);
	n=fgetc(stdin);
	printf("n:%02x '%c'\n",n,n);
#endif
	return 0;
}
