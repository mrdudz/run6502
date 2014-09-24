
#include <string.h>

int M6502_disassemble(M6502 *mpu, word ip, char buffer[64])
{
  char *s= buffer;
  byte *b= mpu->memory + ip;

  switch (b[0])
    {
#    define _implied							    return 1;
#    define _immediate	sprintf(s, "#%02X",	   b[1]);		    return 2;
#    define _zp		sprintf(s, "%02X",	   b[1]);		    return 2;
#    define _zpx	sprintf(s, "%02X,X",	   b[1]);		    return 2;
#    define _zpy	sprintf(s, "%02X,Y",	   b[1]);		    return 2;
#    define _abs	sprintf(s, "%02X%02X",	   b[2], b[1]);		    return 3;
#    define _absx	sprintf(s, "%02X%02X,X",   b[2], b[1]);		    return 3;
#    define _absy	sprintf(s, "%02X%02X,Y",   b[2], b[1]);		    return 3;
#    define _relative	sprintf(s, "%04X",	   ip + 2 + (int8_t)b[1]);  return 2;
#    define _indirect	sprintf(s, "(%02X%02X)",   b[2], b[1]);		    return 3;
#    define _indzp	sprintf(s, "(%02X)",	   b[1]);		    return 2;
#    define _indx	sprintf(s, "(%02X,X)",	   b[1]);		    return 2;
#    define _indy	sprintf(s, "(%02X),Y",	   b[1]);		    return 2;
#    define _indabsx	sprintf(s, "(%02X%02X,X)", b[2], b[1]);		    return 3;

#    define disassemble(num, name, mode, cycles) case 0x##num: s += sprintf(s, "%s ", #name); _##mode
      do_insns(disassemble);
#    undef _do
    }

  return 0;
}


void M6502_dump(M6502 *mpu, char buffer[64])
{
  M6502_Registers *r= mpu->registers;
  uint8_t p= r->p;
# define P(N,C) (p & (1 << (N)) ? (C) : '-')
  sprintf(buffer, "PC=%04X SP=%04X A=%02X X=%02X Y=%02X P=%02X %c%c%c%c%c%c%c%c",
	  r->pc, 0x0100 + r->s,
	  r->a, r->x, r->y, r->p,
	  P(7,'N'), P(6,'V'), P(5,'?'), P(4,'B'), P(3,'D'), P(2,'I'), P(1,'Z'), P(0,'C'));
# undef P
}

#define LOGLINELEN	0x80
#define LOGLINES	0x40

static char buffer[LOGLINELEN];
//static char logbuffer[LOGLINES][LOGLINELEN];
static M6502_Registers logbuffer[LOGLINES];
static M6502 logmpu;
static int loginit=0;
static int logptr=0;

void M6502_log(M6502 *mpu)
{
//	int i;
//	char *b;

	M6502_Registers *b;

	if(loginit==0)
	{
		loginit=1;
		memset(logbuffer,0,sizeof(logbuffer));
		memcpy(&logmpu,mpu,sizeof(M6502));
	}
/*	
	for(i=0;i<(LOGLINES-1);i++)
	{
		memcpy(logbuffer[i],logbuffer[i+1],LOGLINELEN);
	}
*/
#if 0
	b=&logbuffer[logptr][0];
	logptr++;if(logptr==LOGLINES) logptr=0;

	M6502_dump(mpu,b);
	b+=(strlen(b));
	*b++=' ';
	*b++=' ';
	M6502_disassemble(mpu,mpu->registers->pc,b);
#endif

	b=&logbuffer[logptr];
	logptr++;if(logptr==LOGLINES) logptr=0;
	memcpy(b,mpu->registers,sizeof(M6502_Registers));
}

void M6502_log_printlast(void)
{
//	char *b;
	M6502_Registers *b;
	int ptr;
	ptr=logptr-1;if(ptr<0) ptr=(LOGLINES-1);
//	b=&logbuffer[ptr][0];
	b=&logbuffer[ptr];

	logmpu.registers=b;

	M6502_dump(&logmpu,buffer);
	printf(";%s  ",buffer);
	M6502_disassemble(&logmpu,logmpu.registers->pc,buffer);
	printf("%s\n",buffer);
#if 0	
	if(*b)
	{
		printf(";%s\n",b);
	}
#endif
}

void M6502_log_printall(void)
{
	int i;
//	char *b;
	M6502_Registers *b;
	int ptr;
	ptr=logptr;
	for(i=0;i<(LOGLINES);i++)
	{
//		b=&logbuffer[ptr][0];
		b=&logbuffer[ptr];
		ptr++;if(ptr==LOGLINES) ptr=0;

		logmpu.registers=b;
			
		M6502_dump(&logmpu,buffer);
		printf(";%s  ",buffer);
		M6502_disassemble(&logmpu,logmpu.registers->pc,buffer);
		printf("%s\n",buffer);
		
#if 0
		if(*b)
		{
			printf(";%2d:%s\n",i,b);
		}
#endif
	}
}
