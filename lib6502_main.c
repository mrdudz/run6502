static void outOfMemory(void)
{
  fflush(stdout);
  fprintf(stderr, "\nout of memory\n");
  abort();
}


/* the compiler should elminate all call to this function */

static void oops(void)
{
  fprintf(stderr, "\noops -- instruction dispatch missing\n");
}


void M6502_irq(M6502 *mpu)
{
  if (!(mpu->registers->p & flagI))
    {
      mpu->memory[0x0100 + mpu->registers->s--] = (byte)(mpu->registers->pc >> 8);
      mpu->memory[0x0100 + mpu->registers->s--] = (byte)(mpu->registers->pc & 0xff);
      mpu->memory[0x0100 + mpu->registers->s--] = mpu->registers->p;
      mpu->registers->p &= ~flagB;
      mpu->registers->p |=  flagI;
      mpu->registers->pc = M6502_getVector(mpu, IRQ);
    }
}


void M6502_nmi(M6502 *mpu)
{
  mpu->memory[0x0100 + mpu->registers->s--] = (byte)(mpu->registers->pc >> 8);
  mpu->memory[0x0100 + mpu->registers->s--] = (byte)(mpu->registers->pc & 0xff);
  mpu->memory[0x0100 + mpu->registers->s--] = mpu->registers->p;
  mpu->registers->p &= ~flagB;
  mpu->registers->p |=  flagI;
  mpu->registers->pc = M6502_getVector(mpu, NMI);
}


void M6502_reset(M6502 *mpu)
{
  mpu->registers->p &= ~flagD;
  mpu->registers->p |=  flagI;
  mpu->registers->pc = M6502_getVector(mpu, RST);
}



static unsigned long loops=0;

