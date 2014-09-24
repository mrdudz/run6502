
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <limits.h>

FILE *outfile=NULL;

limit();

extern void __fastcall__  run6502_putchar(unsigned char);
extern void __fastcall__  run6502_logerror(unsigned char);


#if 0

int int0 = 0;
int int1 = 0;

signed char char0 = 0;
signed char char1 = 0;
signed char char2 = 0;

void sub_char_int(void)
{
  fprintf(outfile,"int0:%04x (5) char0:%02x (2)\n",int0,char0);

  int0 = int0 - char0;

  fprintf(outfile,"int0:%04x (3) char0:%02x (2)\n",int0,char0);
  
  if(int0 != 3)
  fprintf(outfile,"fail1\n");

  if(int0 < char0)
  fprintf(outfile,"fail2\n");

  int0 = int0 - char0;

  fprintf(outfile,"int0:%04x (1) char0:%02x (2)\n",int0,char0);
  
  if(int0 != 1)
  fprintf(outfile,"fail3\n");

  if(int0 > char0)
  fprintf(outfile,"fail4\n");

  int0 = int0 - char0;

  fprintf(outfile,"int0:%04x (-1) char0:%02x (2)\n",int0,char0);
  
  if(int0 != -1)
  fprintf(outfile,"fail5\n");

  	asm("sei");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
  
  if(int0>0)
  {
  	asm("sei");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	  
  fprintf(outfile,"fail6\n");

  	asm("sei");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
  
  }

  	asm("sei");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
  
}
#endif



#if 1
unsigned char result;
signed char char0;

void c_char_gte_lit1(unsigned char expected_result)
{
  result = 0;

	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
  
  if(char0 >= -0x7f)
  {
    result |= 1;
	  run6502_putchar('0');
  }
  run6502_logerror(0);
  
#if 0
  if(char0 >= -1)
  {
	  run6502_putchar('1');
    result |= 2;
  }

  if(char0 >= 0)
  {
	  run6502_putchar('2');
    result |= 4;
  }

  if(char0 >= 1)
  {
	  run6502_putchar('3');
    result |= 8;
  }

  if(char0 >= 0x7e)
  {
	  run6502_putchar('4');
    result |= 16;
  }

    if(char0 >= 0x7f)
  {
	  run6502_putchar('5');
    result |= 32;
  }
#endif
  	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");

#if 0
  if(char0 >= -1)
    result |= 2;

  if(char0 >= 0)
    result |= 4;

  if(char0 >= 1)
    result |= 8;

  if(char0 >= 0x7e)
    result |= 0x10;
  
  if(char0 >= 0x7f)
    result |= 0x20;

#endif
  fprintf(outfile,"char %02x - result: %02x expected: %02x broken: %02x\n",char0,result,expected_result,result^expected_result);
}
#endif


#if 0
signed long long0 = -1;
				  
void bla(void)
{
  	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	
	if(long0>0)
	{
	  run6502_putchar('!');
	}
	
  	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
}
#endif
				  
main()
{

//	bla();
	
	char0=0x7f;
	c_char_gte_lit1(0x3f);

//  int0 = 5;
//  int1 = 4;
//  char0 = 2;

//  sub_char_int();
	
//	limit();   /* ! broken long int compare (?) */

	return 0;
}

#if 0
limit() {
	int i;
#if 0
	for (i = INT_MIN; i <= INT_MIN+5; i++)
/*	for (i = INT_MIN; i <  INT_MIN+6; i++) */
		switch (i) {
			case INT_MIN:	fprintf(outfile,"0\n"); break;
			case INT_MIN+1:	fprintf(outfile,"1\n"); break;
			case INT_MIN+2:	fprintf(outfile,"2\n"); break;
			case INT_MIN+3:	fprintf(outfile,"3\n"); break;
			case INT_MIN+4:	fprintf(outfile,"4\n"); break;
			default:     	fprintf(outfile,"5\n"); break;
		}
#endif

	i = INT_MAX;
	if(i >= INT_MAX-5)
	{
		fprintf(outfile,"ok\n");
	}
	i-=5;
	if(i >= INT_MAX-5)
	{
		fprintf(outfile,"ok\n");
	}
	i--;
	if(i >= INT_MAX-5)
	{
		fprintf(outfile,"err\n");
	}

	i=5;
	if( i >= 6 )
	{
		fprintf(outfile,"err\n");
	}

#if 0
	for (i = INT_MAX; i >= INT_MAX-5; i--)
	{
#if 0
		switch (i) {
			case INT_MAX:	fprintf(outfile,"0\n"); break;
			case INT_MAX-1:	fprintf(outfile,"1\n"); break;
			case INT_MAX-2:	fprintf(outfile,"2\n"); break;
			case INT_MAX-3:	fprintf(outfile,"3\n"); break;
			case INT_MAX-4:	fprintf(outfile,"4\n"); break;
			default:	    fprintf(outfile,"5\n"); break;
		}
#endif		
		fprintf(outfile,"i:%d\n",i);
	}
#endif
}
#endif
									