void M6502_run(M6502 *mpu)
{
	unsigned char buffer[84];
	
//#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
#if 0

  static void *itab[256]= { &&_00, &&_01, &&_02, &&_03, &&_04, &&_05, &&_06, &&_07, &&_08, &&_09, &&_0a, &&_0b, &&_0c, &&_0d, &&_0e, &&_0f,
			    &&_10, &&_11, &&_12, &&_13, &&_14, &&_15, &&_16, &&_17, &&_18, &&_19, &&_1a, &&_1b, &&_1c, &&_1d, &&_1e, &&_1f,
			    &&_20, &&_21, &&_22, &&_23, &&_24, &&_25, &&_26, &&_27, &&_28, &&_29, &&_2a, &&_2b, &&_2c, &&_2d, &&_2e, &&_2f,
			    &&_30, &&_31, &&_32, &&_33, &&_34, &&_35, &&_36, &&_37, &&_38, &&_39, &&_3a, &&_3b, &&_3c, &&_3d, &&_3e, &&_3f,
			    &&_40, &&_41, &&_42, &&_43, &&_44, &&_45, &&_46, &&_47, &&_48, &&_49, &&_4a, &&_4b, &&_4c, &&_4d, &&_4e, &&_4f,
			    &&_50, &&_51, &&_52, &&_53, &&_54, &&_55, &&_56, &&_57, &&_58, &&_59, &&_5a, &&_5b, &&_5c, &&_5d, &&_5e, &&_5f,
			    &&_60, &&_61, &&_62, &&_63, &&_64, &&_65, &&_66, &&_67, &&_68, &&_69, &&_6a, &&_6b, &&_6c, &&_6d, &&_6e, &&_6f,
			    &&_70, &&_71, &&_72, &&_73, &&_74, &&_75, &&_76, &&_77, &&_78, &&_79, &&_7a, &&_7b, &&_7c, &&_7d, &&_7e, &&_7f,
			    &&_80, &&_81, &&_82, &&_83, &&_84, &&_85, &&_86, &&_87, &&_88, &&_89, &&_8a, &&_8b, &&_8c, &&_8d, &&_8e, &&_8f,
			    &&_90, &&_91, &&_92, &&_93, &&_94, &&_95, &&_96, &&_97, &&_98, &&_99, &&_9a, &&_9b, &&_9c, &&_9d, &&_9e, &&_9f,
			    &&_a0, &&_a1, &&_a2, &&_a3, &&_a4, &&_a5, &&_a6, &&_a7, &&_a8, &&_a9, &&_aa, &&_ab, &&_ac, &&_ad, &&_ae, &&_af,
			    &&_b0, &&_b1, &&_b2, &&_b3, &&_b4, &&_b5, &&_b6, &&_b7, &&_b8, &&_b9, &&_ba, &&_bb, &&_bc, &&_bd, &&_be, &&_bf,
			    &&_c0, &&_c1, &&_c2, &&_c3, &&_c4, &&_c5, &&_c6, &&_c7, &&_c8, &&_c9, &&_ca, &&_cb, &&_cc, &&_cd, &&_ce, &&_cf,
			    &&_d0, &&_d1, &&_d2, &&_d3, &&_d4, &&_d5, &&_d6, &&_d7, &&_d8, &&_d9, &&_da, &&_db, &&_dc, &&_dd, &&_de, &&_df,
			    &&_e0, &&_e1, &&_e2, &&_e3, &&_e4, &&_e5, &&_e6, &&_e7, &&_e8, &&_e9, &&_ea, &&_eb, &&_ec, &&_ed, &&_ee, &&_ef,
			    &&_f0, &&_f1, &&_f2, &&_f3, &&_f4, &&_f5, &&_f6, &&_f7, &&_f8, &&_f9, &&_fa, &&_fb, &&_fc, &&_fd, &&_fe, &&_ff };

  register void **itabp= &itab[0];
  register void  *tpc;

# define begin()				fetch();  next()
# define fetch()				tpc= itabp[memory[PC++]]
# define next()					goto *tpc
# define dispatch(num, name, mode, cycles)	_##num: name(cycles, mode) oops();  next()
# define end()
# define end2()

#else /* (!__GNUC__) || (__STRICT_ANSI__) */

# define begin()				for (;;) { switch (memory[PC++]) {
# define fetch()
# define next()					break
# define dispatch(num, name, mode, cycles)	case 0x##num: name(cycles, mode);  next()
# define end()					}
# define end2()					}

#endif

  register byte  *memory= mpu->memory;
  register word   PC;
  word		  ea;
  byte		  A, X, Y, P, S;
  M6502_Callback *readCallback=  mpu->callbacks->read;
  M6502_Callback *writeCallback= mpu->callbacks->write;

# define internalise()	A= mpu->registers->a;  X= mpu->registers->x;  Y= mpu->registers->y;  P= mpu->registers->p;  S= mpu->registers->s;  PC= mpu->registers->pc
# define externalise()	mpu->registers->a= A;  mpu->registers->x= X;  mpu->registers->y= Y;  mpu->registers->p= P;  mpu->registers->s= S;  mpu->registers->pc= PC

  internalise();

  begin();
  do_insns(dispatch);
  end();
#if 1

  externalise();
  M6502_log(mpu);
  
  if(mpu->flags&M6502_TraceExecution)
  {
//  externalise();
//  M6502_dump(mpu,buffer);
//  printf(";%s: ",buffer);
//  M6502_disassemble(mpu,mpu->registers->pc,buffer);
//  printf("%s\n",buffer);
    M6502_log_printlast();
  }
  	loops++;
	if(loops>100000000)
	{
		fprintf(stderr,"[ABORT!]\n");
		exit(0);
	}
#endif
  end2();

# undef begin
# undef internalise
# undef externalise
# undef fetch
# undef next
# undef dispatch
# undef end
# undef end2

  (void)oops;
}

M6502 *M6502_new(M6502_Registers *registers, M6502_Memory memory, M6502_Callbacks *callbacks)
{
  M6502 *mpu= calloc(1, sizeof(M6502));
  if (!mpu) outOfMemory();

  if (!registers)  { registers = (M6502_Registers *)calloc(1, sizeof(M6502_Registers));  mpu->flags |= M6502_RegistersAllocated; }
  if (!memory   )  { memory    = (uint8_t         *)calloc(1, sizeof(M6502_Memory   ));  mpu->flags |= M6502_MemoryAllocated;    }
  if (!callbacks)  { callbacks = (M6502_Callbacks *)calloc(1, sizeof(M6502_Callbacks));  mpu->flags |= M6502_CallbacksAllocated; }

  if (!registers || !memory || !callbacks) outOfMemory();

  mpu->registers = registers;
  mpu->memory    = memory;
  mpu->callbacks = callbacks;

  return mpu;
}


void M6502_delete(M6502 *mpu)
{
  if (mpu->flags & M6502_CallbacksAllocated) free(mpu->callbacks);
  if (mpu->flags & M6502_MemoryAllocated   ) free(mpu->memory);
  if (mpu->flags & M6502_RegistersAllocated) free(mpu->registers);

  free(mpu);
}
