
./kernel.armc-013.rpi2:     file format elf32-littlearm


Disassembly of section .text:

00008000 <_start>:
_start():
    8000:	e59ff018 	ldr	pc, [pc, #24]	; 8020 <_reset_h>
    8004:	e59ff018 	ldr	pc, [pc, #24]	; 8024 <_undefined_instruction_vector_h>
    8008:	e59ff018 	ldr	pc, [pc, #24]	; 8028 <_software_interrupt_vector_h>
    800c:	e59ff018 	ldr	pc, [pc, #24]	; 802c <_prefetch_abort_vector_h>
    8010:	e59ff018 	ldr	pc, [pc, #24]	; 8030 <_data_abort_vector_h>
    8014:	e59ff018 	ldr	pc, [pc, #24]	; 8034 <_unused_handler_h>
    8018:	e59ff018 	ldr	pc, [pc, #24]	; 8038 <_interrupt_vector_h>
    801c:	e59ff018 	ldr	pc, [pc, #24]	; 803c <_fast_interrupt_vector_h>

00008020 <_reset_h>:
_reset_h():
    8020:	00008040 	andeq	r8, r0, r0, asr #32

00008024 <_undefined_instruction_vector_h>:
_undefined_instruction_vector_h():
    8024:	00008618 	andeq	r8, r0, r8, lsl r6

00008028 <_software_interrupt_vector_h>:
_software_interrupt_vector_h():
    8028:	00008624 	andeq	r8, r0, r4, lsr #12

0000802c <_prefetch_abort_vector_h>:
_prefetch_abort_vector_h():
    802c:	00008630 	andeq	r8, r0, r0, lsr r6

00008030 <_data_abort_vector_h>:
_data_abort_vector_h():
    8030:	00008648 	andeq	r8, r0, r8, asr #12

00008034 <_unused_handler_h>:
_unused_handler_h():
    8034:	00008040 	andeq	r8, r0, r0, asr #32

00008038 <_interrupt_vector_h>:
_interrupt_vector_h():
    8038:	00008660 	andeq	r8, r0, r0, ror #12

0000803c <_fast_interrupt_vector_h>:
_fast_interrupt_vector_h():
    803c:	000086e0 	andeq	r8, r0, r0, ror #13

00008040 <_reset_>:
_reset_():
    8040:	e3a00902 	mov	r0, #32768	; 0x8000
    8044:	e3a01000 	mov	r1, #0
    8048:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    804c:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8050:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8054:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8058:	e3a000d2 	mov	r0, #210	; 0xd2
    805c:	e121f000 	msr	CPSR_c, r0
    8060:	e3a0d63f 	mov	sp, #66060288	; 0x3f00000
    8064:	e3a000d3 	mov	r0, #211	; 0xd3
    8068:	e121f000 	msr	CPSR_c, r0
    806c:	e3a0d902 	mov	sp, #32768	; 0x8000
    8070:	eb000023 	bl	8104 <_cstartup>

00008074 <_inf_loop>:
_inf_loop():
    8074:	eafffffe 	b	8074 <_inf_loop>

00008078 <_get_stack_pointer>:
_get_stack_pointer():
    8078:	e58dd000 	str	sp, [sp]
    807c:	e59d0000 	ldr	r0, [sp]
    8080:	e1a0f00e 	mov	pc, lr

00008084 <_enable_interrupts>:
_enable_interrupts():
    8084:	e10f0000 	mrs	r0, CPSR
    8088:	e3c00080 	bic	r0, r0, #128	; 0x80
    808c:	e121f000 	msr	CPSR_c, r0
    8090:	e1a0f00e 	mov	pc, lr

00008094 <kernel_main>:
kernel_main():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013.c:27

extern void _enable_interrupts(void);

/** Main function - we'll never return from here */
void kernel_main( unsigned int r0, unsigned int r1, unsigned int atags )
{
    8094:	e92d4800 	push	{fp, lr}
    8098:	e28db004 	add	fp, sp, #4
    809c:	e24dd010 	sub	sp, sp, #16
    80a0:	e50b0008 	str	r0, [fp, #-8]
    80a4:	e50b100c 	str	r1, [fp, #-12]
    80a8:	e50b2010 	str	r2, [fp, #-16]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013.c:30
    /* Write 1 to the LED init nibble in the Function Select GPIO
       peripheral register to enable LED pin as an output */
    RPI_GetGpio()->LED_GPFSEL |= ( 1 << LED_GPFBIT);
    80ac:	eb00013b 	bl	85a0 <RPI_GetGpio>
    80b0:	e1a03000 	mov	r3, r0
    80b4:	e5932010 	ldr	r2, [r3, #16]
    80b8:	e3822602 	orr	r2, r2, #2097152	; 0x200000
    80bc:	e5832010 	str	r2, [r3, #16]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013.c:33

    /* Enable the timer interrupt IRQ */
    RPI_GetIrqController()->Enable_Basic_IRQs = RPI_BASIC_ARM_TIMER_IRQ;
    80c0:	eb000145 	bl	85dc <RPI_GetIrqController>
    80c4:	e1a02000 	mov	r2, r0
    80c8:	e3a03001 	mov	r3, #1
    80cc:	e5823018 	str	r3, [r2, #24]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013.c:37

    /* Setup the system timer interrupt */
    /* Timer frequency = Clk/256 * 0x400 */
    RPI_GetArmTimer()->Load = 0x400;
    80d0:	eb000123 	bl	8564 <RPI_GetArmTimer>
    80d4:	e1a02000 	mov	r2, r0
    80d8:	e3a03b01 	mov	r3, #1024	; 0x400
    80dc:	e5823000 	str	r3, [r2]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013.c:40

    /* Setup the ARM Timer */
    RPI_GetArmTimer()->Control =
    80e0:	eb00011f 	bl	8564 <RPI_GetArmTimer>
    80e4:	e1a02000 	mov	r2, r0
    80e8:	e3a030aa 	mov	r3, #170	; 0xaa
    80ec:	e5823008 	str	r3, [r2, #8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013.c:47
            RPI_ARMTIMER_CTRL_ENABLE |
            RPI_ARMTIMER_CTRL_INT_ENABLE |
            RPI_ARMTIMER_CTRL_PRESCALE_256;

    /* Enable interrupts! */
    _enable_interrupts();
    80f0:	ebffffe3 	bl	8084 <_enable_interrupts>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013.c:54
    /* Never exit as there is no OS to exit to! */
    /*while(1)
    {

    }*/
    __asm("wfi");
    80f4:	e320f003 	wfi
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013.c:55
}
    80f8:	e320f000 	nop	{0}
    80fc:	e24bd004 	sub	sp, fp, #4
    8100:	e8bd8800 	pop	{fp, pc}

00008104 <_cstartup>:
_cstartup():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstartup.c:17
extern int __bss_end__;

extern void kernel_main( unsigned int r0, unsigned int r1, unsigned int atags );

void _cstartup( unsigned int r0, unsigned int r1, unsigned int r2 )
{
    8104:	e92d4800 	push	{fp, lr}
    8108:	e28db004 	add	fp, sp, #4
    810c:	e24dd018 	sub	sp, sp, #24
    8110:	e50b0010 	str	r0, [fp, #-16]
    8114:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8118:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstartup.c:18
    int* bss = &__bss_start__;
    811c:	e30938f8 	movw	r3, #39160	; 0x98f8
    8120:	e3403001 	movt	r3, #1
    8124:	e50b3008 	str	r3, [fp, #-8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstartup.c:19
    int* bss_end = &__bss_end__;
    8128:	e3093960 	movw	r3, #39264	; 0x9960
    812c:	e3403001 	movt	r3, #1
    8130:	e50b300c 	str	r3, [fp, #-12]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstartup.c:30
            BSS section

        See https://sourceware.org/newlib/libc.html#Stubs for further
            information on the c-library stubs
    */
    while( bss < bss_end )
    8134:	ea000004 	b	814c <_cstartup+0x48>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstartup.c:31
        *bss++ = 0;
    8138:	e51b3008 	ldr	r3, [fp, #-8]
    813c:	e2832004 	add	r2, r3, #4
    8140:	e50b2008 	str	r2, [fp, #-8]
    8144:	e3a02000 	mov	r2, #0
    8148:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstartup.c:30
    while( bss < bss_end )
    814c:	e51b2008 	ldr	r2, [fp, #-8]
    8150:	e51b300c 	ldr	r3, [fp, #-12]
    8154:	e1520003 	cmp	r2, r3
    8158:	3afffff6 	bcc	8138 <_cstartup+0x34>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstartup.c:34

    /* We should never return from main ... */
    kernel_main( r0, r1, r2 );
    815c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8160:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    8164:	e51b0010 	ldr	r0, [fp, #-16]
    8168:	ebffffc9 	bl	8094 <kernel_main>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstartup.c:37 (discriminator 1)

    /* ... but if we do, safely trap here */
    while(1)
    816c:	eafffffe 	b	816c <_cstartup+0x68>

00008170 <_exit>:
_exit():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:57


/* Never return from _exit as there's no OS to exit to, so instead we trap
   here */
void _exit( int status )
{
    8170:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8174:	e28db000 	add	fp, sp, #0
    8178:	e24dd00c 	sub	sp, sp, #12
    817c:	e50b0008 	str	r0, [fp, #-8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:61 (discriminator 1)
    /* Stop the compiler complaining about unused variables by "using" it */
    (void)status;

    while(1)
    8180:	eafffffe 	b	8180 <_exit+0x10>

00008184 <close>:
close():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:71


/* There's currently no implementation of a file system because there's no
   file system! */
int close( int file )
{
    8184:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8188:	e28db000 	add	fp, sp, #0
    818c:	e24dd00c 	sub	sp, sp, #12
    8190:	e50b0008 	str	r0, [fp, #-8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:72
    return -1;
    8194:	e3e03000 	mvn	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:73
}
    8198:	e1a00003 	mov	r0, r3
    819c:	e28bd000 	add	sp, fp, #0
    81a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    81a4:	e12fff1e 	bx	lr

000081a8 <execve>:
execve():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:79


/* Transfer control to a new process. Minimal implementation (for a system
   without processes): */
int execve( char *name, char **argv, char **env )
{
    81a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81ac:	e28db000 	add	fp, sp, #0
    81b0:	e24dd014 	sub	sp, sp, #20
    81b4:	e50b0008 	str	r0, [fp, #-8]
    81b8:	e50b100c 	str	r1, [fp, #-12]
    81bc:	e50b2010 	str	r2, [fp, #-16]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:80
    errno = ENOMEM;
    81c0:	e3093938 	movw	r3, #39224	; 0x9938
    81c4:	e3403001 	movt	r3, #1
    81c8:	e3a0200c 	mov	r2, #12
    81cc:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:81
    return -1;
    81d0:	e3e03000 	mvn	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:82
}
    81d4:	e1a00003 	mov	r0, r3
    81d8:	e28bd000 	add	sp, fp, #0
    81dc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    81e0:	e12fff1e 	bx	lr

000081e4 <fork>:
fork():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:88


/* Create a new process. Minimal implementation (for a system without
   processes): */
int fork( void )
{
    81e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81e8:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:89
    errno = EAGAIN;
    81ec:	e3093938 	movw	r3, #39224	; 0x9938
    81f0:	e3403001 	movt	r3, #1
    81f4:	e3a0200b 	mov	r2, #11
    81f8:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:90
    return -1;
    81fc:	e3e03000 	mvn	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:91
}
    8200:	e1a00003 	mov	r0, r3
    8204:	e28bd000 	add	sp, fp, #0
    8208:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    820c:	e12fff1e 	bx	lr

00008210 <fstat>:
fstat():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:99
/* Status of an open file. For consistency with other minimal implementations
   in these examples, all files are regarded as character special devices. The
   sys/stat.h header file required is distributed in the include subdirectory
   for this C library. */
int fstat( int file, struct stat *st )
{
    8210:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8214:	e28db000 	add	fp, sp, #0
    8218:	e24dd00c 	sub	sp, sp, #12
    821c:	e50b0008 	str	r0, [fp, #-8]
    8220:	e50b100c 	str	r1, [fp, #-12]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:100
    st->st_mode = S_IFCHR;
    8224:	e51b300c 	ldr	r3, [fp, #-12]
    8228:	e3a02a02 	mov	r2, #8192	; 0x2000
    822c:	e5832004 	str	r2, [r3, #4]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:101
    return 0;
    8230:	e3a03000 	mov	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:102
}
    8234:	e1a00003 	mov	r0, r3
    8238:	e28bd000 	add	sp, fp, #0
    823c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8240:	e12fff1e 	bx	lr

00008244 <getpid>:
getpid():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:109

/* Process-ID; this is sometimes used to generate strings unlikely to conflict
   with other processes. Minimal implementation, for a system without
   processes: */
int getpid( void )
{
    8244:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8248:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:110
    return 1;
    824c:	e3a03001 	mov	r3, #1
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:111
}
    8250:	e1a00003 	mov	r0, r3
    8254:	e28bd000 	add	sp, fp, #0
    8258:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    825c:	e12fff1e 	bx	lr

00008260 <isatty>:
isatty():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:118

/* Query whether output stream is a terminal. For consistency with the other
   minimal implementations, which only support output to stdout, this minimal
   implementation is suggested: */
int isatty(int file)
{
    8260:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8264:	e28db000 	add	fp, sp, #0
    8268:	e24dd00c 	sub	sp, sp, #12
    826c:	e50b0008 	str	r0, [fp, #-8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:119
    return 1;
    8270:	e3a03001 	mov	r3, #1
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:120
}
    8274:	e1a00003 	mov	r0, r3
    8278:	e28bd000 	add	sp, fp, #0
    827c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8280:	e12fff1e 	bx	lr

00008284 <kill>:
kill():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:125


/* Send a signal. Minimal implementation: */
int kill( int pid, int sig )
{
    8284:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8288:	e28db000 	add	fp, sp, #0
    828c:	e24dd00c 	sub	sp, sp, #12
    8290:	e50b0008 	str	r0, [fp, #-8]
    8294:	e50b100c 	str	r1, [fp, #-12]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:126
    errno = EINVAL;
    8298:	e3093938 	movw	r3, #39224	; 0x9938
    829c:	e3403001 	movt	r3, #1
    82a0:	e3a02016 	mov	r2, #22
    82a4:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:127
    return -1;
    82a8:	e3e03000 	mvn	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:128
}
    82ac:	e1a00003 	mov	r0, r3
    82b0:	e28bd000 	add	sp, fp, #0
    82b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    82b8:	e12fff1e 	bx	lr

000082bc <link>:
link():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:133


/* Establish a new name for an existing file. Minimal implementation: */
int link( char *old, char *new )
{
    82bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    82c0:	e28db000 	add	fp, sp, #0
    82c4:	e24dd00c 	sub	sp, sp, #12
    82c8:	e50b0008 	str	r0, [fp, #-8]
    82cc:	e50b100c 	str	r1, [fp, #-12]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:134
    errno = EMLINK;
    82d0:	e3093938 	movw	r3, #39224	; 0x9938
    82d4:	e3403001 	movt	r3, #1
    82d8:	e3a0201f 	mov	r2, #31
    82dc:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:135
    return -1;
    82e0:	e3e03000 	mvn	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:136
}
    82e4:	e1a00003 	mov	r0, r3
    82e8:	e28bd000 	add	sp, fp, #0
    82ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    82f0:	e12fff1e 	bx	lr

000082f4 <lseek>:
lseek():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:141


/* Set position in a file. Minimal implementation: */
int lseek(int file, int ptr, int dir)
{
    82f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    82f8:	e28db000 	add	fp, sp, #0
    82fc:	e24dd014 	sub	sp, sp, #20
    8300:	e50b0008 	str	r0, [fp, #-8]
    8304:	e50b100c 	str	r1, [fp, #-12]
    8308:	e50b2010 	str	r2, [fp, #-16]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:142
    return 0;
    830c:	e3a03000 	mov	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:143
}
    8310:	e1a00003 	mov	r0, r3
    8314:	e28bd000 	add	sp, fp, #0
    8318:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    831c:	e12fff1e 	bx	lr

00008320 <open>:
open():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:148


/* Open a file. Minimal implementation: */
int open( const char *name, int flags, int mode )
{
    8320:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8324:	e28db000 	add	fp, sp, #0
    8328:	e24dd014 	sub	sp, sp, #20
    832c:	e50b0008 	str	r0, [fp, #-8]
    8330:	e50b100c 	str	r1, [fp, #-12]
    8334:	e50b2010 	str	r2, [fp, #-16]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:149
    return -1;
    8338:	e3e03000 	mvn	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:150
}
    833c:	e1a00003 	mov	r0, r3
    8340:	e28bd000 	add	sp, fp, #0
    8344:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8348:	e12fff1e 	bx	lr

0000834c <read>:
read():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:155


/* Read from a file. Minimal implementation: */
int read( int file, char *ptr, int len )
{
    834c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8350:	e28db000 	add	fp, sp, #0
    8354:	e24dd014 	sub	sp, sp, #20
    8358:	e50b0008 	str	r0, [fp, #-8]
    835c:	e50b100c 	str	r1, [fp, #-12]
    8360:	e50b2010 	str	r2, [fp, #-16]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:156
    return 0;
    8364:	e3a03000 	mov	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:157
}
    8368:	e1a00003 	mov	r0, r3
    836c:	e28bd000 	add	sp, fp, #0
    8370:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8374:	e12fff1e 	bx	lr

00008378 <_sbrk>:
_sbrk():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:165
/* Increase program data space. As malloc and related functions depend on this,
   it is useful to have a working implementation. The following suffices for a
   standalone system; it exploits the symbol _end automatically defined by the
   GNU linker. */
caddr_t _sbrk( int incr )
{
    8378:	e92d4810 	push	{r4, fp, lr}
    837c:	e28db008 	add	fp, sp, #8
    8380:	e24dd014 	sub	sp, sp, #20
    8384:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:170
    extern char _end;
    static char* heap_end;
    char* prev_heap_end;

    if( heap_end == 0 )
    8388:	e30938fc 	movw	r3, #39164	; 0x98fc
    838c:	e3403001 	movt	r3, #1
    8390:	e5933000 	ldr	r3, [r3]
    8394:	e3530000 	cmp	r3, #0
    8398:	1a000004 	bne	83b0 <_sbrk+0x38>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:171
        heap_end = &_end;
    839c:	e30938fc 	movw	r3, #39164	; 0x98fc
    83a0:	e3403001 	movt	r3, #1
    83a4:	e3092960 	movw	r2, #39264	; 0x9960
    83a8:	e3402001 	movt	r2, #1
    83ac:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:173

     prev_heap_end = heap_end;
    83b0:	e30938fc 	movw	r3, #39164	; 0x98fc
    83b4:	e3403001 	movt	r3, #1
    83b8:	e5933000 	ldr	r3, [r3]
    83bc:	e50b3010 	str	r3, [fp, #-16]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:175

     if( ( heap_end + incr ) > _get_stack_pointer() )
    83c0:	e30938fc 	movw	r3, #39164	; 0x98fc
    83c4:	e3403001 	movt	r3, #1
    83c8:	e5932000 	ldr	r2, [r3]
    83cc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    83d0:	e0824003 	add	r4, r2, r3
    83d4:	ebffff27 	bl	8078 <_get_stack_pointer>
    83d8:	e1a03000 	mov	r3, r0
    83dc:	e1540003 	cmp	r4, r3
    83e0:	9a000000 	bls	83e8 <_sbrk+0x70>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:177 (discriminator 1)
     {
        while( 1 ) { /* TRAP HERE! */ }
    83e4:	eafffffe 	b	83e4 <_sbrk+0x6c>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:180
     }

     heap_end += incr;
    83e8:	e30938fc 	movw	r3, #39164	; 0x98fc
    83ec:	e3403001 	movt	r3, #1
    83f0:	e5932000 	ldr	r2, [r3]
    83f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    83f8:	e0822003 	add	r2, r2, r3
    83fc:	e30938fc 	movw	r3, #39164	; 0x98fc
    8400:	e3403001 	movt	r3, #1
    8404:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:181
     return (caddr_t)prev_heap_end;
    8408:	e51b3010 	ldr	r3, [fp, #-16]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:182
}
    840c:	e1a00003 	mov	r0, r3
    8410:	e24bd008 	sub	sp, fp, #8
    8414:	e8bd8810 	pop	{r4, fp, pc}

00008418 <stat>:
stat():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:187


/* Status of a file (by name). Minimal implementation: */
int stat( const char *file, struct stat *st )
{
    8418:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    841c:	e28db000 	add	fp, sp, #0
    8420:	e24dd00c 	sub	sp, sp, #12
    8424:	e50b0008 	str	r0, [fp, #-8]
    8428:	e50b100c 	str	r1, [fp, #-12]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:188
    st->st_mode = S_IFCHR;
    842c:	e51b300c 	ldr	r3, [fp, #-12]
    8430:	e3a02a02 	mov	r2, #8192	; 0x2000
    8434:	e5832004 	str	r2, [r3, #4]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:189
    return 0;
    8438:	e3a03000 	mov	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:190
}
    843c:	e1a00003 	mov	r0, r3
    8440:	e28bd000 	add	sp, fp, #0
    8444:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8448:	e12fff1e 	bx	lr

0000844c <times>:
times():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:195


/* Timing information for current process. Minimal implementation: */
clock_t times( struct tms *buf )
{
    844c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8450:	e28db000 	add	fp, sp, #0
    8454:	e24dd00c 	sub	sp, sp, #12
    8458:	e50b0008 	str	r0, [fp, #-8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:196
    return -1;
    845c:	e3e03000 	mvn	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:197
}
    8460:	e1a00003 	mov	r0, r3
    8464:	e28bd000 	add	sp, fp, #0
    8468:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    846c:	e12fff1e 	bx	lr

00008470 <unlink>:
unlink():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:202


/* Remove a file's directory entry. Minimal implementation: */
int unlink( char *name )
{
    8470:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8474:	e28db000 	add	fp, sp, #0
    8478:	e24dd00c 	sub	sp, sp, #12
    847c:	e50b0008 	str	r0, [fp, #-8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:203
    errno = ENOENT;
    8480:	e3093938 	movw	r3, #39224	; 0x9938
    8484:	e3403001 	movt	r3, #1
    8488:	e3a02002 	mov	r2, #2
    848c:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:204
    return -1;
    8490:	e3e03000 	mvn	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:205
}
    8494:	e1a00003 	mov	r0, r3
    8498:	e28bd000 	add	sp, fp, #0
    849c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    84a0:	e12fff1e 	bx	lr

000084a4 <wait>:
wait():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:210


/* Wait for a child process. Minimal implementation: */
int wait( int *status )
{
    84a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    84a8:	e28db000 	add	fp, sp, #0
    84ac:	e24dd00c 	sub	sp, sp, #12
    84b0:	e50b0008 	str	r0, [fp, #-8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:211
    errno = ECHILD;
    84b4:	e3093938 	movw	r3, #39224	; 0x9938
    84b8:	e3403001 	movt	r3, #1
    84bc:	e3a0200a 	mov	r2, #10
    84c0:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:212
    return -1;
    84c4:	e3e03000 	mvn	r3, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:213
}
    84c8:	e1a00003 	mov	r0, r3
    84cc:	e28bd000 	add	sp, fp, #0
    84d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    84d4:	e12fff1e 	bx	lr

000084d8 <outbyte>:
outbyte():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:217


void outbyte( char b )
{
    84d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    84dc:	e28db000 	add	fp, sp, #0
    84e0:	e24dd00c 	sub	sp, sp, #12
    84e4:	e1a03000 	mov	r3, r0
    84e8:	e54b3005 	strb	r3, [fp, #-5]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:219
    (void)b;
}
    84ec:	e320f000 	nop	{0}
    84f0:	e28bd000 	add	sp, fp, #0
    84f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    84f8:	e12fff1e 	bx	lr

000084fc <write>:
write():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:229
   capable of doing this. The following minimal implementation is an
   incomplete example; it relies on a outbyte subroutine (not shown; typically,
   you must write this in assembler from examples provided by your hardware
   manufacturer) to actually perform the output. */
int write( int file, char *ptr, int len )
{
    84fc:	e92d4800 	push	{fp, lr}
    8500:	e28db004 	add	fp, sp, #4
    8504:	e24dd018 	sub	sp, sp, #24
    8508:	e50b0010 	str	r0, [fp, #-16]
    850c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8510:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:232
    int todo;

    for( todo = 0; todo < len; todo++ )
    8514:	e3a03000 	mov	r3, #0
    8518:	e50b3008 	str	r3, [fp, #-8]
    851c:	ea000008 	b	8544 <write+0x48>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:233 (discriminator 3)
      outbyte(*ptr++);
    8520:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8524:	e2832001 	add	r2, r3, #1
    8528:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
    852c:	e5d33000 	ldrb	r3, [r3]
    8530:	e1a00003 	mov	r0, r3
    8534:	ebffffe7 	bl	84d8 <outbyte>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:232 (discriminator 3)
    for( todo = 0; todo < len; todo++ )
    8538:	e51b3008 	ldr	r3, [fp, #-8]
    853c:	e2833001 	add	r3, r3, #1
    8540:	e50b3008 	str	r3, [fp, #-8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:232 (discriminator 1)
    8544:	e51b2008 	ldr	r2, [fp, #-8]
    8548:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    854c:	e1520003 	cmp	r2, r3
    8550:	bafffff2 	blt	8520 <write+0x24>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:235

    return len;
    8554:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:236
}
    8558:	e1a00003 	mov	r0, r3
    855c:	e24bd004 	sub	sp, fp, #4
    8560:	e8bd8800 	pop	{fp, pc}

00008564 <RPI_GetArmTimer>:
RPI_GetArmTimer():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-armtimer.c:17
#include "rpi-armtimer.h"

static rpi_arm_timer_t* rpiArmTimer = (rpi_arm_timer_t*)RPI_ARMTIMER_BASE;

rpi_arm_timer_t* RPI_GetArmTimer(void)
{
    8564:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8568:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-armtimer.c:18
    return rpiArmTimer;
    856c:	e30930ac 	movw	r3, #37036	; 0x90ac
    8570:	e3403001 	movt	r3, #1
    8574:	e5933000 	ldr	r3, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-armtimer.c:19
}
    8578:	e1a00003 	mov	r0, r3
    857c:	e28bd000 	add	sp, fp, #0
    8580:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8584:	e12fff1e 	bx	lr

00008588 <RPI_ArmTimerInit>:
RPI_ArmTimerInit():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-armtimer.c:22

void RPI_ArmTimerInit(void)
{
    8588:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    858c:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-armtimer.c:24

}
    8590:	e320f000 	nop	{0}
    8594:	e28bd000 	add	sp, fp, #0
    8598:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    859c:	e12fff1e 	bx	lr

000085a0 <RPI_GetGpio>:
RPI_GetGpio():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-gpio.c:17
#include "rpi-gpio.h"

static rpi_gpio_t* rpiGpio = (rpi_gpio_t*)RPI_GPIO_BASE;

rpi_gpio_t* RPI_GetGpio(void)
{
    85a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85a4:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-gpio.c:18
    return rpiGpio;
    85a8:	e30930b0 	movw	r3, #37040	; 0x90b0
    85ac:	e3403001 	movt	r3, #1
    85b0:	e5933000 	ldr	r3, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-gpio.c:19
}
    85b4:	e1a00003 	mov	r0, r3
    85b8:	e28bd000 	add	sp, fp, #0
    85bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85c0:	e12fff1e 	bx	lr

000085c4 <RPI_GpioInit>:
RPI_GpioInit():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-gpio.c:22

void RPI_GpioInit(void)
{
    85c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85c8:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-gpio.c:24

}
    85cc:	e320f000 	nop	{0}
    85d0:	e28bd000 	add	sp, fp, #0
    85d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85d8:	e12fff1e 	bx	lr

000085dc <RPI_GetIrqController>:
RPI_GetIrqController():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:28

/**
    @brief Return the IRQ Controller register set
*/
rpi_irq_controller_t* RPI_GetIrqController( void )
{
    85dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    85e0:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:29
    return rpiIRQController;
    85e4:	e30930b4 	movw	r3, #37044	; 0x90b4
    85e8:	e3403001 	movt	r3, #1
    85ec:	e5933000 	ldr	r3, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:30
}
    85f0:	e1a00003 	mov	r0, r3
    85f4:	e28bd000 	add	sp, fp, #0
    85f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85fc:	e12fff1e 	bx	lr

00008600 <reset_vector>:
reset_vector():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:41
    This can never be called, since an ARM core reset would also reset the
    GPU and therefore cause the GPU to start running code again until
    the ARM is handed control at the end of boot loading
*/
void __attribute__((interrupt("ABORT"))) reset_vector(void)
{
    8600:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8604:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:43

}
    8608:	e320f000 	nop	{0}
    860c:	e28bd000 	add	sp, fp, #0
    8610:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8614:	e25ef004 	subs	pc, lr, #4

00008618 <undefined_instruction_vector>:
undefined_instruction_vector():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:52

    If an undefined intstruction is encountered, the CPU will start
    executing this function. Just trap here as a debug solution.
*/
void __attribute__((interrupt("UNDEF"))) undefined_instruction_vector(void)
{
    8618:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    861c:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:53 (discriminator 1)
    while( 1 )
    8620:	eafffffe 	b	8620 <undefined_instruction_vector+0x8>

00008624 <software_interrupt_vector>:
software_interrupt_vector():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:67

    The CPU will start executing this function. Just trap here as a debug
    solution.
*/
void __attribute__((interrupt("SWI"))) software_interrupt_vector(void)
{
    8624:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8628:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:68 (discriminator 1)
    while( 1 )
    862c:	eafffffe 	b	862c <software_interrupt_vector+0x8>

00008630 <prefetch_abort_vector>:
prefetch_abort_vector():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:82

    The CPU will start executing this function. Just trap here as a debug
    solution.
*/
void __attribute__((interrupt("ABORT"))) prefetch_abort_vector(void)
{
    8630:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8634:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:84

}
    8638:	e320f000 	nop	{0}
    863c:	e28bd000 	add	sp, fp, #0
    8640:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8644:	e25ef004 	subs	pc, lr, #4

00008648 <data_abort_vector>:
data_abort_vector():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:94

    The CPU will start executing this function. Just trap here as a debug
    solution.
*/
void __attribute__((interrupt("ABORT"))) data_abort_vector(void)
{
    8648:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    864c:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:96

}
    8650:	e320f000 	nop	{0}
    8654:	e28bd000 	add	sp, fp, #0
    8658:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    865c:	e25ef004 	subs	pc, lr, #4

00008660 <interrupt_vector>:
interrupt_vector():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:108
    up to the handler to determine the source of the interrupt and most
    importantly clear the interrupt flag so that the interrupt won't
    immediately put us back into the start of the handler again.
*/
void __attribute__((interrupt("IRQ"))) interrupt_vector(void)
{
    8660:	e24ee004 	sub	lr, lr, #4
    8664:	e92d581f 	push	{r0, r1, r2, r3, r4, fp, ip, lr}
    8668:	e28db01c 	add	fp, sp, #28
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:114
    static int lit = 0;

    /* Clear the ARM Timer interrupt - it's the only interrupt we have
       enabled, so we want don't have to work out which interrupt source
       caused us to interrupt */
    RPI_GetArmTimer()->IRQClear = 1;
    866c:	ebffffbc 	bl	8564 <RPI_GetArmTimer>
    8670:	e1a02000 	mov	r2, r0
    8674:	e3a03001 	mov	r3, #1
    8678:	e582300c 	str	r3, [r2, #12]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:117

    /* Flip the LED */
    if( lit )
    867c:	e3093900 	movw	r3, #39168	; 0x9900
    8680:	e3403001 	movt	r3, #1
    8684:	e5933000 	ldr	r3, [r3]
    8688:	e3530000 	cmp	r3, #0
    868c:	0a000008 	beq	86b4 <interrupt_vector+0x54>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:119
    {
        LED_OFF();
    8690:	ebffffc2 	bl	85a0 <RPI_GetGpio>
    8694:	e1a02000 	mov	r2, r0
    8698:	e3a03902 	mov	r3, #32768	; 0x8000
    869c:	e582302c 	str	r3, [r2, #44]	; 0x2c
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:120
        lit = 0;
    86a0:	e3093900 	movw	r3, #39168	; 0x9900
    86a4:	e3403001 	movt	r3, #1
    86a8:	e3a02000 	mov	r2, #0
    86ac:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:127
    else
    {
        LED_ON();
        lit = 1;
    }
}
    86b0:	ea000007 	b	86d4 <interrupt_vector+0x74>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:124
        LED_ON();
    86b4:	ebffffb9 	bl	85a0 <RPI_GetGpio>
    86b8:	e1a02000 	mov	r2, r0
    86bc:	e3a03902 	mov	r3, #32768	; 0x8000
    86c0:	e5823020 	str	r3, [r2, #32]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:125
        lit = 1;
    86c4:	e3093900 	movw	r3, #39168	; 0x9900
    86c8:	e3403001 	movt	r3, #1
    86cc:	e3a02001 	mov	r2, #1
    86d0:	e5832000 	str	r2, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:127
}
    86d4:	e320f000 	nop	{0}
    86d8:	e24bd01c 	sub	sp, fp, #28
    86dc:	e8fd981f 	ldm	sp!, {r0, r1, r2, r3, r4, fp, ip, pc}^

000086e0 <fast_interrupt_vector>:
fast_interrupt_vector():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:156
    being the epilogue code. For the FIQ interrupt handler this is nearly
    empty because the CPU has switched to a fresh set of registers and so has
    not altered the main set of registers.
*/
void __attribute__((interrupt("FIQ"))) fast_interrupt_vector(void)
{
    86e0:	e24db004 	sub	fp, sp, #4
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:158

}
    86e4:	e320f000 	nop	{0}
    86e8:	e28bd004 	add	sp, fp, #4
    86ec:	e25ef004 	subs	pc, lr, #4

000086f0 <RPI_GetSystemTimer>:
RPI_GetSystemTimer():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-systimer.c:17
#include "rpi-systimer.h"

static rpi_sys_timer_t* rpiSystemTimer = (rpi_sys_timer_t*)RPI_SYSTIMER_BASE;

rpi_sys_timer_t* RPI_GetSystemTimer(void)
{
    86f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    86f4:	e28db000 	add	fp, sp, #0
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-systimer.c:18
    return rpiSystemTimer;
    86f8:	e30930b8 	movw	r3, #37048	; 0x90b8
    86fc:	e3403001 	movt	r3, #1
    8700:	e5933000 	ldr	r3, [r3]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-systimer.c:19
}
    8704:	e1a00003 	mov	r0, r3
    8708:	e28bd000 	add	sp, fp, #0
    870c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8710:	e12fff1e 	bx	lr

00008714 <RPI_WaitMicroSeconds>:
RPI_WaitMicroSeconds():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-systimer.c:22

void RPI_WaitMicroSeconds( uint32_t us )
{
    8714:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8718:	e28db000 	add	fp, sp, #0
    871c:	e24dd014 	sub	sp, sp, #20
    8720:	e50b0010 	str	r0, [fp, #-16]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-systimer.c:23
    volatile uint32_t ts = rpiSystemTimer->counter_lo;
    8724:	e30930b8 	movw	r3, #37048	; 0x90b8
    8728:	e3403001 	movt	r3, #1
    872c:	e5933000 	ldr	r3, [r3]
    8730:	e5933004 	ldr	r3, [r3, #4]
    8734:	e50b3008 	str	r3, [fp, #-8]
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-systimer.c:25

    while( ( rpiSystemTimer->counter_lo - ts ) < us )
    8738:	e320f000 	nop	{0}
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-systimer.c:25 (discriminator 1)
    873c:	e30930b8 	movw	r3, #37048	; 0x90b8
    8740:	e3403001 	movt	r3, #1
    8744:	e5933000 	ldr	r3, [r3]
    8748:	e5932004 	ldr	r2, [r3, #4]
    874c:	e51b3008 	ldr	r3, [fp, #-8]
    8750:	e0423003 	sub	r3, r2, r3
    8754:	e51b2010 	ldr	r2, [fp, #-16]
    8758:	e1520003 	cmp	r2, r3
    875c:	8afffff6 	bhi	873c <RPI_WaitMicroSeconds+0x28>
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-systimer.c:29
    {
        /* BLANK */
    }
}
    8760:	e320f000 	nop	{0}
    8764:	e28bd000 	add	sp, fp, #0
    8768:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    876c:	e12fff1e 	bx	lr

00008770 <cleanup_glue>:
cleanup_glue():
    8770:	b538      	push	{r3, r4, r5, lr}
    8772:	460c      	mov	r4, r1
    8774:	6809      	ldr	r1, [r1, #0]
    8776:	4605      	mov	r5, r0
    8778:	b929      	cbnz	r1, 8786 <cleanup_glue+0x16>
    877a:	4621      	mov	r1, r4
    877c:	4628      	mov	r0, r5
    877e:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    8782:	f000 b8a3 	b.w	88cc <_free_r>
    8786:	f7ff fff3 	bl	8770 <cleanup_glue>
    878a:	4621      	mov	r1, r4
    878c:	4628      	mov	r0, r5
    878e:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    8792:	f000 b89b 	b.w	88cc <_free_r>
    8796:	bf00      	nop

00008798 <_reclaim_reent>:
_reclaim_reent():
    8798:	f249 03bc 	movw	r3, #37052	; 0x90bc
    879c:	f2c0 0301 	movt	r3, #1
    87a0:	681b      	ldr	r3, [r3, #0]
    87a2:	4283      	cmp	r3, r0
    87a4:	d03b      	beq.n	881e <_reclaim_reent+0x86>
    87a6:	6cc3      	ldr	r3, [r0, #76]	; 0x4c
    87a8:	b570      	push	{r4, r5, r6, lr}
    87aa:	4605      	mov	r5, r0
    87ac:	b18b      	cbz	r3, 87d2 <_reclaim_reent+0x3a>
    87ae:	2600      	movs	r6, #0
    87b0:	5999      	ldr	r1, [r3, r6]
    87b2:	b139      	cbz	r1, 87c4 <_reclaim_reent+0x2c>
    87b4:	680c      	ldr	r4, [r1, #0]
    87b6:	4628      	mov	r0, r5
    87b8:	f000 f888 	bl	88cc <_free_r>
    87bc:	4621      	mov	r1, r4
    87be:	2c00      	cmp	r4, #0
    87c0:	d1f8      	bne.n	87b4 <_reclaim_reent+0x1c>
    87c2:	6ceb      	ldr	r3, [r5, #76]	; 0x4c
    87c4:	3604      	adds	r6, #4
    87c6:	2e80      	cmp	r6, #128	; 0x80
    87c8:	d1f2      	bne.n	87b0 <_reclaim_reent+0x18>
    87ca:	4619      	mov	r1, r3
    87cc:	4628      	mov	r0, r5
    87ce:	f000 f87d 	bl	88cc <_free_r>
    87d2:	6c29      	ldr	r1, [r5, #64]	; 0x40
    87d4:	b111      	cbz	r1, 87dc <_reclaim_reent+0x44>
    87d6:	4628      	mov	r0, r5
    87d8:	f000 f878 	bl	88cc <_free_r>
    87dc:	f8d5 1148 	ldr.w	r1, [r5, #328]	; 0x148
    87e0:	b151      	cbz	r1, 87f8 <_reclaim_reent+0x60>
    87e2:	f505 76a6 	add.w	r6, r5, #332	; 0x14c
    87e6:	42b1      	cmp	r1, r6
    87e8:	d006      	beq.n	87f8 <_reclaim_reent+0x60>
    87ea:	680c      	ldr	r4, [r1, #0]
    87ec:	4628      	mov	r0, r5
    87ee:	f000 f86d 	bl	88cc <_free_r>
    87f2:	42a6      	cmp	r6, r4
    87f4:	4621      	mov	r1, r4
    87f6:	d1f8      	bne.n	87ea <_reclaim_reent+0x52>
    87f8:	6d69      	ldr	r1, [r5, #84]	; 0x54
    87fa:	b111      	cbz	r1, 8802 <_reclaim_reent+0x6a>
    87fc:	4628      	mov	r0, r5
    87fe:	f000 f865 	bl	88cc <_free_r>
    8802:	6bab      	ldr	r3, [r5, #56]	; 0x38
    8804:	b153      	cbz	r3, 881c <_reclaim_reent+0x84>
    8806:	6beb      	ldr	r3, [r5, #60]	; 0x3c
    8808:	4628      	mov	r0, r5
    880a:	4798      	blx	r3
    880c:	f8d5 12e0 	ldr.w	r1, [r5, #736]	; 0x2e0
    8810:	b121      	cbz	r1, 881c <_reclaim_reent+0x84>
    8812:	4628      	mov	r0, r5
    8814:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    8818:	f7ff bfaa 	b.w	8770 <cleanup_glue>
    881c:	bd70      	pop	{r4, r5, r6, pc}
    881e:	4770      	bx	lr

00008820 <_malloc_trim_r>:
_malloc_trim_r():
    8820:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    8822:	f249 47e8 	movw	r7, #38120	; 0x94e8
    8826:	f2c0 0701 	movt	r7, #1
    882a:	460c      	mov	r4, r1
    882c:	4606      	mov	r6, r0
    882e:	f000 fc03 	bl	9038 <__malloc_lock>
    8832:	68bb      	ldr	r3, [r7, #8]
    8834:	f5c4 617e 	rsb	r1, r4, #4064	; 0xfe0
    8838:	310f      	adds	r1, #15
    883a:	685d      	ldr	r5, [r3, #4]
    883c:	f025 0503 	bic.w	r5, r5, #3
    8840:	4429      	add	r1, r5
    8842:	f421 617f 	bic.w	r1, r1, #4080	; 0xff0
    8846:	f021 010f 	bic.w	r1, r1, #15
    884a:	f5a1 5480 	sub.w	r4, r1, #4096	; 0x1000
    884e:	f5b4 5f80 	cmp.w	r4, #4096	; 0x1000
    8852:	db07      	blt.n	8864 <_malloc_trim_r+0x44>
    8854:	2100      	movs	r1, #0
    8856:	4630      	mov	r0, r6
    8858:	f000 fbfa 	bl	9050 <_sbrk_r>
    885c:	68bb      	ldr	r3, [r7, #8]
    885e:	442b      	add	r3, r5
    8860:	4298      	cmp	r0, r3
    8862:	d004      	beq.n	886e <_malloc_trim_r+0x4e>
    8864:	4630      	mov	r0, r6
    8866:	f000 fbed 	bl	9044 <__malloc_unlock>
    886a:	2000      	movs	r0, #0
    886c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    886e:	4261      	negs	r1, r4
    8870:	4630      	mov	r0, r6
    8872:	f000 fbed 	bl	9050 <_sbrk_r>
    8876:	3001      	adds	r0, #1
    8878:	d010      	beq.n	889c <_malloc_trim_r+0x7c>
    887a:	68ba      	ldr	r2, [r7, #8]
    887c:	f649 1304 	movw	r3, #39172	; 0x9904
    8880:	f2c0 0301 	movt	r3, #1
    8884:	1b2d      	subs	r5, r5, r4
    8886:	4630      	mov	r0, r6
    8888:	f045 0501 	orr.w	r5, r5, #1
    888c:	6819      	ldr	r1, [r3, #0]
    888e:	6055      	str	r5, [r2, #4]
    8890:	1b09      	subs	r1, r1, r4
    8892:	6019      	str	r1, [r3, #0]
    8894:	f000 fbd6 	bl	9044 <__malloc_unlock>
    8898:	2001      	movs	r0, #1
    889a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    889c:	2100      	movs	r1, #0
    889e:	4630      	mov	r0, r6
    88a0:	f000 fbd6 	bl	9050 <_sbrk_r>
    88a4:	68ba      	ldr	r2, [r7, #8]
    88a6:	1a83      	subs	r3, r0, r2
    88a8:	2b0f      	cmp	r3, #15
    88aa:	dddb      	ble.n	8864 <_malloc_trim_r+0x44>
    88ac:	f649 04f0 	movw	r4, #39152	; 0x98f0
    88b0:	f2c0 0401 	movt	r4, #1
    88b4:	f649 1104 	movw	r1, #39172	; 0x9904
    88b8:	f2c0 0101 	movt	r1, #1
    88bc:	6824      	ldr	r4, [r4, #0]
    88be:	f043 0301 	orr.w	r3, r3, #1
    88c2:	6053      	str	r3, [r2, #4]
    88c4:	1b00      	subs	r0, r0, r4
    88c6:	6008      	str	r0, [r1, #0]
    88c8:	e7cc      	b.n	8864 <_malloc_trim_r+0x44>
    88ca:	bf00      	nop

000088cc <_free_r>:
_free_r():
    88cc:	2900      	cmp	r1, #0
    88ce:	d055      	beq.n	897c <_free_r+0xb0>
    88d0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    88d2:	460c      	mov	r4, r1
    88d4:	4606      	mov	r6, r0
    88d6:	f000 fbaf 	bl	9038 <__malloc_lock>
    88da:	f854 cc04 	ldr.w	ip, [r4, #-4]
    88de:	f249 47e8 	movw	r7, #38120	; 0x94e8
    88e2:	f2c0 0701 	movt	r7, #1
    88e6:	f1a4 0508 	sub.w	r5, r4, #8
    88ea:	f02c 0101 	bic.w	r1, ip, #1
    88ee:	186b      	adds	r3, r5, r1
    88f0:	68b8      	ldr	r0, [r7, #8]
    88f2:	685a      	ldr	r2, [r3, #4]
    88f4:	4298      	cmp	r0, r3
    88f6:	f022 0203 	bic.w	r2, r2, #3
    88fa:	d052      	beq.n	89a2 <_free_r+0xd6>
    88fc:	f01c 0f01 	tst.w	ip, #1
    8900:	605a      	str	r2, [r3, #4]
    8902:	eb03 0002 	add.w	r0, r3, r2
    8906:	d13a      	bne.n	897e <_free_r+0xb2>
    8908:	f854 4c08 	ldr.w	r4, [r4, #-8]
    890c:	f107 0c08 	add.w	ip, r7, #8
    8910:	6840      	ldr	r0, [r0, #4]
    8912:	1b2d      	subs	r5, r5, r4
    8914:	4421      	add	r1, r4
    8916:	f000 0001 	and.w	r0, r0, #1
    891a:	68ac      	ldr	r4, [r5, #8]
    891c:	4564      	cmp	r4, ip
    891e:	d07b      	beq.n	8a18 <_free_r+0x14c>
    8920:	f8d5 c00c 	ldr.w	ip, [r5, #12]
    8924:	f8c4 c00c 	str.w	ip, [r4, #12]
    8928:	f8cc 4008 	str.w	r4, [ip, #8]
    892c:	b360      	cbz	r0, 8988 <_free_r+0xbc>
    892e:	f041 0301 	orr.w	r3, r1, #1
    8932:	606b      	str	r3, [r5, #4]
    8934:	5069      	str	r1, [r5, r1]
    8936:	f5b1 7f00 	cmp.w	r1, #512	; 0x200
    893a:	d356      	bcc.n	89ea <_free_r+0x11e>
    893c:	0a4b      	lsrs	r3, r1, #9
    893e:	2b04      	cmp	r3, #4
    8940:	d876      	bhi.n	8a30 <_free_r+0x164>
    8942:	098b      	lsrs	r3, r1, #6
    8944:	f103 0039 	add.w	r0, r3, #57	; 0x39
    8948:	f103 0238 	add.w	r2, r3, #56	; 0x38
    894c:	00c3      	lsls	r3, r0, #3
    894e:	18f8      	adds	r0, r7, r3
    8950:	58fb      	ldr	r3, [r7, r3]
    8952:	3808      	subs	r0, #8
    8954:	4298      	cmp	r0, r3
    8956:	d07e      	beq.n	8a56 <_free_r+0x18a>
    8958:	685a      	ldr	r2, [r3, #4]
    895a:	f022 0203 	bic.w	r2, r2, #3
    895e:	428a      	cmp	r2, r1
    8960:	d977      	bls.n	8a52 <_free_r+0x186>
    8962:	689b      	ldr	r3, [r3, #8]
    8964:	4298      	cmp	r0, r3
    8966:	d1f7      	bne.n	8958 <_free_r+0x8c>
    8968:	68c1      	ldr	r1, [r0, #12]
    896a:	e9c5 0102 	strd	r0, r1, [r5, #8]
    896e:	608d      	str	r5, [r1, #8]
    8970:	60c5      	str	r5, [r0, #12]
    8972:	4630      	mov	r0, r6
    8974:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    8978:	f000 bb64 	b.w	9044 <__malloc_unlock>
    897c:	4770      	bx	lr
    897e:	6840      	ldr	r0, [r0, #4]
    8980:	f000 0001 	and.w	r0, r0, #1
    8984:	2800      	cmp	r0, #0
    8986:	d1d2      	bne.n	892e <_free_r+0x62>
    8988:	6898      	ldr	r0, [r3, #8]
    898a:	4411      	add	r1, r2
    898c:	4c49      	ldr	r4, [pc, #292]	; (8ab4 <_free_r+0x1e8>)
    898e:	f041 0201 	orr.w	r2, r1, #1
    8992:	42a0      	cmp	r0, r4
    8994:	d068      	beq.n	8a68 <_free_r+0x19c>
    8996:	68db      	ldr	r3, [r3, #12]
    8998:	60c3      	str	r3, [r0, #12]
    899a:	6098      	str	r0, [r3, #8]
    899c:	606a      	str	r2, [r5, #4]
    899e:	5069      	str	r1, [r5, r1]
    89a0:	e7c9      	b.n	8936 <_free_r+0x6a>
    89a2:	f01c 0f01 	tst.w	ip, #1
    89a6:	440a      	add	r2, r1
    89a8:	d107      	bne.n	89ba <_free_r+0xee>
    89aa:	f854 3c08 	ldr.w	r3, [r4, #-8]
    89ae:	1aed      	subs	r5, r5, r3
    89b0:	441a      	add	r2, r3
    89b2:	e9d5 1302 	ldrd	r1, r3, [r5, #8]
    89b6:	60cb      	str	r3, [r1, #12]
    89b8:	6099      	str	r1, [r3, #8]
    89ba:	f649 03f4 	movw	r3, #39156	; 0x98f4
    89be:	f2c0 0301 	movt	r3, #1
    89c2:	f042 0101 	orr.w	r1, r2, #1
    89c6:	6069      	str	r1, [r5, #4]
    89c8:	681b      	ldr	r3, [r3, #0]
    89ca:	60bd      	str	r5, [r7, #8]
    89cc:	4293      	cmp	r3, r2
    89ce:	d807      	bhi.n	89e0 <_free_r+0x114>
    89d0:	f649 1334 	movw	r3, #39220	; 0x9934
    89d4:	f2c0 0301 	movt	r3, #1
    89d8:	4630      	mov	r0, r6
    89da:	6819      	ldr	r1, [r3, #0]
    89dc:	f7ff ff20 	bl	8820 <_malloc_trim_r>
    89e0:	4630      	mov	r0, r6
    89e2:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    89e6:	f000 bb2d 	b.w	9044 <__malloc_unlock>
    89ea:	08c9      	lsrs	r1, r1, #3
    89ec:	2301      	movs	r3, #1
    89ee:	18c8      	adds	r0, r1, r3
    89f0:	687a      	ldr	r2, [r7, #4]
    89f2:	1089      	asrs	r1, r1, #2
    89f4:	408b      	lsls	r3, r1
    89f6:	f857 1030 	ldr.w	r1, [r7, r0, lsl #3]
    89fa:	4313      	orrs	r3, r2
    89fc:	eb07 02c0 	add.w	r2, r7, r0, lsl #3
    8a00:	607b      	str	r3, [r7, #4]
    8a02:	3a08      	subs	r2, #8
    8a04:	e9c5 1202 	strd	r1, r2, [r5, #8]
    8a08:	f847 5030 	str.w	r5, [r7, r0, lsl #3]
    8a0c:	4630      	mov	r0, r6
    8a0e:	60cd      	str	r5, [r1, #12]
    8a10:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    8a14:	f000 bb16 	b.w	9044 <__malloc_unlock>
    8a18:	2800      	cmp	r0, #0
    8a1a:	d145      	bne.n	8aa8 <_free_r+0x1dc>
    8a1c:	6898      	ldr	r0, [r3, #8]
    8a1e:	440a      	add	r2, r1
    8a20:	68db      	ldr	r3, [r3, #12]
    8a22:	f042 0101 	orr.w	r1, r2, #1
    8a26:	60c3      	str	r3, [r0, #12]
    8a28:	6098      	str	r0, [r3, #8]
    8a2a:	6069      	str	r1, [r5, #4]
    8a2c:	50aa      	str	r2, [r5, r2]
    8a2e:	e7d7      	b.n	89e0 <_free_r+0x114>
    8a30:	2b14      	cmp	r3, #20
    8a32:	d908      	bls.n	8a46 <_free_r+0x17a>
    8a34:	2b54      	cmp	r3, #84	; 0x54
    8a36:	d81e      	bhi.n	8a76 <_free_r+0x1aa>
    8a38:	0b0b      	lsrs	r3, r1, #12
    8a3a:	f103 006f 	add.w	r0, r3, #111	; 0x6f
    8a3e:	f103 026e 	add.w	r2, r3, #110	; 0x6e
    8a42:	00c3      	lsls	r3, r0, #3
    8a44:	e783      	b.n	894e <_free_r+0x82>
    8a46:	f103 005c 	add.w	r0, r3, #92	; 0x5c
    8a4a:	f103 025b 	add.w	r2, r3, #91	; 0x5b
    8a4e:	00c3      	lsls	r3, r0, #3
    8a50:	e77d      	b.n	894e <_free_r+0x82>
    8a52:	4618      	mov	r0, r3
    8a54:	e788      	b.n	8968 <_free_r+0x9c>
    8a56:	1093      	asrs	r3, r2, #2
    8a58:	687c      	ldr	r4, [r7, #4]
    8a5a:	2201      	movs	r2, #1
    8a5c:	4601      	mov	r1, r0
    8a5e:	fa02 f303 	lsl.w	r3, r2, r3
    8a62:	4323      	orrs	r3, r4
    8a64:	607b      	str	r3, [r7, #4]
    8a66:	e780      	b.n	896a <_free_r+0x9e>
    8a68:	e9c7 5504 	strd	r5, r5, [r7, #16]
    8a6c:	e9c5 0002 	strd	r0, r0, [r5, #8]
    8a70:	606a      	str	r2, [r5, #4]
    8a72:	5069      	str	r1, [r5, r1]
    8a74:	e7b4      	b.n	89e0 <_free_r+0x114>
    8a76:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
    8a7a:	d806      	bhi.n	8a8a <_free_r+0x1be>
    8a7c:	0bcb      	lsrs	r3, r1, #15
    8a7e:	f103 0078 	add.w	r0, r3, #120	; 0x78
    8a82:	f103 0277 	add.w	r2, r3, #119	; 0x77
    8a86:	00c3      	lsls	r3, r0, #3
    8a88:	e761      	b.n	894e <_free_r+0x82>
    8a8a:	f240 5254 	movw	r2, #1364	; 0x554
    8a8e:	4293      	cmp	r3, r2
    8a90:	bf9d      	ittte	ls
    8a92:	0c8b      	lsrls	r3, r1, #18
    8a94:	f103 007d 	addls.w	r0, r3, #125	; 0x7d
    8a98:	f103 027c 	addls.w	r2, r3, #124	; 0x7c
    8a9c:	f44f 737e 	movhi.w	r3, #1016	; 0x3f8
    8aa0:	bf8c      	ite	hi
    8aa2:	227e      	movhi	r2, #126	; 0x7e
    8aa4:	00c3      	lslls	r3, r0, #3
    8aa6:	e752      	b.n	894e <_free_r+0x82>
    8aa8:	f041 0201 	orr.w	r2, r1, #1
    8aac:	606a      	str	r2, [r5, #4]
    8aae:	6019      	str	r1, [r3, #0]
    8ab0:	e796      	b.n	89e0 <_free_r+0x114>
    8ab2:	bf00      	nop
    8ab4:	000194f0 	strdeq	r9, [r1], -r0

00008ab8 <_malloc_r>:
_malloc_r():
    8ab8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8abc:	f101 050b 	add.w	r5, r1, #11
    8ac0:	2d16      	cmp	r5, #22
    8ac2:	b083      	sub	sp, #12
    8ac4:	4606      	mov	r6, r0
    8ac6:	d827      	bhi.n	8b18 <_malloc_r+0x60>
    8ac8:	2910      	cmp	r1, #16
    8aca:	f200 8196 	bhi.w	8dfa <_malloc_r+0x342>
    8ace:	f000 fab3 	bl	9038 <__malloc_lock>
    8ad2:	2510      	movs	r5, #16
    8ad4:	2218      	movs	r2, #24
    8ad6:	2402      	movs	r4, #2
    8ad8:	f249 47e8 	movw	r7, #38120	; 0x94e8
    8adc:	f2c0 0701 	movt	r7, #1
    8ae0:	443a      	add	r2, r7
    8ae2:	f1a2 0108 	sub.w	r1, r2, #8
    8ae6:	6853      	ldr	r3, [r2, #4]
    8ae8:	428b      	cmp	r3, r1
    8aea:	f000 81af 	beq.w	8e4c <_malloc_r+0x394>
    8aee:	685a      	ldr	r2, [r3, #4]
    8af0:	f103 0408 	add.w	r4, r3, #8
    8af4:	68d9      	ldr	r1, [r3, #12]
    8af6:	4630      	mov	r0, r6
    8af8:	f022 0203 	bic.w	r2, r2, #3
    8afc:	689d      	ldr	r5, [r3, #8]
    8afe:	4413      	add	r3, r2
    8b00:	685a      	ldr	r2, [r3, #4]
    8b02:	60e9      	str	r1, [r5, #12]
    8b04:	f042 0201 	orr.w	r2, r2, #1
    8b08:	608d      	str	r5, [r1, #8]
    8b0a:	605a      	str	r2, [r3, #4]
    8b0c:	f000 fa9a 	bl	9044 <__malloc_unlock>
    8b10:	4620      	mov	r0, r4
    8b12:	b003      	add	sp, #12
    8b14:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    8b18:	f025 0507 	bic.w	r5, r5, #7
    8b1c:	42a9      	cmp	r1, r5
    8b1e:	bf94      	ite	ls
    8b20:	2100      	movls	r1, #0
    8b22:	2101      	movhi	r1, #1
    8b24:	ea51 73d5 	orrs.w	r3, r1, r5, lsr #31
    8b28:	f040 8167 	bne.w	8dfa <_malloc_r+0x342>
    8b2c:	f000 fa84 	bl	9038 <__malloc_lock>
    8b30:	f5b5 7ffc 	cmp.w	r5, #504	; 0x1f8
    8b34:	f0c0 81a8 	bcc.w	8e88 <_malloc_r+0x3d0>
    8b38:	0a6b      	lsrs	r3, r5, #9
    8b3a:	d00b      	beq.n	8b54 <_malloc_r+0x9c>
    8b3c:	2b04      	cmp	r3, #4
    8b3e:	f240 8155 	bls.w	8dec <_malloc_r+0x334>
    8b42:	2b14      	cmp	r3, #20
    8b44:	f200 81dd 	bhi.w	8f02 <_malloc_r+0x44a>
    8b48:	f103 045c 	add.w	r4, r3, #92	; 0x5c
    8b4c:	f103 0c5b 	add.w	ip, r3, #91	; 0x5b
    8b50:	00e3      	lsls	r3, r4, #3
    8b52:	e004      	b.n	8b5e <_malloc_r+0xa6>
    8b54:	f44f 7300 	mov.w	r3, #512	; 0x200
    8b58:	2440      	movs	r4, #64	; 0x40
    8b5a:	f04f 0c3f 	mov.w	ip, #63	; 0x3f
    8b5e:	f249 47e8 	movw	r7, #38120	; 0x94e8
    8b62:	f2c0 0701 	movt	r7, #1
    8b66:	443b      	add	r3, r7
    8b68:	f1a3 0008 	sub.w	r0, r3, #8
    8b6c:	685b      	ldr	r3, [r3, #4]
    8b6e:	4298      	cmp	r0, r3
    8b70:	d106      	bne.n	8b80 <_malloc_r+0xc8>
    8b72:	e00c      	b.n	8b8e <_malloc_r+0xd6>
    8b74:	2900      	cmp	r1, #0
    8b76:	f280 8147 	bge.w	8e08 <_malloc_r+0x350>
    8b7a:	68db      	ldr	r3, [r3, #12]
    8b7c:	4298      	cmp	r0, r3
    8b7e:	d006      	beq.n	8b8e <_malloc_r+0xd6>
    8b80:	685a      	ldr	r2, [r3, #4]
    8b82:	f022 0203 	bic.w	r2, r2, #3
    8b86:	1b51      	subs	r1, r2, r5
    8b88:	290f      	cmp	r1, #15
    8b8a:	ddf3      	ble.n	8b74 <_malloc_r+0xbc>
    8b8c:	4664      	mov	r4, ip
    8b8e:	693a      	ldr	r2, [r7, #16]
    8b90:	f8df c4a0 	ldr.w	ip, [pc, #1184]	; 9034 <_malloc_r+0x57c>
    8b94:	4562      	cmp	r2, ip
    8b96:	bf08      	it	eq
    8b98:	687b      	ldreq	r3, [r7, #4]
    8b9a:	d026      	beq.n	8bea <_malloc_r+0x132>
    8b9c:	6853      	ldr	r3, [r2, #4]
    8b9e:	f023 0303 	bic.w	r3, r3, #3
    8ba2:	1b59      	subs	r1, r3, r5
    8ba4:	290f      	cmp	r1, #15
    8ba6:	f300 8158 	bgt.w	8e5a <_malloc_r+0x3a2>
    8baa:	2900      	cmp	r1, #0
    8bac:	e9c7 cc04 	strd	ip, ip, [r7, #16]
    8bb0:	f280 810e 	bge.w	8dd0 <_malloc_r+0x318>
    8bb4:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    8bb8:	f080 8182 	bcs.w	8ec0 <_malloc_r+0x408>
    8bbc:	08db      	lsrs	r3, r3, #3
    8bbe:	f04f 0e01 	mov.w	lr, #1
    8bc2:	eb03 000e 	add.w	r0, r3, lr
    8bc6:	6879      	ldr	r1, [r7, #4]
    8bc8:	109b      	asrs	r3, r3, #2
    8bca:	f857 8030 	ldr.w	r8, [r7, r0, lsl #3]
    8bce:	fa0e f303 	lsl.w	r3, lr, r3
    8bd2:	eb07 0ec0 	add.w	lr, r7, r0, lsl #3
    8bd6:	430b      	orrs	r3, r1
    8bd8:	f1ae 0108 	sub.w	r1, lr, #8
    8bdc:	607b      	str	r3, [r7, #4]
    8bde:	e9c2 8102 	strd	r8, r1, [r2, #8]
    8be2:	f847 2030 	str.w	r2, [r7, r0, lsl #3]
    8be6:	f8c8 200c 	str.w	r2, [r8, #12]
    8bea:	10a2      	asrs	r2, r4, #2
    8bec:	2001      	movs	r0, #1
    8bee:	4090      	lsls	r0, r2
    8bf0:	4298      	cmp	r0, r3
    8bf2:	d838      	bhi.n	8c66 <_malloc_r+0x1ae>
    8bf4:	4218      	tst	r0, r3
    8bf6:	d105      	bne.n	8c04 <_malloc_r+0x14c>
    8bf8:	f024 0403 	bic.w	r4, r4, #3
    8bfc:	0040      	lsls	r0, r0, #1
    8bfe:	3404      	adds	r4, #4
    8c00:	4218      	tst	r0, r3
    8c02:	d0fb      	beq.n	8bfc <_malloc_r+0x144>
    8c04:	eb07 09c4 	add.w	r9, r7, r4, lsl #3
    8c08:	46a0      	mov	r8, r4
    8c0a:	46ce      	mov	lr, r9
    8c0c:	f8de 300c 	ldr.w	r3, [lr, #12]
    8c10:	459e      	cmp	lr, r3
    8c12:	d107      	bne.n	8c24 <_malloc_r+0x16c>
    8c14:	e13c      	b.n	8e90 <_malloc_r+0x3d8>
    8c16:	2a00      	cmp	r2, #0
    8c18:	f280 8143 	bge.w	8ea2 <_malloc_r+0x3ea>
    8c1c:	68db      	ldr	r3, [r3, #12]
    8c1e:	459e      	cmp	lr, r3
    8c20:	f000 8136 	beq.w	8e90 <_malloc_r+0x3d8>
    8c24:	6859      	ldr	r1, [r3, #4]
    8c26:	f021 0103 	bic.w	r1, r1, #3
    8c2a:	1b4a      	subs	r2, r1, r5
    8c2c:	2a0f      	cmp	r2, #15
    8c2e:	ddf2      	ble.n	8c16 <_malloc_r+0x15e>
    8c30:	68dc      	ldr	r4, [r3, #12]
    8c32:	eb03 0e05 	add.w	lr, r3, r5
    8c36:	f8d3 8008 	ldr.w	r8, [r3, #8]
    8c3a:	f045 0501 	orr.w	r5, r5, #1
    8c3e:	4630      	mov	r0, r6
    8c40:	605d      	str	r5, [r3, #4]
    8c42:	f042 0501 	orr.w	r5, r2, #1
    8c46:	f8c8 400c 	str.w	r4, [r8, #12]
    8c4a:	f8c4 8008 	str.w	r8, [r4, #8]
    8c4e:	f103 0408 	add.w	r4, r3, #8
    8c52:	e9c7 ee04 	strd	lr, lr, [r7, #16]
    8c56:	e9ce cc02 	strd	ip, ip, [lr, #8]
    8c5a:	f8ce 5004 	str.w	r5, [lr, #4]
    8c5e:	505a      	str	r2, [r3, r1]
    8c60:	f000 f9f0 	bl	9044 <__malloc_unlock>
    8c64:	e754      	b.n	8b10 <_malloc_r+0x58>
    8c66:	68bc      	ldr	r4, [r7, #8]
    8c68:	6863      	ldr	r3, [r4, #4]
    8c6a:	f023 0903 	bic.w	r9, r3, #3
    8c6e:	45a9      	cmp	r9, r5
    8c70:	eba9 0305 	sub.w	r3, r9, r5
    8c74:	bf2c      	ite	cs
    8c76:	2200      	movcs	r2, #0
    8c78:	2201      	movcc	r2, #1
    8c7a:	2b0f      	cmp	r3, #15
    8c7c:	bfd8      	it	le
    8c7e:	f042 0201 	orrle.w	r2, r2, #1
    8c82:	2a00      	cmp	r2, #0
    8c84:	f000 80d2 	beq.w	8e2c <_malloc_r+0x374>
    8c88:	f649 1334 	movw	r3, #39220	; 0x9934
    8c8c:	f649 0af0 	movw	sl, #39152	; 0x98f0
    8c90:	f2c0 0301 	movt	r3, #1
    8c94:	f2c0 0a01 	movt	sl, #1
    8c98:	4630      	mov	r0, r6
    8c9a:	681a      	ldr	r2, [r3, #0]
    8c9c:	f8da 3000 	ldr.w	r3, [sl]
    8ca0:	eb05 0802 	add.w	r8, r5, r2
    8ca4:	3301      	adds	r3, #1
    8ca6:	bf17      	itett	ne
    8ca8:	f508 5880 	addne.w	r8, r8, #4096	; 0x1000
    8cac:	f108 0810 	addeq.w	r8, r8, #16
    8cb0:	f108 080f 	addne.w	r8, r8, #15
    8cb4:	f428 687f 	bicne.w	r8, r8, #4080	; 0xff0
    8cb8:	bf18      	it	ne
    8cba:	f028 080f 	bicne.w	r8, r8, #15
    8cbe:	4641      	mov	r1, r8
    8cc0:	f000 f9c6 	bl	9050 <_sbrk_r>
    8cc4:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
    8cc8:	4683      	mov	fp, r0
    8cca:	f000 8128 	beq.w	8f1e <_malloc_r+0x466>
    8cce:	eb04 0009 	add.w	r0, r4, r9
    8cd2:	4558      	cmp	r0, fp
    8cd4:	f200 8121 	bhi.w	8f1a <_malloc_r+0x462>
    8cd8:	f649 1204 	movw	r2, #39172	; 0x9904
    8cdc:	f2c0 0201 	movt	r2, #1
    8ce0:	6813      	ldr	r3, [r2, #0]
    8ce2:	4443      	add	r3, r8
    8ce4:	6013      	str	r3, [r2, #0]
    8ce6:	f000 815d 	beq.w	8fa4 <_malloc_r+0x4ec>
    8cea:	f8da 1000 	ldr.w	r1, [sl]
    8cee:	9201      	str	r2, [sp, #4]
    8cf0:	3101      	adds	r1, #1
    8cf2:	bf0f      	iteee	eq
    8cf4:	f8ca b000 	streq.w	fp, [sl]
    8cf8:	ebab 0000 	subne.w	r0, fp, r0
    8cfc:	181b      	addne	r3, r3, r0
    8cfe:	6013      	strne	r3, [r2, #0]
    8d00:	f01b 0307 	ands.w	r3, fp, #7
    8d04:	4630      	mov	r0, r6
    8d06:	bf1f      	itttt	ne
    8d08:	f1c3 0108 	rsbne	r1, r3, #8
    8d0c:	f5c3 5380 	rsbne	r3, r3, #4096	; 0x1000
    8d10:	448b      	addne	fp, r1
    8d12:	3308      	addne	r3, #8
    8d14:	44d8      	add	r8, fp
    8d16:	bf08      	it	eq
    8d18:	f44f 5380 	moveq.w	r3, #4096	; 0x1000
    8d1c:	f3c8 080b 	ubfx	r8, r8, #0, #12
    8d20:	eba3 0808 	sub.w	r8, r3, r8
    8d24:	4641      	mov	r1, r8
    8d26:	f000 f993 	bl	9050 <_sbrk_r>
    8d2a:	9a01      	ldr	r2, [sp, #4]
    8d2c:	f8c7 b008 	str.w	fp, [r7, #8]
    8d30:	1c43      	adds	r3, r0, #1
    8d32:	6813      	ldr	r3, [r2, #0]
    8d34:	bf1b      	ittet	ne
    8d36:	eba0 010b 	subne.w	r1, r0, fp
    8d3a:	4441      	addne	r1, r8
    8d3c:	2101      	moveq	r1, #1
    8d3e:	f041 0101 	orrne.w	r1, r1, #1
    8d42:	bf08      	it	eq
    8d44:	f04f 0800 	moveq.w	r8, #0
    8d48:	42bc      	cmp	r4, r7
    8d4a:	4443      	add	r3, r8
    8d4c:	f8cb 1004 	str.w	r1, [fp, #4]
    8d50:	6013      	str	r3, [r2, #0]
    8d52:	d019      	beq.n	8d88 <_malloc_r+0x2d0>
    8d54:	f1b9 0f0f 	cmp.w	r9, #15
    8d58:	bf9c      	itt	ls
    8d5a:	2301      	movls	r3, #1
    8d5c:	f8cb 3004 	strls.w	r3, [fp, #4]
    8d60:	d931      	bls.n	8dc6 <_malloc_r+0x30e>
    8d62:	f1a9 010c 	sub.w	r1, r9, #12
    8d66:	6860      	ldr	r0, [r4, #4]
    8d68:	f021 0107 	bic.w	r1, r1, #7
    8d6c:	f04f 0e05 	mov.w	lr, #5
    8d70:	eb04 0c01 	add.w	ip, r4, r1
    8d74:	290f      	cmp	r1, #15
    8d76:	f000 0001 	and.w	r0, r0, #1
    8d7a:	ea40 0001 	orr.w	r0, r0, r1
    8d7e:	6060      	str	r0, [r4, #4]
    8d80:	e9cc ee01 	strd	lr, lr, [ip, #4]
    8d84:	f200 813c 	bhi.w	9000 <_malloc_r+0x548>
    8d88:	f649 122c 	movw	r2, #39212	; 0x992c
    8d8c:	f2c0 0201 	movt	r2, #1
    8d90:	68bc      	ldr	r4, [r7, #8]
    8d92:	f649 1030 	movw	r0, #39216	; 0x9930
    8d96:	6811      	ldr	r1, [r2, #0]
    8d98:	f2c0 0001 	movt	r0, #1
    8d9c:	428b      	cmp	r3, r1
    8d9e:	bf88      	it	hi
    8da0:	6013      	strhi	r3, [r2, #0]
    8da2:	6862      	ldr	r2, [r4, #4]
    8da4:	6801      	ldr	r1, [r0, #0]
    8da6:	f022 0203 	bic.w	r2, r2, #3
    8daa:	428b      	cmp	r3, r1
    8dac:	bf88      	it	hi
    8dae:	6003      	strhi	r3, [r0, #0]
    8db0:	4295      	cmp	r5, r2
    8db2:	eba2 0305 	sub.w	r3, r2, r5
    8db6:	bf94      	ite	ls
    8db8:	2200      	movls	r2, #0
    8dba:	2201      	movhi	r2, #1
    8dbc:	2b0f      	cmp	r3, #15
    8dbe:	bfd8      	it	le
    8dc0:	f042 0201 	orrle.w	r2, r2, #1
    8dc4:	b392      	cbz	r2, 8e2c <_malloc_r+0x374>
    8dc6:	4630      	mov	r0, r6
    8dc8:	2400      	movs	r4, #0
    8dca:	f000 f93b 	bl	9044 <__malloc_unlock>
    8dce:	e69f      	b.n	8b10 <_malloc_r+0x58>
    8dd0:	4413      	add	r3, r2
    8dd2:	f102 0408 	add.w	r4, r2, #8
    8dd6:	4630      	mov	r0, r6
    8dd8:	685a      	ldr	r2, [r3, #4]
    8dda:	f042 0201 	orr.w	r2, r2, #1
    8dde:	605a      	str	r2, [r3, #4]
    8de0:	f000 f930 	bl	9044 <__malloc_unlock>
    8de4:	4620      	mov	r0, r4
    8de6:	b003      	add	sp, #12
    8de8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    8dec:	09ab      	lsrs	r3, r5, #6
    8dee:	f103 0439 	add.w	r4, r3, #57	; 0x39
    8df2:	f103 0c38 	add.w	ip, r3, #56	; 0x38
    8df6:	00e3      	lsls	r3, r4, #3
    8df8:	e6b1      	b.n	8b5e <_malloc_r+0xa6>
    8dfa:	2400      	movs	r4, #0
    8dfc:	230c      	movs	r3, #12
    8dfe:	4620      	mov	r0, r4
    8e00:	6033      	str	r3, [r6, #0]
    8e02:	b003      	add	sp, #12
    8e04:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    8e08:	441a      	add	r2, r3
    8e0a:	e9d3 7502 	ldrd	r7, r5, [r3, #8]
    8e0e:	4630      	mov	r0, r6
    8e10:	f103 0408 	add.w	r4, r3, #8
    8e14:	6851      	ldr	r1, [r2, #4]
    8e16:	60fd      	str	r5, [r7, #12]
    8e18:	f041 0101 	orr.w	r1, r1, #1
    8e1c:	60af      	str	r7, [r5, #8]
    8e1e:	6051      	str	r1, [r2, #4]
    8e20:	f000 f910 	bl	9044 <__malloc_unlock>
    8e24:	4620      	mov	r0, r4
    8e26:	b003      	add	sp, #12
    8e28:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    8e2c:	1962      	adds	r2, r4, r5
    8e2e:	f043 0301 	orr.w	r3, r3, #1
    8e32:	4630      	mov	r0, r6
    8e34:	f045 0501 	orr.w	r5, r5, #1
    8e38:	6065      	str	r5, [r4, #4]
    8e3a:	3408      	adds	r4, #8
    8e3c:	60ba      	str	r2, [r7, #8]
    8e3e:	6053      	str	r3, [r2, #4]
    8e40:	f000 f900 	bl	9044 <__malloc_unlock>
    8e44:	4620      	mov	r0, r4
    8e46:	b003      	add	sp, #12
    8e48:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    8e4c:	68d3      	ldr	r3, [r2, #12]
    8e4e:	429a      	cmp	r2, r3
    8e50:	bf08      	it	eq
    8e52:	3402      	addeq	r4, #2
    8e54:	f43f ae9b 	beq.w	8b8e <_malloc_r+0xd6>
    8e58:	e649      	b.n	8aee <_malloc_r+0x36>
    8e5a:	eb02 0e05 	add.w	lr, r2, r5
    8e5e:	4630      	mov	r0, r6
    8e60:	f045 0501 	orr.w	r5, r5, #1
    8e64:	6055      	str	r5, [r2, #4]
    8e66:	e9c7 ee04 	strd	lr, lr, [r7, #16]
    8e6a:	f041 0501 	orr.w	r5, r1, #1
    8e6e:	e9ce cc02 	strd	ip, ip, [lr, #8]
    8e72:	f102 0408 	add.w	r4, r2, #8
    8e76:	f8ce 5004 	str.w	r5, [lr, #4]
    8e7a:	50d1      	str	r1, [r2, r3]
    8e7c:	f000 f8e2 	bl	9044 <__malloc_unlock>
    8e80:	4620      	mov	r0, r4
    8e82:	b003      	add	sp, #12
    8e84:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    8e88:	08ec      	lsrs	r4, r5, #3
    8e8a:	f105 0208 	add.w	r2, r5, #8
    8e8e:	e623      	b.n	8ad8 <_malloc_r+0x20>
    8e90:	f108 0801 	add.w	r8, r8, #1
    8e94:	f10e 0e08 	add.w	lr, lr, #8
    8e98:	f018 0f03 	tst.w	r8, #3
    8e9c:	f47f aeb6 	bne.w	8c0c <_malloc_r+0x154>
    8ea0:	e053      	b.n	8f4a <_malloc_r+0x492>
    8ea2:	4419      	add	r1, r3
    8ea4:	461c      	mov	r4, r3
    8ea6:	68da      	ldr	r2, [r3, #12]
    8ea8:	4630      	mov	r0, r6
    8eaa:	f854 5f08 	ldr.w	r5, [r4, #8]!
    8eae:	684b      	ldr	r3, [r1, #4]
    8eb0:	f043 0301 	orr.w	r3, r3, #1
    8eb4:	604b      	str	r3, [r1, #4]
    8eb6:	60ea      	str	r2, [r5, #12]
    8eb8:	6095      	str	r5, [r2, #8]
    8eba:	f000 f8c3 	bl	9044 <__malloc_unlock>
    8ebe:	e627      	b.n	8b10 <_malloc_r+0x58>
    8ec0:	0a59      	lsrs	r1, r3, #9
    8ec2:	2904      	cmp	r1, #4
    8ec4:	d930      	bls.n	8f28 <_malloc_r+0x470>
    8ec6:	2914      	cmp	r1, #20
    8ec8:	d864      	bhi.n	8f94 <_malloc_r+0x4dc>
    8eca:	f101 005c 	add.w	r0, r1, #92	; 0x5c
    8ece:	315b      	adds	r1, #91	; 0x5b
    8ed0:	00c0      	lsls	r0, r0, #3
    8ed2:	eb07 0e00 	add.w	lr, r7, r0
    8ed6:	5838      	ldr	r0, [r7, r0]
    8ed8:	f1ae 0e08 	sub.w	lr, lr, #8
    8edc:	4586      	cmp	lr, r0
    8ede:	d050      	beq.n	8f82 <_malloc_r+0x4ca>
    8ee0:	6841      	ldr	r1, [r0, #4]
    8ee2:	f021 0103 	bic.w	r1, r1, #3
    8ee6:	4299      	cmp	r1, r3
    8ee8:	d902      	bls.n	8ef0 <_malloc_r+0x438>
    8eea:	6880      	ldr	r0, [r0, #8]
    8eec:	4586      	cmp	lr, r0
    8eee:	d1f7      	bne.n	8ee0 <_malloc_r+0x428>
    8ef0:	f8d0 e00c 	ldr.w	lr, [r0, #12]
    8ef4:	687b      	ldr	r3, [r7, #4]
    8ef6:	e9c2 0e02 	strd	r0, lr, [r2, #8]
    8efa:	f8ce 2008 	str.w	r2, [lr, #8]
    8efe:	60c2      	str	r2, [r0, #12]
    8f00:	e673      	b.n	8bea <_malloc_r+0x132>
    8f02:	2b54      	cmp	r3, #84	; 0x54
    8f04:	d916      	bls.n	8f34 <_malloc_r+0x47c>
    8f06:	f5b3 7faa 	cmp.w	r3, #340	; 0x154
    8f0a:	d857      	bhi.n	8fbc <_malloc_r+0x504>
    8f0c:	0beb      	lsrs	r3, r5, #15
    8f0e:	f103 0478 	add.w	r4, r3, #120	; 0x78
    8f12:	f103 0c77 	add.w	ip, r3, #119	; 0x77
    8f16:	00e3      	lsls	r3, r4, #3
    8f18:	e621      	b.n	8b5e <_malloc_r+0xa6>
    8f1a:	42bc      	cmp	r4, r7
    8f1c:	d059      	beq.n	8fd2 <_malloc_r+0x51a>
    8f1e:	68bc      	ldr	r4, [r7, #8]
    8f20:	6862      	ldr	r2, [r4, #4]
    8f22:	f022 0203 	bic.w	r2, r2, #3
    8f26:	e743      	b.n	8db0 <_malloc_r+0x2f8>
    8f28:	0999      	lsrs	r1, r3, #6
    8f2a:	f101 0039 	add.w	r0, r1, #57	; 0x39
    8f2e:	3138      	adds	r1, #56	; 0x38
    8f30:	00c0      	lsls	r0, r0, #3
    8f32:	e7ce      	b.n	8ed2 <_malloc_r+0x41a>
    8f34:	0b2b      	lsrs	r3, r5, #12
    8f36:	f103 046f 	add.w	r4, r3, #111	; 0x6f
    8f3a:	f103 0c6e 	add.w	ip, r3, #110	; 0x6e
    8f3e:	00e3      	lsls	r3, r4, #3
    8f40:	e60d      	b.n	8b5e <_malloc_r+0xa6>
    8f42:	f8d9 9000 	ldr.w	r9, [r9]
    8f46:	4599      	cmp	r9, r3
    8f48:	d171      	bne.n	902e <_malloc_r+0x576>
    8f4a:	f014 0f03 	tst.w	r4, #3
    8f4e:	f1a9 0308 	sub.w	r3, r9, #8
    8f52:	f104 34ff 	add.w	r4, r4, #4294967295	; 0xffffffff
    8f56:	d1f4      	bne.n	8f42 <_malloc_r+0x48a>
    8f58:	687b      	ldr	r3, [r7, #4]
    8f5a:	ea23 0300 	bic.w	r3, r3, r0
    8f5e:	607b      	str	r3, [r7, #4]
    8f60:	0040      	lsls	r0, r0, #1
    8f62:	4298      	cmp	r0, r3
    8f64:	bf8c      	ite	hi
    8f66:	2200      	movhi	r2, #0
    8f68:	2201      	movls	r2, #1
    8f6a:	2800      	cmp	r0, #0
    8f6c:	bf08      	it	eq
    8f6e:	2200      	moveq	r2, #0
    8f70:	b91a      	cbnz	r2, 8f7a <_malloc_r+0x4c2>
    8f72:	e678      	b.n	8c66 <_malloc_r+0x1ae>
    8f74:	0040      	lsls	r0, r0, #1
    8f76:	f108 0804 	add.w	r8, r8, #4
    8f7a:	4218      	tst	r0, r3
    8f7c:	d0fa      	beq.n	8f74 <_malloc_r+0x4bc>
    8f7e:	4644      	mov	r4, r8
    8f80:	e640      	b.n	8c04 <_malloc_r+0x14c>
    8f82:	687b      	ldr	r3, [r7, #4]
    8f84:	1089      	asrs	r1, r1, #2
    8f86:	f04f 0801 	mov.w	r8, #1
    8f8a:	fa08 f101 	lsl.w	r1, r8, r1
    8f8e:	430b      	orrs	r3, r1
    8f90:	607b      	str	r3, [r7, #4]
    8f92:	e7b0      	b.n	8ef6 <_malloc_r+0x43e>
    8f94:	2954      	cmp	r1, #84	; 0x54
    8f96:	d824      	bhi.n	8fe2 <_malloc_r+0x52a>
    8f98:	0b19      	lsrs	r1, r3, #12
    8f9a:	f101 006f 	add.w	r0, r1, #111	; 0x6f
    8f9e:	316e      	adds	r1, #110	; 0x6e
    8fa0:	00c0      	lsls	r0, r0, #3
    8fa2:	e796      	b.n	8ed2 <_malloc_r+0x41a>
    8fa4:	f3c0 010b 	ubfx	r1, r0, #0, #12
    8fa8:	2900      	cmp	r1, #0
    8faa:	f47f ae9e 	bne.w	8cea <_malloc_r+0x232>
    8fae:	68b9      	ldr	r1, [r7, #8]
    8fb0:	eb09 0208 	add.w	r2, r9, r8
    8fb4:	f042 0201 	orr.w	r2, r2, #1
    8fb8:	604a      	str	r2, [r1, #4]
    8fba:	e6e5      	b.n	8d88 <_malloc_r+0x2d0>
    8fbc:	f240 5254 	movw	r2, #1364	; 0x554
    8fc0:	4293      	cmp	r3, r2
    8fc2:	d817      	bhi.n	8ff4 <_malloc_r+0x53c>
    8fc4:	0cab      	lsrs	r3, r5, #18
    8fc6:	f103 047d 	add.w	r4, r3, #125	; 0x7d
    8fca:	f103 0c7c 	add.w	ip, r3, #124	; 0x7c
    8fce:	00e3      	lsls	r3, r4, #3
    8fd0:	e5c5      	b.n	8b5e <_malloc_r+0xa6>
    8fd2:	f649 1204 	movw	r2, #39172	; 0x9904
    8fd6:	f2c0 0201 	movt	r2, #1
    8fda:	6813      	ldr	r3, [r2, #0]
    8fdc:	4443      	add	r3, r8
    8fde:	6013      	str	r3, [r2, #0]
    8fe0:	e683      	b.n	8cea <_malloc_r+0x232>
    8fe2:	f5b1 7faa 	cmp.w	r1, #340	; 0x154
    8fe6:	d814      	bhi.n	9012 <_malloc_r+0x55a>
    8fe8:	0bd9      	lsrs	r1, r3, #15
    8fea:	f101 0078 	add.w	r0, r1, #120	; 0x78
    8fee:	3177      	adds	r1, #119	; 0x77
    8ff0:	00c0      	lsls	r0, r0, #3
    8ff2:	e76e      	b.n	8ed2 <_malloc_r+0x41a>
    8ff4:	f44f 737e 	mov.w	r3, #1016	; 0x3f8
    8ff8:	247f      	movs	r4, #127	; 0x7f
    8ffa:	f04f 0c7e 	mov.w	ip, #126	; 0x7e
    8ffe:	e5ae      	b.n	8b5e <_malloc_r+0xa6>
    9000:	f104 0108 	add.w	r1, r4, #8
    9004:	4630      	mov	r0, r6
    9006:	9201      	str	r2, [sp, #4]
    9008:	f7ff fc60 	bl	88cc <_free_r>
    900c:	9a01      	ldr	r2, [sp, #4]
    900e:	6813      	ldr	r3, [r2, #0]
    9010:	e6ba      	b.n	8d88 <_malloc_r+0x2d0>
    9012:	f240 5054 	movw	r0, #1364	; 0x554
    9016:	4281      	cmp	r1, r0
    9018:	bf9b      	ittet	ls
    901a:	0c99      	lsrls	r1, r3, #18
    901c:	f101 007d 	addls.w	r0, r1, #125	; 0x7d
    9020:	f44f 707e 	movhi.w	r0, #1016	; 0x3f8
    9024:	317c      	addls	r1, #124	; 0x7c
    9026:	bf8c      	ite	hi
    9028:	217e      	movhi	r1, #126	; 0x7e
    902a:	00c0      	lslls	r0, r0, #3
    902c:	e751      	b.n	8ed2 <_malloc_r+0x41a>
    902e:	687b      	ldr	r3, [r7, #4]
    9030:	e796      	b.n	8f60 <_malloc_r+0x4a8>
    9032:	bf00      	nop
    9034:	000194f0 	strdeq	r9, [r1], -r0

00009038 <__malloc_lock>:
__malloc_lock():
    9038:	f649 104c 	movw	r0, #39244	; 0x994c
    903c:	f2c0 0001 	movt	r0, #1
    9040:	f000 b824 	b.w	908c <__retarget_lock_acquire_recursive>

00009044 <__malloc_unlock>:
__malloc_unlock():
    9044:	f649 104c 	movw	r0, #39244	; 0x994c
    9048:	f2c0 0001 	movt	r0, #1
    904c:	f000 b826 	b.w	909c <__retarget_lock_release_recursive>

00009050 <_sbrk_r>:
_sbrk_r():
    9050:	b538      	push	{r3, r4, r5, lr}
    9052:	f649 1438 	movw	r4, #39224	; 0x9938
    9056:	f2c0 0401 	movt	r4, #1
    905a:	4605      	mov	r5, r0
    905c:	4608      	mov	r0, r1
    905e:	2300      	movs	r3, #0
    9060:	6023      	str	r3, [r4, #0]
    9062:	f7ff e98a 	blx	8378 <_sbrk>
    9066:	1c43      	adds	r3, r0, #1
    9068:	d000      	beq.n	906c <_sbrk_r+0x1c>
    906a:	bd38      	pop	{r3, r4, r5, pc}
    906c:	6823      	ldr	r3, [r4, #0]
    906e:	2b00      	cmp	r3, #0
    9070:	d0fb      	beq.n	906a <_sbrk_r+0x1a>
    9072:	602b      	str	r3, [r5, #0]
    9074:	bd38      	pop	{r3, r4, r5, pc}
    9076:	bf00      	nop

00009078 <__retarget_lock_init>:
__retarget_lock_init():
    9078:	4770      	bx	lr
    907a:	bf00      	nop

0000907c <__retarget_lock_init_recursive>:
__retarget_lock_init_recursive():
    907c:	4770      	bx	lr
    907e:	bf00      	nop

00009080 <__retarget_lock_close>:
__retarget_lock_close():
    9080:	4770      	bx	lr
    9082:	bf00      	nop

00009084 <__retarget_lock_close_recursive>:
__retarget_lock_close_recursive():
    9084:	4770      	bx	lr
    9086:	bf00      	nop

00009088 <__retarget_lock_acquire>:
__retarget_lock_acquire():
    9088:	4770      	bx	lr
    908a:	bf00      	nop

0000908c <__retarget_lock_acquire_recursive>:
__retarget_lock_acquire_recursive():
    908c:	4770      	bx	lr
    908e:	bf00      	nop

00009090 <__retarget_lock_try_acquire>:
__retarget_lock_try_acquire():
    9090:	2001      	movs	r0, #1
    9092:	4770      	bx	lr

00009094 <__retarget_lock_try_acquire_recursive>:
__retarget_lock_try_acquire_recursive():
    9094:	2001      	movs	r0, #1
    9096:	4770      	bx	lr

00009098 <__retarget_lock_release>:
__retarget_lock_release():
    9098:	4770      	bx	lr
    909a:	bf00      	nop

0000909c <__retarget_lock_release_recursive>:
__retarget_lock_release_recursive():
    909c:	4770      	bx	lr
    909e:	bf00      	nop

Disassembly of section .rodata:

000090a0 <_global_impure_ptr>:
    90a0:	000190c0 	andeq	r9, r1, r0, asr #1

Disassembly of section .data:

000190a8 <environ>:
__data_start():
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/armc-013-cstubs.c:48
char **environ = __env;
   190a8:	000198f8 	strdeq	r9, [r1], -r8

000190ac <rpiArmTimer>:
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-armtimer.c:14
static rpi_arm_timer_t* rpiArmTimer = (rpi_arm_timer_t*)RPI_ARMTIMER_BASE;
   190ac:	3f00b400 	svccc	0x0000b400

000190b0 <rpiGpio>:
static rpi_gpio_t* rpiGpio = (rpi_gpio_t*)RPI_GPIO_BASE;
   190b0:	3f200000 	svccc	0x00200000

000190b4 <rpiIRQController>:
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-interrupts.c:20
static rpi_irq_controller_t* rpiIRQController =
   190b4:	3f00b200 	svccc	0x0000b200

000190b8 <rpiSystemTimer>:
/mnt/d/uni/2019-2020/CTH/Digital_project_laboratory/mcu/part-4/armc-013/rpi-systimer.c:14
static rpi_sys_timer_t* rpiSystemTimer = (rpi_sys_timer_t*)RPI_SYSTIMER_BASE;
   190b8:	3f003000 	svccc	0x00003000

000190bc <_impure_ptr>:
   190bc:	000190c0 	andeq	r9, r1, r0, asr #1

000190c0 <impure_data>:
   190c0:	00000000 	andeq	r0, r0, r0
   190c4:	000193ac 	andeq	r9, r1, ip, lsr #7
   190c8:	00019414 	andeq	r9, r1, r4, lsl r4
   190cc:	0001947c 	andeq	r9, r1, ip, ror r4
	...
   19168:	00000001 	andeq	r0, r0, r1
   1916c:	00000000 	andeq	r0, r0, r0
   19170:	abcd330e 	blge	ff365db0 <_stack+0xff2e5db0>
   19174:	e66d1234 			; <UNDEFINED> instruction: 0xe66d1234
   19178:	0005deec 	andeq	sp, r5, ip, ror #29
   1917c:	0000000b 	andeq	r0, r0, fp
	...

000194e8 <__malloc_av_>:
	...
   194f0:	000194e8 	andeq	r9, r1, r8, ror #9
   194f4:	000194e8 	andeq	r9, r1, r8, ror #9
   194f8:	000194f0 	strdeq	r9, [r1], -r0
   194fc:	000194f0 	strdeq	r9, [r1], -r0
   19500:	000194f8 	strdeq	r9, [r1], -r8
   19504:	000194f8 	strdeq	r9, [r1], -r8
   19508:	00019500 	andeq	r9, r1, r0, lsl #10
   1950c:	00019500 	andeq	r9, r1, r0, lsl #10
   19510:	00019508 	andeq	r9, r1, r8, lsl #10
   19514:	00019508 	andeq	r9, r1, r8, lsl #10
   19518:	00019510 	andeq	r9, r1, r0, lsl r5
   1951c:	00019510 	andeq	r9, r1, r0, lsl r5
   19520:	00019518 	andeq	r9, r1, r8, lsl r5
   19524:	00019518 	andeq	r9, r1, r8, lsl r5
   19528:	00019520 	andeq	r9, r1, r0, lsr #10
   1952c:	00019520 	andeq	r9, r1, r0, lsr #10
   19530:	00019528 	andeq	r9, r1, r8, lsr #10
   19534:	00019528 	andeq	r9, r1, r8, lsr #10
   19538:	00019530 	andeq	r9, r1, r0, lsr r5
   1953c:	00019530 	andeq	r9, r1, r0, lsr r5
   19540:	00019538 	andeq	r9, r1, r8, lsr r5
   19544:	00019538 	andeq	r9, r1, r8, lsr r5
   19548:	00019540 	andeq	r9, r1, r0, asr #10
   1954c:	00019540 	andeq	r9, r1, r0, asr #10
   19550:	00019548 	andeq	r9, r1, r8, asr #10
   19554:	00019548 	andeq	r9, r1, r8, asr #10
   19558:	00019550 	andeq	r9, r1, r0, asr r5
   1955c:	00019550 	andeq	r9, r1, r0, asr r5
   19560:	00019558 	andeq	r9, r1, r8, asr r5
   19564:	00019558 	andeq	r9, r1, r8, asr r5
   19568:	00019560 	andeq	r9, r1, r0, ror #10
   1956c:	00019560 	andeq	r9, r1, r0, ror #10
   19570:	00019568 	andeq	r9, r1, r8, ror #10
   19574:	00019568 	andeq	r9, r1, r8, ror #10
   19578:	00019570 	andeq	r9, r1, r0, ror r5
   1957c:	00019570 	andeq	r9, r1, r0, ror r5
   19580:	00019578 	andeq	r9, r1, r8, ror r5
   19584:	00019578 	andeq	r9, r1, r8, ror r5
   19588:	00019580 	andeq	r9, r1, r0, lsl #11
   1958c:	00019580 	andeq	r9, r1, r0, lsl #11
   19590:	00019588 	andeq	r9, r1, r8, lsl #11
   19594:	00019588 	andeq	r9, r1, r8, lsl #11
   19598:	00019590 	muleq	r1, r0, r5
   1959c:	00019590 	muleq	r1, r0, r5
   195a0:	00019598 	muleq	r1, r8, r5
   195a4:	00019598 	muleq	r1, r8, r5
   195a8:	000195a0 	andeq	r9, r1, r0, lsr #11
   195ac:	000195a0 	andeq	r9, r1, r0, lsr #11
   195b0:	000195a8 	andeq	r9, r1, r8, lsr #11
   195b4:	000195a8 	andeq	r9, r1, r8, lsr #11
   195b8:	000195b0 			; <UNDEFINED> instruction: 0x000195b0
   195bc:	000195b0 			; <UNDEFINED> instruction: 0x000195b0
   195c0:	000195b8 			; <UNDEFINED> instruction: 0x000195b8
   195c4:	000195b8 			; <UNDEFINED> instruction: 0x000195b8
   195c8:	000195c0 	andeq	r9, r1, r0, asr #11
   195cc:	000195c0 	andeq	r9, r1, r0, asr #11
   195d0:	000195c8 	andeq	r9, r1, r8, asr #11
   195d4:	000195c8 	andeq	r9, r1, r8, asr #11
   195d8:	000195d0 	ldrdeq	r9, [r1], -r0
   195dc:	000195d0 	ldrdeq	r9, [r1], -r0
   195e0:	000195d8 	ldrdeq	r9, [r1], -r8
   195e4:	000195d8 	ldrdeq	r9, [r1], -r8
   195e8:	000195e0 	andeq	r9, r1, r0, ror #11
   195ec:	000195e0 	andeq	r9, r1, r0, ror #11
   195f0:	000195e8 	andeq	r9, r1, r8, ror #11
   195f4:	000195e8 	andeq	r9, r1, r8, ror #11
   195f8:	000195f0 	strdeq	r9, [r1], -r0
   195fc:	000195f0 	strdeq	r9, [r1], -r0
   19600:	000195f8 	strdeq	r9, [r1], -r8
   19604:	000195f8 	strdeq	r9, [r1], -r8
   19608:	00019600 	andeq	r9, r1, r0, lsl #12
   1960c:	00019600 	andeq	r9, r1, r0, lsl #12
   19610:	00019608 	andeq	r9, r1, r8, lsl #12
   19614:	00019608 	andeq	r9, r1, r8, lsl #12
   19618:	00019610 	andeq	r9, r1, r0, lsl r6
   1961c:	00019610 	andeq	r9, r1, r0, lsl r6
   19620:	00019618 	andeq	r9, r1, r8, lsl r6
   19624:	00019618 	andeq	r9, r1, r8, lsl r6
   19628:	00019620 	andeq	r9, r1, r0, lsr #12
   1962c:	00019620 	andeq	r9, r1, r0, lsr #12
   19630:	00019628 	andeq	r9, r1, r8, lsr #12
   19634:	00019628 	andeq	r9, r1, r8, lsr #12
   19638:	00019630 	andeq	r9, r1, r0, lsr r6
   1963c:	00019630 	andeq	r9, r1, r0, lsr r6
   19640:	00019638 	andeq	r9, r1, r8, lsr r6
   19644:	00019638 	andeq	r9, r1, r8, lsr r6
   19648:	00019640 	andeq	r9, r1, r0, asr #12
   1964c:	00019640 	andeq	r9, r1, r0, asr #12
   19650:	00019648 	andeq	r9, r1, r8, asr #12
   19654:	00019648 	andeq	r9, r1, r8, asr #12
   19658:	00019650 	andeq	r9, r1, r0, asr r6
   1965c:	00019650 	andeq	r9, r1, r0, asr r6
   19660:	00019658 	andeq	r9, r1, r8, asr r6
   19664:	00019658 	andeq	r9, r1, r8, asr r6
   19668:	00019660 	andeq	r9, r1, r0, ror #12
   1966c:	00019660 	andeq	r9, r1, r0, ror #12
   19670:	00019668 	andeq	r9, r1, r8, ror #12
   19674:	00019668 	andeq	r9, r1, r8, ror #12
   19678:	00019670 	andeq	r9, r1, r0, ror r6
   1967c:	00019670 	andeq	r9, r1, r0, ror r6
   19680:	00019678 	andeq	r9, r1, r8, ror r6
   19684:	00019678 	andeq	r9, r1, r8, ror r6
   19688:	00019680 	andeq	r9, r1, r0, lsl #13
   1968c:	00019680 	andeq	r9, r1, r0, lsl #13
   19690:	00019688 	andeq	r9, r1, r8, lsl #13
   19694:	00019688 	andeq	r9, r1, r8, lsl #13
   19698:	00019690 	muleq	r1, r0, r6
   1969c:	00019690 	muleq	r1, r0, r6
   196a0:	00019698 	muleq	r1, r8, r6
   196a4:	00019698 	muleq	r1, r8, r6
   196a8:	000196a0 	andeq	r9, r1, r0, lsr #13
   196ac:	000196a0 	andeq	r9, r1, r0, lsr #13
   196b0:	000196a8 	andeq	r9, r1, r8, lsr #13
   196b4:	000196a8 	andeq	r9, r1, r8, lsr #13
   196b8:	000196b0 			; <UNDEFINED> instruction: 0x000196b0
   196bc:	000196b0 			; <UNDEFINED> instruction: 0x000196b0
   196c0:	000196b8 			; <UNDEFINED> instruction: 0x000196b8
   196c4:	000196b8 			; <UNDEFINED> instruction: 0x000196b8
   196c8:	000196c0 	andeq	r9, r1, r0, asr #13
   196cc:	000196c0 	andeq	r9, r1, r0, asr #13
   196d0:	000196c8 	andeq	r9, r1, r8, asr #13
   196d4:	000196c8 	andeq	r9, r1, r8, asr #13
   196d8:	000196d0 	ldrdeq	r9, [r1], -r0
   196dc:	000196d0 	ldrdeq	r9, [r1], -r0
   196e0:	000196d8 	ldrdeq	r9, [r1], -r8
   196e4:	000196d8 	ldrdeq	r9, [r1], -r8
   196e8:	000196e0 	andeq	r9, r1, r0, ror #13
   196ec:	000196e0 	andeq	r9, r1, r0, ror #13
   196f0:	000196e8 	andeq	r9, r1, r8, ror #13
   196f4:	000196e8 	andeq	r9, r1, r8, ror #13
   196f8:	000196f0 	strdeq	r9, [r1], -r0
   196fc:	000196f0 	strdeq	r9, [r1], -r0
   19700:	000196f8 	strdeq	r9, [r1], -r8
   19704:	000196f8 	strdeq	r9, [r1], -r8
   19708:	00019700 	andeq	r9, r1, r0, lsl #14
   1970c:	00019700 	andeq	r9, r1, r0, lsl #14
   19710:	00019708 	andeq	r9, r1, r8, lsl #14
   19714:	00019708 	andeq	r9, r1, r8, lsl #14
   19718:	00019710 	andeq	r9, r1, r0, lsl r7
   1971c:	00019710 	andeq	r9, r1, r0, lsl r7
   19720:	00019718 	andeq	r9, r1, r8, lsl r7
   19724:	00019718 	andeq	r9, r1, r8, lsl r7
   19728:	00019720 	andeq	r9, r1, r0, lsr #14
   1972c:	00019720 	andeq	r9, r1, r0, lsr #14
   19730:	00019728 	andeq	r9, r1, r8, lsr #14
   19734:	00019728 	andeq	r9, r1, r8, lsr #14
   19738:	00019730 	andeq	r9, r1, r0, lsr r7
   1973c:	00019730 	andeq	r9, r1, r0, lsr r7
   19740:	00019738 	andeq	r9, r1, r8, lsr r7
   19744:	00019738 	andeq	r9, r1, r8, lsr r7
   19748:	00019740 	andeq	r9, r1, r0, asr #14
   1974c:	00019740 	andeq	r9, r1, r0, asr #14
   19750:	00019748 	andeq	r9, r1, r8, asr #14
   19754:	00019748 	andeq	r9, r1, r8, asr #14
   19758:	00019750 	andeq	r9, r1, r0, asr r7
   1975c:	00019750 	andeq	r9, r1, r0, asr r7
   19760:	00019758 	andeq	r9, r1, r8, asr r7
   19764:	00019758 	andeq	r9, r1, r8, asr r7
   19768:	00019760 	andeq	r9, r1, r0, ror #14
   1976c:	00019760 	andeq	r9, r1, r0, ror #14
   19770:	00019768 	andeq	r9, r1, r8, ror #14
   19774:	00019768 	andeq	r9, r1, r8, ror #14
   19778:	00019770 	andeq	r9, r1, r0, ror r7
   1977c:	00019770 	andeq	r9, r1, r0, ror r7
   19780:	00019778 	andeq	r9, r1, r8, ror r7
   19784:	00019778 	andeq	r9, r1, r8, ror r7
   19788:	00019780 	andeq	r9, r1, r0, lsl #15
   1978c:	00019780 	andeq	r9, r1, r0, lsl #15
   19790:	00019788 	andeq	r9, r1, r8, lsl #15
   19794:	00019788 	andeq	r9, r1, r8, lsl #15
   19798:	00019790 	muleq	r1, r0, r7
   1979c:	00019790 	muleq	r1, r0, r7
   197a0:	00019798 	muleq	r1, r8, r7
   197a4:	00019798 	muleq	r1, r8, r7
   197a8:	000197a0 	andeq	r9, r1, r0, lsr #15
   197ac:	000197a0 	andeq	r9, r1, r0, lsr #15
   197b0:	000197a8 	andeq	r9, r1, r8, lsr #15
   197b4:	000197a8 	andeq	r9, r1, r8, lsr #15
   197b8:	000197b0 			; <UNDEFINED> instruction: 0x000197b0
   197bc:	000197b0 			; <UNDEFINED> instruction: 0x000197b0
   197c0:	000197b8 			; <UNDEFINED> instruction: 0x000197b8
   197c4:	000197b8 			; <UNDEFINED> instruction: 0x000197b8
   197c8:	000197c0 	andeq	r9, r1, r0, asr #15
   197cc:	000197c0 	andeq	r9, r1, r0, asr #15
   197d0:	000197c8 	andeq	r9, r1, r8, asr #15
   197d4:	000197c8 	andeq	r9, r1, r8, asr #15
   197d8:	000197d0 	ldrdeq	r9, [r1], -r0
   197dc:	000197d0 	ldrdeq	r9, [r1], -r0
   197e0:	000197d8 	ldrdeq	r9, [r1], -r8
   197e4:	000197d8 	ldrdeq	r9, [r1], -r8
   197e8:	000197e0 	andeq	r9, r1, r0, ror #15
   197ec:	000197e0 	andeq	r9, r1, r0, ror #15
   197f0:	000197e8 	andeq	r9, r1, r8, ror #15
   197f4:	000197e8 	andeq	r9, r1, r8, ror #15
   197f8:	000197f0 	strdeq	r9, [r1], -r0
   197fc:	000197f0 	strdeq	r9, [r1], -r0
   19800:	000197f8 	strdeq	r9, [r1], -r8
   19804:	000197f8 	strdeq	r9, [r1], -r8
   19808:	00019800 	andeq	r9, r1, r0, lsl #16
   1980c:	00019800 	andeq	r9, r1, r0, lsl #16
   19810:	00019808 	andeq	r9, r1, r8, lsl #16
   19814:	00019808 	andeq	r9, r1, r8, lsl #16
   19818:	00019810 	andeq	r9, r1, r0, lsl r8
   1981c:	00019810 	andeq	r9, r1, r0, lsl r8
   19820:	00019818 	andeq	r9, r1, r8, lsl r8
   19824:	00019818 	andeq	r9, r1, r8, lsl r8
   19828:	00019820 	andeq	r9, r1, r0, lsr #16
   1982c:	00019820 	andeq	r9, r1, r0, lsr #16
   19830:	00019828 	andeq	r9, r1, r8, lsr #16
   19834:	00019828 	andeq	r9, r1, r8, lsr #16
   19838:	00019830 	andeq	r9, r1, r0, lsr r8
   1983c:	00019830 	andeq	r9, r1, r0, lsr r8
   19840:	00019838 	andeq	r9, r1, r8, lsr r8
   19844:	00019838 	andeq	r9, r1, r8, lsr r8
   19848:	00019840 	andeq	r9, r1, r0, asr #16
   1984c:	00019840 	andeq	r9, r1, r0, asr #16
   19850:	00019848 	andeq	r9, r1, r8, asr #16
   19854:	00019848 	andeq	r9, r1, r8, asr #16
   19858:	00019850 	andeq	r9, r1, r0, asr r8
   1985c:	00019850 	andeq	r9, r1, r0, asr r8
   19860:	00019858 	andeq	r9, r1, r8, asr r8
   19864:	00019858 	andeq	r9, r1, r8, asr r8
   19868:	00019860 	andeq	r9, r1, r0, ror #16
   1986c:	00019860 	andeq	r9, r1, r0, ror #16
   19870:	00019868 	andeq	r9, r1, r8, ror #16
   19874:	00019868 	andeq	r9, r1, r8, ror #16
   19878:	00019870 	andeq	r9, r1, r0, ror r8
   1987c:	00019870 	andeq	r9, r1, r0, ror r8
   19880:	00019878 	andeq	r9, r1, r8, ror r8
   19884:	00019878 	andeq	r9, r1, r8, ror r8
   19888:	00019880 	andeq	r9, r1, r0, lsl #17
   1988c:	00019880 	andeq	r9, r1, r0, lsl #17
   19890:	00019888 	andeq	r9, r1, r8, lsl #17
   19894:	00019888 	andeq	r9, r1, r8, lsl #17
   19898:	00019890 	muleq	r1, r0, r8
   1989c:	00019890 	muleq	r1, r0, r8
   198a0:	00019898 	muleq	r1, r8, r8
   198a4:	00019898 	muleq	r1, r8, r8
   198a8:	000198a0 	andeq	r9, r1, r0, lsr #17
   198ac:	000198a0 	andeq	r9, r1, r0, lsr #17
   198b0:	000198a8 	andeq	r9, r1, r8, lsr #17
   198b4:	000198a8 	andeq	r9, r1, r8, lsr #17
   198b8:	000198b0 			; <UNDEFINED> instruction: 0x000198b0
   198bc:	000198b0 			; <UNDEFINED> instruction: 0x000198b0
   198c0:	000198b8 			; <UNDEFINED> instruction: 0x000198b8
   198c4:	000198b8 			; <UNDEFINED> instruction: 0x000198b8
   198c8:	000198c0 	andeq	r9, r1, r0, asr #17
   198cc:	000198c0 	andeq	r9, r1, r0, asr #17
   198d0:	000198c8 	andeq	r9, r1, r8, asr #17
   198d4:	000198c8 	andeq	r9, r1, r8, asr #17
   198d8:	000198d0 	ldrdeq	r9, [r1], -r0
   198dc:	000198d0 	ldrdeq	r9, [r1], -r0
   198e0:	000198d8 	ldrdeq	r9, [r1], -r8
   198e4:	000198d8 	ldrdeq	r9, [r1], -r8
   198e8:	000198e0 	andeq	r9, r1, r0, ror #17
   198ec:	000198e0 	andeq	r9, r1, r0, ror #17

000198f0 <__malloc_sbrk_base>:
   198f0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff

000198f4 <__malloc_trim_threshold>:
   198f4:	00020000 	andeq	r0, r2, r0

Disassembly of section .bss:

000198f8 <__env>:
__bss_start():
   198f8:	00000000 	andeq	r0, r0, r0

000198fc <heap_end.5916>:
heap_end.5916():
   198fc:	00000000 	andeq	r0, r0, r0

00019900 <lit.5526>:
lit.5526():
   19900:	00000000 	andeq	r0, r0, r0

00019904 <__malloc_current_mallinfo>:
	...

0001992c <__malloc_max_sbrked_mem>:
   1992c:	00000000 	andeq	r0, r0, r0

00019930 <__malloc_max_total_mem>:
   19930:	00000000 	andeq	r0, r0, r0

00019934 <__malloc_top_pad>:
   19934:	00000000 	andeq	r0, r0, r0

00019938 <errno>:
   19938:	00000000 	andeq	r0, r0, r0

0001993c <__lock___atexit_recursive_mutex>:
   1993c:	00000000 	andeq	r0, r0, r0

00019940 <__lock___arc4random_mutex>:
   19940:	00000000 	andeq	r0, r0, r0

00019944 <__lock___env_recursive_mutex>:
   19944:	00000000 	andeq	r0, r0, r0

00019948 <__lock___sinit_recursive_mutex>:
   19948:	00000000 	andeq	r0, r0, r0

0001994c <__lock___malloc_recursive_mutex>:
   1994c:	00000000 	andeq	r0, r0, r0

00019950 <__lock___at_quick_exit_mutex>:
   19950:	00000000 	andeq	r0, r0, r0

00019954 <__lock___dd_hash_mutex>:
   19954:	00000000 	andeq	r0, r0, r0

00019958 <__lock___tz_mutex>:
   19958:	00000000 	andeq	r0, r0, r0

0001995c <__lock___sfp_recursive_mutex>:
   1995c:	00000000 	andeq	r0, r0, r0

Disassembly of section .comment:

00000000 <_stack-0x80000>:
   0:	3a434347 	bcc	10d0d24 <_stack+0x1050d24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	206d7241 	rsbcs	r7, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xfffff2bb
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0xfffffb9c
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2073726f 	rsbscs	r7, r3, pc, ror #4
  2c:	30322d37 	eorscc	r2, r2, r7, lsr sp
  30:	712d3831 			; <UNDEFINED> instruction: 0x712d3831
  34:	70752d32 	rsbsvc	r2, r5, r2, lsr sp
  38:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
  3c:	2e372029 	cdpcs	0, 3, cr2, cr7, cr9, {1}
  40:	20312e33 	eorscs	r2, r1, r3, lsr lr
  44:	38313032 	ldmdacc	r1!, {r1, r4, r5, ip, sp}
  48:	32323630 	eorscc	r3, r2, #48, 12	; 0x3000000
  4c:	65722820 	ldrbvs	r2, [r2, #-2080]!	; 0xfffff7e0
  50:	7361656c 	cmnvc	r1, #108, 10	; 0x1b000000
  54:	5b202965 	blpl	80a5f0 <_stack+0x78a5f0>
  58:	2f4d5241 	svccs	0x004d5241
  5c:	65626d65 	strbvs	r6, [r2, #-3429]!	; 0xfffff29b
  60:	64656464 	strbtvs	r6, [r5], #-1124	; 0xfffffb9c
  64:	622d372d 	eorvs	r3, sp, #11796480	; 0xb40000
  68:	636e6172 	cmnvs	lr, #-2147483620	; 0x8000001c
  6c:	65722068 	ldrbvs	r2, [r2, #-104]!	; 0xffffff98
  70:	69736976 	ldmdbvs	r3!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
  74:	32206e6f 	eorcc	r6, r0, #1776	; 0x6f0
  78:	30393136 	eorscc	r3, r9, r6, lsr r1
  7c:	Address 0x000000000000007c is out of bounds.


Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008094 	muleq	r0, r4, r0
  14:	00000070 	andeq	r0, r0, r0, ror r0
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	08da0002 	ldmeq	sl, {r1}^
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008104 	andeq	r8, r0, r4, lsl #2
  34:	0000006c 	andeq	r0, r0, ip, rrx
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	09830002 	stmibeq	r3, {r1}
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	00008170 	andeq	r8, r0, r0, ror r1
  54:	000003f4 	strdeq	r0, [r0], -r4
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	18aa0002 	stmiane	sl!, {r1}
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008564 	andeq	r8, r0, r4, ror #10
  74:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	19ee0002 	stmibne	lr!, {r1}^
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000085a0 	andeq	r8, r0, r0, lsr #11
  94:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	1cd80002 	ldclne	0, cr0, [r8], {2}
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	000085dc 	ldrdeq	r8, [r0], -ip
  b4:	00000114 	andeq	r0, r0, r4, lsl r1
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	1ea40002 	cdpne	0, 10, cr0, cr4, cr2, {0}
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	000086f0 	strdeq	r8, [r0], -r0
  d4:	00000080 	andeq	r0, r0, r0, lsl #1
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	000008d6 	ldrdeq	r0, [r0], -r6
       4:	00000004 	andeq	r0, r0, r4
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	00000205 	andeq	r0, r0, r5, lsl #4
      10:	0003120c 	andeq	r1, r3, ip, lsl #4
      14:	00038000 	andeq	r8, r3, r0
      18:	00809400 	addeq	r9, r0, r0, lsl #8
      1c:	00007000 	andeq	r7, r0, r0
      20:	00000000 	andeq	r0, r0, r0
      24:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
      28:	00746e69 	rsbseq	r6, r4, r9, ror #28
      2c:	4f070403 	svcmi	0x00070403
      30:	03000000 	movweq	r0, #0
      34:	00880508 	addeq	r0, r8, r8, lsl #10
      38:	08030000 	stmdaeq	r3, {}	; <UNPREDICTABLE>
      3c:	0002d904 	andeq	sp, r2, r4, lsl #18
      40:	06010300 	streq	r0, [r1], -r0, lsl #6
      44:	000003d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
      48:	ce080103 	adfgte	f0, f0, f3
      4c:	03000003 	movweq	r0, #3
      50:	03ea0502 	mvneq	r0, #8388608	; 0x800000
      54:	02030000 	andeq	r0, r3, #0
      58:	00019407 	andeq	r9, r1, r7, lsl #8
      5c:	05040300 	streq	r0, [r4, #-768]	; 0xfffffd00
      60:	0000008d 	andeq	r0, r0, sp, lsl #1
      64:	4a070403 	bmi	1c1078 <_stack+0x141078>
      68:	03000000 	movweq	r0, #0
      6c:	00450708 	subeq	r0, r5, r8, lsl #14
      70:	dd040000 	stcle	0, cr0, [r4, #-0]
      74:	02000001 	andeq	r0, r0, #1
      78:	00007d22 	andeq	r7, r0, r2, lsr #26
      7c:	83040500 	movwhi	r0, #17664	; 0x4500
      80:	06000000 	streq	r0, [r0], -r0
      84:	00000495 	muleq	r0, r5, r4
      88:	00061d04 	andeq	r1, r6, r4, lsl #26
      8c:	5d2c0300 	stcpl	3, cr0, [ip, #-0]
      90:	04000000 	streq	r0, [r0], #-0
      94:	000004aa 	andeq	r0, r0, sl, lsr #9
      98:	005d7203 	subseq	r7, sp, r3, lsl #4
      9c:	e5070000 	str	r0, [r7, #-0]
      a0:	04000001 	streq	r0, [r0], #-1
      a4:	002c0165 	eoreq	r0, ip, r5, ror #2
      a8:	04080000 	streq	r0, [r8], #-0
      ac:	00c9a603 	sbceq	sl, r9, r3, lsl #12
      b0:	d7090000 	strle	r0, [r9, -r0]
      b4:	03000001 	movweq	r0, #1
      b8:	00009ea8 	andeq	r9, r0, r8, lsr #29
      bc:	01700900 	cmneq	r0, r0, lsl #18
      c0:	a9030000 	stmdbge	r3, {}	; <UNPREDICTABLE>
      c4:	000000c9 	andeq	r0, r0, r9, asr #1
      c8:	00480a00 	subeq	r0, r8, r0, lsl #20
      cc:	00d90000 	sbcseq	r0, r9, r0
      d0:	2c0b0000 	stccs	0, cr0, [fp], {-0}
      d4:	03000000 	movweq	r0, #0
      d8:	03080c00 	movweq	r0, #35840	; 0x8c00
      dc:	0000faa3 	andeq	pc, r0, r3, lsr #21
      e0:	048d0d00 	streq	r0, [sp], #3328	; 0xd00
      e4:	a5030000 	strge	r0, [r3, #-0]
      e8:	00000025 	andeq	r0, r0, r5, lsr #32
      ec:	049c0d00 	ldreq	r0, [ip], #3328	; 0xd00
      f0:	aa030000 	bge	c00f8 <_stack+0x400f8>
      f4:	000000aa 	andeq	r0, r0, sl, lsr #1
      f8:	16040004 	strne	r0, [r4], -r4
      fc:	03000004 	movweq	r0, #4
     100:	0000d9ab 	andeq	sp, r0, fp, lsr #19
     104:	01330400 	teqeq	r3, r0, lsl #8
     108:	af030000 	svcge	0x00030000
     10c:	00000072 	andeq	r0, r0, r2, ror r0
     110:	0405040e 	streq	r0, [r5], #-1038	; 0xfffffbf2
     114:	00000118 	andeq	r0, r0, r8, lsl r1
     118:	d7080103 	strle	r0, [r8, -r3, lsl #2]
     11c:	0f000003 	svceq	0x00000003
     120:	00000118 	andeq	r0, r0, r8, lsl r1
     124:	0004dc04 	andeq	sp, r4, r4, lsl #24
     128:	64160500 	ldrvs	r0, [r6], #-1280	; 0xfffffb00
     12c:	10000000 	andne	r0, r0, r0
     130:	00000144 	andeq	r0, r0, r4, asr #2
     134:	822f0518 	eorhi	r0, pc, #24, 10	; 0x6000000
     138:	0d000001 	stceq	0, cr0, [r0, #-4]
     13c:	00000437 	andeq	r0, r0, r7, lsr r4
     140:	01823105 	orreq	r3, r2, r5, lsl #2
     144:	11000000 	mrsne	r0, (UNDEF: 0)
     148:	05006b5f 	streq	r6, [r0, #-2911]	; 0xfffff4a1
     14c:	00002532 	andeq	r2, r0, r2, lsr r5
     150:	780d0400 	stmdavc	sp, {sl}
     154:	05000004 	streq	r0, [r0, #-4]
     158:	00002532 	andeq	r2, r0, r2, lsr r5
     15c:	2d0d0800 	stccs	8, cr0, [sp, #-0]
     160:	05000001 	streq	r0, [r0, #-1]
     164:	00002532 	andeq	r2, r0, r2, lsr r5
     168:	110d0c00 	tstne	sp, r0, lsl #24
     16c:	05000005 	streq	r0, [r0, #-5]
     170:	00002532 	andeq	r2, r0, r2, lsr r5
     174:	5f111000 	svcpl	0x00111000
     178:	33050078 	movwcc	r0, #20600	; 0x5078
     17c:	00000188 	andeq	r0, r0, r8, lsl #3
     180:	04050014 	streq	r0, [r5], #-20	; 0xffffffec
     184:	0000012f 	andeq	r0, r0, pc, lsr #2
     188:	0001240a 	andeq	r2, r1, sl, lsl #8
     18c:	00019800 	andeq	r9, r1, r0, lsl #16
     190:	002c0b00 	eoreq	r0, ip, r0, lsl #22
     194:	00000000 	andeq	r0, r0, r0
     198:	00016b10 	andeq	r6, r1, r0, lsl fp
     19c:	37052400 	strcc	r2, [r5, -r0, lsl #8]
     1a0:	00000211 	andeq	r0, r0, r1, lsl r2
     1a4:	00007f0d 	andeq	r7, r0, sp, lsl #30
     1a8:	25390500 	ldrcs	r0, [r9, #-1280]!	; 0xfffffb00
     1ac:	00000000 	andeq	r0, r0, r0
     1b0:	0004b20d 	andeq	fp, r4, sp, lsl #4
     1b4:	253a0500 	ldrcs	r0, [sl, #-1280]!	; 0xfffffb00
     1b8:	04000000 	streq	r0, [r0], #-0
     1bc:	0000a20d 	andeq	sl, r0, sp, lsl #4
     1c0:	253b0500 	ldrcs	r0, [fp, #-1280]!	; 0xfffffb00
     1c4:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     1c8:	00058a0d 	andeq	r8, r5, sp, lsl #20
     1cc:	253c0500 	ldrcs	r0, [ip, #-1280]!	; 0xfffffb00
     1d0:	0c000000 	stceq	0, cr0, [r0], {-0}
     1d4:	0002ec0d 	andeq	lr, r2, sp, lsl #24
     1d8:	253d0500 	ldrcs	r0, [sp, #-1280]!	; 0xfffffb00
     1dc:	10000000 	andne	r0, r0, r0
     1e0:	0001fb0d 	andeq	pc, r1, sp, lsl #22
     1e4:	253e0500 	ldrcs	r0, [lr, #-1280]!	; 0xfffffb00
     1e8:	14000000 	strne	r0, [r0], #-0
     1ec:	0005160d 	andeq	r1, r5, sp, lsl #12
     1f0:	253f0500 	ldrcs	r0, [pc, #-1280]!	; fffffcf8 <_stack+0xfff7fcf8>
     1f4:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     1f8:	0003f40d 	andeq	pc, r3, sp, lsl #8
     1fc:	25400500 	strbcs	r0, [r0, #-1280]	; 0xfffffb00
     200:	1c000000 	stcne	0, cr0, [r0], {-0}
     204:	0005510d 	andeq	r5, r5, sp, lsl #2
     208:	25410500 	strbcs	r0, [r1, #-1280]	; 0xfffffb00
     20c:	20000000 	andcs	r0, r0, r0
     210:	00b11200 	adcseq	r1, r1, r0, lsl #4
     214:	01080000 	mrseq	r0, (UNDEF: 8)
     218:	02514a05 	subseq	r4, r1, #20480	; 0x5000
     21c:	140d0000 	strne	r0, [sp], #-0
     220:	05000001 	streq	r0, [r0, #-1]
     224:	0002514b 	andeq	r5, r2, fp, asr #2
     228:	000d0000 	andeq	r0, sp, r0
     22c:	05000000 	streq	r0, [r0, #-0]
     230:	0002514c 	andeq	r5, r2, ip, asr #2
     234:	ce138000 	cdpgt	0, 1, cr8, cr3, cr0, {0}
     238:	05000004 	streq	r0, [r0, #-4]
     23c:	0001244e 	andeq	r2, r1, lr, asr #8
     240:	13010000 	movwne	r0, #4096	; 0x1000
     244:	000000d6 	ldrdeq	r0, [r0], -r6
     248:	01245105 			; <UNDEFINED> instruction: 0x01245105
     24c:	01040000 	mrseq	r0, (UNDEF: 4)
     250:	01100a00 	tsteq	r0, r0, lsl #20
     254:	02610000 	rsbeq	r0, r1, #0
     258:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     25c:	1f000000 	svcne	0x00000000
     260:	02f51200 	rscseq	r1, r5, #0, 4
     264:	01900000 	orrseq	r0, r0, r0
     268:	029f5d05 	addseq	r5, pc, #320	; 0x140
     26c:	370d0000 	strcc	r0, [sp, -r0]
     270:	05000004 	streq	r0, [r0, #-4]
     274:	00029f5e 	andeq	r9, r2, lr, asr pc
     278:	480d0000 	stmdami	sp, {}	; <UNPREDICTABLE>
     27c:	05000004 	streq	r0, [r0, #-4]
     280:	0000255f 	andeq	r2, r0, pc, asr r5
     284:	1c0d0400 	cfstrsne	mvf0, [sp], {-0}
     288:	05000001 	streq	r0, [r0, #-1]
     28c:	0002a561 	andeq	sl, r2, r1, ror #10
     290:	b10d0800 	tstlt	sp, r0, lsl #16
     294:	05000000 	streq	r0, [r0, #-0]
     298:	00021162 	andeq	r1, r2, r2, ror #2
     29c:	05008800 	streq	r8, [r0, #-2048]	; 0xfffff800
     2a0:	00026104 	andeq	r6, r2, r4, lsl #2
     2a4:	02b50a00 	adcseq	r0, r5, #0, 20
     2a8:	02b50000 	adcseq	r0, r5, #0
     2ac:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     2b0:	1f000000 	svcne	0x00000000
     2b4:	bb040500 	bllt	1016bc <_stack+0x816bc>
     2b8:	14000002 	strne	r0, [r0], #-2
     2bc:	0003fe10 	andeq	pc, r3, r0, lsl lr	; <UNPREDICTABLE>
     2c0:	75050800 	strvc	r0, [r5, #-2048]	; 0xfffff800
     2c4:	000002e1 	andeq	r0, r0, r1, ror #5
     2c8:	00009c0d 	andeq	r9, r0, sp, lsl #24
     2cc:	e1760500 	cmn	r6, r0, lsl #10
     2d0:	00000002 	andeq	r0, r0, r2
     2d4:	00071f0d 	andeq	r1, r7, sp, lsl #30
     2d8:	25770500 	ldrbcs	r0, [r7, #-1280]!	; 0xfffffb00
     2dc:	04000000 	streq	r0, [r0], #-0
     2e0:	48040500 	stmdami	r4, {r8, sl}
     2e4:	10000000 	andne	r0, r0, r0
     2e8:	00000421 	andeq	r0, r0, r1, lsr #8
     2ec:	11b50568 			; <UNDEFINED> instruction: 0x11b50568
     2f0:	11000004 	tstne	r0, r4
     2f4:	0500705f 	streq	r7, [r0, #-95]	; 0xffffffa1
     2f8:	0002e1b6 			; <UNDEFINED> instruction: 0x0002e1b6
     2fc:	5f110000 	svcpl	0x00110000
     300:	b7050072 	smlsdxlt	r5, r2, r0, r0
     304:	00000025 	andeq	r0, r0, r5, lsr #32
     308:	775f1104 	ldrbvc	r1, [pc, -r4, lsl #2]
     30c:	25b80500 	ldrcs	r0, [r8, #1280]!	; 0x500
     310:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     314:	0000cf0d 	andeq	ip, r0, sp, lsl #30
     318:	4fb90500 	svcmi	0x00b90500
     31c:	0c000000 	stceq	0, cr0, [r0], {-0}
     320:	0001870d 	andeq	r8, r1, sp, lsl #14
     324:	4fba0500 	svcmi	0x00ba0500
     328:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     32c:	66625f11 	uqadd16vs	r5, r2, r1
     330:	bcbb0500 	cfldr32lt	mvfx0, [fp]
     334:	10000002 	andne	r0, r0, r2
     338:	00005c0d 	andeq	r5, r0, sp, lsl #24
     33c:	25bc0500 	ldrcs	r0, [ip, #1280]!	; 0x500
     340:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     344:	0000bf0d 	andeq	fp, r0, sp, lsl #30
     348:	10c30500 	sbcne	r0, r3, r0, lsl #10
     34c:	1c000001 	stcne	0, cr0, [r0], {1}
     350:	00015b0d 	andeq	r5, r1, sp, lsl #22
     354:	6cc50500 	cfstr64vs	mvdx0, [r5], {0}
     358:	20000005 	andcs	r0, r0, r5
     35c:	0001f40d 	andeq	pc, r1, sp, lsl #8
     360:	96c70500 	strbls	r0, [r7], r0, lsl #10
     364:	24000005 	strcs	r0, [r0], #-5
     368:	0004a40d 	andeq	sl, r4, sp, lsl #8
     36c:	baca0500 	blt	ff281774 <_stack+0xff201774>
     370:	28000005 	stmdacs	r0, {r0, r2}
     374:	00056b0d 	andeq	r6, r5, sp, lsl #22
     378:	d4cb0500 	strble	r0, [fp], #1280	; 0x500
     37c:	2c000005 	stccs	0, cr0, [r0], {5}
     380:	62755f11 	rsbsvs	r5, r5, #17, 30	; 0x44
     384:	bcce0500 	cfstr64lt	mvdx0, [lr], {0}
     388:	30000002 	andcc	r0, r0, r2
     38c:	70755f11 	rsbsvc	r5, r5, r1, lsl pc
     390:	e1cf0500 	bic	r0, pc, r0, lsl #10
     394:	38000002 	stmdacc	r0, {r1}
     398:	72755f11 	rsbsvc	r5, r5, #17, 30	; 0x44
     39c:	25d00500 	ldrbcs	r0, [r0, #1280]	; 0x500
     3a0:	3c000000 	stccc	0, cr0, [r0], {-0}
     3a4:	0000960d 	andeq	r9, r0, sp, lsl #12
     3a8:	dad30500 	ble	ff4c17b0 <_stack+0xff4417b0>
     3ac:	40000005 	andmi	r0, r0, r5
     3b0:	0005430d 	andeq	r4, r5, sp, lsl #6
     3b4:	ead40500 	b	ff5017bc <_stack+0xff4817bc>
     3b8:	43000005 	movwmi	r0, #5
     3bc:	626c5f11 	rsbvs	r5, ip, #17, 30	; 0x44
     3c0:	bcd70500 	cfldr64lt	mvdx0, [r7], {0}
     3c4:	44000002 	strmi	r0, [r0], #-2
     3c8:	0007c00d 	andeq	ip, r7, sp
     3cc:	25da0500 	ldrbcs	r0, [sl, #1280]	; 0x500
     3d0:	4c000000 	stcmi	0, cr0, [r0], {-0}
     3d4:	0000ed0d 	andeq	lr, r0, sp, lsl #26
     3d8:	88db0500 	ldmhi	fp, {r8, sl}^
     3dc:	50000000 	andpl	r0, r0, r0
     3e0:	00001f0d 	andeq	r1, r0, sp, lsl #30
     3e4:	2fde0500 	svccs	0x00de0500
     3e8:	54000004 	strpl	r0, [r0], #-4
     3ec:	0004960d 	andeq	r9, r4, sp, lsl #12
     3f0:	05e20500 	strbeq	r0, [r2, #1280]!	; 0x500
     3f4:	58000001 	stmdapl	r0, {r0}
     3f8:	0004290d 	andeq	r2, r4, sp, lsl #18
     3fc:	fae40500 	blx	ff901804 <_stack+0xff881804>
     400:	5c000000 	stcpl	0, cr0, [r0], {-0}
     404:	0001ec0d 	andeq	lr, r1, sp, lsl #24
     408:	25e50500 	strbcs	r0, [r5, #1280]!	; 0x500
     40c:	64000000 	strvs	r0, [r0], #-0
     410:	00251500 	eoreq	r1, r5, r0, lsl #10
     414:	042f0000 	strteq	r0, [pc], #-0	; 41c <CPSR_IRQ_INHIBIT+0x39c>
     418:	2f160000 	svccs	0x00160000
     41c:	16000004 	strne	r0, [r0], -r4
     420:	00000110 	andeq	r0, r0, r0, lsl r1
     424:	00011216 	andeq	r1, r1, r6, lsl r2
     428:	00251600 	eoreq	r1, r5, r0, lsl #12
     42c:	05000000 	streq	r0, [r0, #-0]
     430:	00043a04 	andeq	r3, r4, r4, lsl #20
     434:	042f0f00 	strteq	r0, [pc], #-3840	; 43c <CPSR_IRQ_INHIBIT+0x3bc>
     438:	80170000 	andshi	r0, r7, r0
     43c:	28000004 	stmdacs	r0, {r2}
     440:	02600504 	rsbeq	r0, r0, #4, 10	; 0x1000000
     444:	0000056c 	andeq	r0, r0, ip, ror #10
     448:	0003e318 	andeq	lr, r3, r8, lsl r3
     44c:	02620500 	rsbeq	r0, r2, #0, 10
     450:	00000025 	andeq	r0, r0, r5, lsr #32
     454:	00de1800 	sbcseq	r1, lr, r0, lsl #16
     458:	67050000 	strvs	r0, [r5, -r0]
     45c:	00064102 	andeq	r4, r6, r2, lsl #2
     460:	77180400 	ldrvc	r0, [r8, -r0, lsl #8]
     464:	05000001 	streq	r0, [r0, #-1]
     468:	06410267 	strbeq	r0, [r1], -r7, ror #4
     46c:	18080000 	stmdane	r8, {}	; <UNPREDICTABLE>
     470:	0000013c 	andeq	r0, r0, ip, lsr r1
     474:	41026705 	tstmi	r2, r5, lsl #14
     478:	0c000006 	stceq	0, cr0, [r0], {6}
     47c:	00044318 	andeq	r4, r4, r8, lsl r3
     480:	02690500 	rsbeq	r0, r9, #0, 10
     484:	00000025 	andeq	r0, r0, r5, lsr #32
     488:	00141810 	andseq	r1, r4, r0, lsl r8
     48c:	6a050000 	bvs	140494 <_stack+0xc0494>
     490:	00082302 	andeq	r2, r8, r2, lsl #6
     494:	5f181400 	svcpl	0x00181400
     498:	05000004 	streq	r0, [r0, #-4]
     49c:	0025026d 	eoreq	r0, r5, sp, ror #4
     4a0:	18300000 	ldmdane	r0!, {}	; <UNPREDICTABLE>
     4a4:	0000044d 	andeq	r0, r0, sp, asr #8
     4a8:	38026e05 	stmdacc	r2, {r0, r2, r9, sl, fp, sp, lr}
     4ac:	34000008 	strcc	r0, [r0], #-8
     4b0:	00030718 	andeq	r0, r3, r8, lsl r7
     4b4:	02700500 	rsbseq	r0, r0, #0, 10
     4b8:	00000025 	andeq	r0, r0, r5, lsr #32
     4bc:	04551838 	ldrbeq	r1, [r5], #-2104	; 0xfffff7c8
     4c0:	72050000 	andvc	r0, r5, #0
     4c4:	00084902 	andeq	r4, r8, r2, lsl #18
     4c8:	cf183c00 	svcgt	0x00183c00
     4cc:	05000001 	streq	r0, [r0, #-1]
     4d0:	01820275 	orreq	r0, r2, r5, ror r2
     4d4:	18400000 	stmdane	r0, {}^	; <UNPREDICTABLE>
     4d8:	00000161 	andeq	r0, r0, r1, ror #2
     4dc:	25027605 	strcs	r7, [r2, #-1541]	; 0xfffff9fb
     4e0:	44000000 	strmi	r0, [r0], #-0
     4e4:	00058518 	andeq	r8, r5, r8, lsl r5
     4e8:	02770500 	rsbseq	r0, r7, #0, 10
     4ec:	00000182 	andeq	r0, r0, r2, lsl #3
     4f0:	04051848 	streq	r1, [r5], #-2120	; 0xfffff7b8
     4f4:	78050000 	stmdavc	r5, {}	; <UNPREDICTABLE>
     4f8:	00084f02 	andeq	r4, r8, r2, lsl #30
     4fc:	7f184c00 	svcvc	0x00184c00
     500:	05000001 	streq	r0, [r0, #-1]
     504:	0025027b 	eoreq	r0, r5, fp, ror r2
     508:	18500000 	ldmdane	r0, {}^	; <UNPREDICTABLE>
     50c:	000000e5 	andeq	r0, r0, r5, ror #1
     510:	12027c05 	andne	r7, r2, #1280	; 0x500
     514:	54000001 	strpl	r0, [r0], #-1
     518:	0003dc18 	andeq	sp, r3, r8, lsl ip
     51c:	029f0500 	addseq	r0, pc, #0, 10
     520:	00000801 	andeq	r0, r0, r1, lsl #16
     524:	02f51958 	rscseq	r1, r5, #88, 18	; 0x160000
     528:	a3050000 	movwge	r0, #20480	; 0x5000
     52c:	00029f02 	andeq	r9, r2, r2, lsl #30
     530:	19014800 	stmdbne	r1, {fp, lr}
     534:	000001a7 	andeq	r0, r0, r7, lsr #3
     538:	6102a405 	tstvs	r2, r5, lsl #8
     53c:	4c000002 	stcmi	0, cr0, [r0], {2}
     540:	05391901 	ldreq	r1, [r9, #-2305]!	; 0xfffff6ff
     544:	a8050000 	stmdage	r5, {}	; <UNPREDICTABLE>
     548:	00086002 	andeq	r6, r8, r2
     54c:	1902dc00 	stmdbne	r2, {sl, fp, ip, lr, pc}
     550:	000000c7 	andeq	r0, r0, r7, asr #1
     554:	0602ad05 	streq	sl, [r2], -r5, lsl #26
     558:	e0000006 	and	r0, r0, r6
     55c:	00ac1902 	adceq	r1, ip, r2, lsl #18
     560:	af050000 	svcge	0x00050000
     564:	00086c02 	andeq	r6, r8, r2, lsl #24
     568:	0002ec00 	andeq	lr, r2, r0, lsl #24
     56c:	04110405 	ldreq	r0, [r1], #-1029	; 0xfffffbfb
     570:	25150000 	ldrcs	r0, [r5, #-0]
     574:	90000000 	andls	r0, r0, r0
     578:	16000005 	strne	r0, [r0], -r5
     57c:	0000042f 	andeq	r0, r0, pc, lsr #8
     580:	00011016 	andeq	r1, r1, r6, lsl r0
     584:	05901600 	ldreq	r1, [r0, #1536]	; 0x600
     588:	25160000 	ldrcs	r0, [r6, #-0]
     58c:	00000000 	andeq	r0, r0, r0
     590:	011f0405 	tsteq	pc, r5, lsl #8
     594:	04050000 	streq	r0, [r5], #-0
     598:	00000572 	andeq	r0, r0, r2, ror r5
     59c:	00009315 	andeq	r9, r0, r5, lsl r3
     5a0:	0005ba00 	andeq	fp, r5, r0, lsl #20
     5a4:	042f1600 	strteq	r1, [pc], #-1536	; 5ac <CPSR_IRQ_INHIBIT+0x52c>
     5a8:	10160000 	andsne	r0, r6, r0
     5ac:	16000001 	strne	r0, [r0], -r1
     5b0:	00000093 	muleq	r0, r3, r0
     5b4:	00002516 	andeq	r2, r0, r6, lsl r5
     5b8:	04050000 	streq	r0, [r5], #-0
     5bc:	0000059c 	muleq	r0, ip, r5
     5c0:	00002515 	andeq	r2, r0, r5, lsl r5
     5c4:	0005d400 	andeq	sp, r5, r0, lsl #8
     5c8:	042f1600 	strteq	r1, [pc], #-1536	; 5d0 <CPSR_IRQ_INHIBIT+0x550>
     5cc:	10160000 	andsne	r0, r6, r0
     5d0:	00000001 	andeq	r0, r0, r1
     5d4:	05c00405 	strbeq	r0, [r0, #1029]	; 0x405
     5d8:	480a0000 	stmdami	sl, {}	; <UNPREDICTABLE>
     5dc:	ea000000 	b	5e4 <CPSR_IRQ_INHIBIT+0x564>
     5e0:	0b000005 	bleq	5fc <CPSR_IRQ_INHIBIT+0x57c>
     5e4:	0000002c 	andeq	r0, r0, ip, lsr #32
     5e8:	480a0002 	stmdami	sl, {r1}
     5ec:	fa000000 	blx	5f4 <CPSR_IRQ_INHIBIT+0x574>
     5f0:	0b000005 	bleq	60c <CPSR_IRQ_INHIBIT+0x58c>
     5f4:	0000002c 	andeq	r0, r0, ip, lsr #32
     5f8:	0f070000 	svceq	0x00070000
     5fc:	05000004 	streq	r0, [r0, #-4]
     600:	02e7011f 	rsceq	r0, r7, #-1073741817	; 0xc0000007
     604:	201a0000 	andscs	r0, sl, r0
     608:	0c000005 	stceq	0, cr0, [r0], {5}
     60c:	3b012305 	blcc	49228 <__bss_end__+0x2f8c8>
     610:	18000006 	stmdane	r0, {r1, r2}
     614:	00000437 	andeq	r0, r0, r7, lsr r4
     618:	3b012505 	blcc	49a34 <__bss_end__+0x300d4>
     61c:	00000006 	andeq	r0, r0, r6
     620:	00018d18 	andeq	r8, r1, r8, lsl sp
     624:	01260500 			; <UNDEFINED> instruction: 0x01260500
     628:	00000025 	andeq	r0, r0, r5, lsr #32
     62c:	043d1804 	ldrteq	r1, [sp], #-2052	; 0xfffff7fc
     630:	27050000 	strcs	r0, [r5, -r0]
     634:	00064101 	andeq	r4, r6, r1, lsl #2
     638:	05000800 	streq	r0, [r0, #-2048]	; 0xfffff800
     63c:	00060604 	andeq	r0, r6, r4, lsl #12
     640:	fa040500 	blx	101a48 <_stack+0x81a48>
     644:	1a000005 	bne	660 <CPSR_IRQ_INHIBIT+0x5e0>
     648:	0000000c 	andeq	r0, r0, ip
     64c:	013f050e 	teqeq	pc, lr, lsl #10
     650:	0000067c 	andeq	r0, r0, ip, ror r6
     654:	00048718 	andeq	r8, r4, r8, lsl r7
     658:	01400500 	cmpeq	r0, r0, lsl #10
     65c:	0000067c 	andeq	r0, r0, ip, ror r6
     660:	04bb1800 	ldrteq	r1, [fp], #2048	; 0x800
     664:	41050000 	mrsmi	r0, (UNDEF: 5)
     668:	00067c01 	andeq	r7, r6, r1, lsl #24
     66c:	d7180600 	ldrle	r0, [r8, -r0, lsl #12]
     670:	05000004 	streq	r0, [r0, #-4]
     674:	00560142 	subseq	r0, r6, r2, asr #2
     678:	000c0000 	andeq	r0, ip, r0
     67c:	0000560a 	andeq	r5, r0, sl, lsl #12
     680:	00068c00 	andeq	r8, r6, r0, lsl #24
     684:	002c0b00 	eoreq	r0, ip, r0, lsl #22
     688:	00020000 	andeq	r0, r2, r0
     68c:	8005d01b 	andhi	sp, r5, fp, lsl r0
     690:	00078d02 	andeq	r8, r7, r2, lsl #26
     694:	05041800 	streq	r1, [r4, #-2048]	; 0xfffff800
     698:	82050000 	andhi	r0, r5, #0
     69c:	00002c02 	andeq	r2, r0, r2, lsl #24
     6a0:	c1180000 	tstgt	r8, r0
     6a4:	05000004 	streq	r0, [r0, #-4]
     6a8:	01120283 	tsteq	r2, r3, lsl #5
     6ac:	18040000 	stmdane	r4, {}	; <UNPREDICTABLE>
     6b0:	000001c2 	andeq	r0, r0, r2, asr #3
     6b4:	8d028405 	cfstrshi	mvf8, [r2, #-20]	; 0xffffffec
     6b8:	08000007 	stmdaeq	r0, {r0, r1, r2}
     6bc:	00055c18 	andeq	r5, r5, r8, lsl ip
     6c0:	02850500 	addeq	r0, r5, #0, 10
     6c4:	00000198 	muleq	r0, r8, r1
     6c8:	014c1824 	cmpeq	ip, r4, lsr #16
     6cc:	86050000 	strhi	r0, [r5], -r0
     6d0:	00002502 	andeq	r2, r0, r2, lsl #10
     6d4:	32184800 	andscc	r4, r8, #0, 16
     6d8:	05000004 	streq	r0, [r0, #-4]
     6dc:	006b0287 	rsbeq	r0, fp, r7, lsl #5
     6e0:	18500000 	ldmdane	r0, {}^	; <UNPREDICTABLE>
     6e4:	00000572 	andeq	r0, r0, r2, ror r5
     6e8:	47028805 	strmi	r8, [r2, -r5, lsl #16]
     6ec:	58000006 	stmdapl	r0, {r1, r2}
     6f0:	00037318 	andeq	r7, r3, r8, lsl r3
     6f4:	02890500 	addeq	r0, r9, #0, 10
     6f8:	000000fa 	strdeq	r0, [r0], -sl
     6fc:	05771868 	ldrbeq	r1, [r7, #-2152]!	; 0xfffff798
     700:	8a050000 	bhi	140708 <_stack+0xc0708>
     704:	0000fa02 	andeq	pc, r0, r2, lsl #20
     708:	65187000 	ldrvs	r7, [r8, #-0]
     70c:	05000003 	streq	r0, [r0, #-3]
     710:	00fa028b 	rscseq	r0, sl, fp, lsl #5
     714:	18780000 	ldmdane	r8!, {}^	; <UNPREDICTABLE>
     718:	0000052f 	andeq	r0, r0, pc, lsr #10
     71c:	9d028c05 	stcls	12, cr8, [r2, #-20]	; 0xffffffec
     720:	80000007 	andhi	r0, r0, r7
     724:	0001b618 	andeq	fp, r1, r8, lsl r6
     728:	028d0500 	addeq	r0, sp, #0, 10
     72c:	000007ad 	andeq	r0, r0, sp, lsr #15
     730:	04e41888 	strbteq	r1, [r4], #2184	; 0x888
     734:	8e050000 	cdphi	0, 0, cr0, cr5, cr0, {0}
     738:	00002502 	andeq	r2, r0, r2, lsl #10
     73c:	0618a000 	ldreq	sl, [r8], -r0
     740:	05000001 	streq	r0, [r0, #-1]
     744:	00fa028f 	rscseq	r0, sl, pc, lsl #5
     748:	18a40000 	stmiane	r4!, {}	; <UNPREDICTABLE>
     74c:	00000070 	andeq	r0, r0, r0, ror r0
     750:	fa029005 	blx	a476c <_stack+0x2476c>
     754:	ac000000 	stcge	0, cr0, [r0], {-0}
     758:	0000f518 	andeq	pc, r0, r8, lsl r5	; <UNPREDICTABLE>
     75c:	02910500 	addseq	r0, r1, #0, 10
     760:	000000fa 	strdeq	r0, [r0], -sl
     764:	002518b4 	strhteq	r1, [r5], -r4
     768:	92050000 	andls	r0, r5, #0
     76c:	0000fa02 	andeq	pc, r0, r2, lsl #20
     770:	3418bc00 	ldrcc	fp, [r8], #-3072	; 0xfffff400
     774:	05000000 	streq	r0, [r0, #-0]
     778:	00fa0293 	smlalseq	r0, sl, r3, r2
     77c:	18c40000 	stmiane	r4, {}^	; <UNPREDICTABLE>
     780:	000003e1 	andeq	r0, r0, r1, ror #7
     784:	25029405 	strcs	r9, [r2, #-1029]	; 0xfffffbfb
     788:	cc000000 	stcgt	0, cr0, [r0], {-0}
     78c:	01180a00 	tsteq	r8, r0, lsl #20
     790:	079d0000 	ldreq	r0, [sp, r0]
     794:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     798:	19000000 	stmdbne	r0, {}	; <UNPREDICTABLE>
     79c:	01180a00 	tsteq	r8, r0, lsl #20
     7a0:	07ad0000 	streq	r0, [sp, r0]!
     7a4:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     7a8:	07000000 	streq	r0, [r0, -r0]
     7ac:	01180a00 	tsteq	r8, r0, lsl #20
     7b0:	07bd0000 	ldreq	r0, [sp, r0]!
     7b4:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     7b8:	17000000 	strne	r0, [r0, -r0]
     7bc:	05f01b00 	ldrbeq	r1, [r0, #2816]!	; 0xb00
     7c0:	07e10299 			; <UNDEFINED> instruction: 0x07e10299
     7c4:	e5180000 	ldr	r0, [r8, #-0]
     7c8:	05000002 	streq	r0, [r0, #-2]
     7cc:	07e1029c 			; <UNDEFINED> instruction: 0x07e1029c
     7d0:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     7d4:	00000526 	andeq	r0, r0, r6, lsr #10
     7d8:	f1029d05 			; <UNDEFINED> instruction: 0xf1029d05
     7dc:	78000007 	stmdavc	r0, {r0, r1, r2}
     7e0:	02e10a00 	rsceq	r0, r1, #0, 20
     7e4:	07f10000 	ldrbeq	r0, [r1, r0]!
     7e8:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     7ec:	1d000000 	stcne	0, cr0, [r0, #-0]
     7f0:	002c0a00 	eoreq	r0, ip, r0, lsl #20
     7f4:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
     7f8:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     7fc:	1d000000 	stcne	0, cr0, [r0, #-0]
     800:	05f01c00 	ldrbeq	r1, [r0, #3072]!	; 0xc00
     804:	0823027e 	stmdaeq	r3!, {r1, r2, r3, r4, r5, r6, r9}
     808:	801d0000 	andshi	r0, sp, r0
     80c:	05000004 	streq	r0, [r0, #-4]
     810:	068c0295 	pkhbteq	r0, ip, r5, lsl #5
     814:	491d0000 	ldmdbmi	sp, {}	; <UNPREDICTABLE>
     818:	05000005 	streq	r0, [r0, #-5]
     81c:	07bd029e 			; <UNDEFINED> instruction: 0x07bd029e
     820:	0a000000 	beq	828 <CPSR_IRQ_INHIBIT+0x7a8>
     824:	00000118 	andeq	r0, r0, r8, lsl r1
     828:	00000833 	andeq	r0, r0, r3, lsr r8
     82c:	00002c0b 	andeq	r2, r0, fp, lsl #24
     830:	06001800 	streq	r1, [r0], -r0, lsl #16
     834:	00000065 	andeq	r0, r0, r5, rrx
     838:	08330405 	ldmdaeq	r3!, {r0, r2, sl}
     83c:	491e0000 	ldmdbmi	lr, {}	; <UNPREDICTABLE>
     840:	16000008 	strne	r0, [r0], -r8
     844:	0000042f 	andeq	r0, r0, pc, lsr #8
     848:	3e040500 	cfsh32cc	mvfx0, mvfx4, #0
     84c:	05000008 	streq	r0, [r0, #-8]
     850:	00018204 	andeq	r8, r1, r4, lsl #4
     854:	08601e00 	stmdaeq	r0!, {r9, sl, fp, ip}^
     858:	25160000 	ldrcs	r0, [r6, #-0]
     85c:	00000000 	andeq	r0, r0, r0
     860:	08660405 	stmdaeq	r6!, {r0, r2, sl}^
     864:	04050000 	streq	r0, [r5], #-0
     868:	00000855 	andeq	r0, r0, r5, asr r8
     86c:	0005fa0a 	andeq	pc, r5, sl, lsl #20
     870:	00087c00 	andeq	r7, r8, r0, lsl #24
     874:	002c0b00 	eoreq	r0, ip, r0, lsl #22
     878:	00020000 	andeq	r0, r2, r0
     87c:	0004f81f 	andeq	pc, r4, pc, lsl r8	; <UNPREDICTABLE>
     880:	032e0500 			; <UNDEFINED> instruction: 0x032e0500
     884:	0000042f 	andeq	r0, r0, pc, lsr #8
     888:	0004f11f 	andeq	pc, r4, pc, lsl r1	; <UNPREDICTABLE>
     88c:	032f0500 			; <UNDEFINED> instruction: 0x032f0500
     890:	00000435 	andeq	r0, r0, r5, lsr r4
     894:	0002fd20 	andeq	pc, r2, r0, lsr #26
     898:	12630600 	rsbne	r0, r3, #0, 12
     89c:	21000001 	tstcs	r0, r1
     8a0:	00000121 	andeq	r0, r0, r1, lsr #2
     8a4:	80941a01 	addshi	r1, r4, r1, lsl #20
     8a8:	00700000 	rsbseq	r0, r0, r0
     8ac:	9c010000 	stcls	0, cr0, [r1], {-0}
     8b0:	00307222 	eorseq	r7, r0, r2, lsr #4
     8b4:	002c1a01 	eoreq	r1, ip, r1, lsl #20
     8b8:	91020000 	mrsls	r0, (UNDEF: 2)
     8bc:	31722274 	cmncc	r2, r4, ror r2
     8c0:	2c1a0100 	ldfcss	f0, [sl], {-0}
     8c4:	02000000 	andeq	r0, r0, #0
     8c8:	b0237091 	mlalt	r3, r1, r0, r7
     8cc:	01000001 	tsteq	r0, r1
     8d0:	00002c1a 	andeq	r2, r0, sl, lsl ip
     8d4:	6c910200 	lfmvs	f0, 4, [r1], {0}
     8d8:	00a50000 	adceq	r0, r5, r0
     8dc:	00040000 	andeq	r0, r4, r0
     8e0:	000001c5 	andeq	r0, r0, r5, asr #3
     8e4:	02050104 	andeq	r0, r5, #4, 2
     8e8:	940c0000 	strls	r0, [ip], #-0
     8ec:	80000005 	andhi	r0, r0, r5
     8f0:	04000003 	streq	r0, [r0], #-3
     8f4:	6c000081 	stcvs	0, cr0, [r0], {129}	; 0x81
     8f8:	42000000 	andmi	r0, r0, #0
     8fc:	02000002 	andeq	r0, r0, #2
     900:	00000602 	andeq	r0, r0, r2, lsl #12
     904:	00300b01 	eorseq	r0, r0, r1, lsl #22
     908:	04030000 	streq	r0, [r3], #-0
     90c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
     910:	06100200 	ldreq	r0, [r0], -r0, lsl #4
     914:	0c010000 	stceq	0, cr0, [r1], {-0}
     918:	00000030 	andeq	r0, r0, r0, lsr r0
     91c:	0005f004 	andeq	pc, r5, r4
     920:	04100100 	ldreq	r0, [r0], #-256	; 0xffffff00
     924:	6c000081 	stcvs	0, cr0, [r0], {129}	; 0x81
     928:	01000000 	mrseq	r0, (UNDEF: 0)
     92c:	00009b9c 	muleq	r0, ip, fp
     930:	30720500 	rsbscc	r0, r2, r0, lsl #10
     934:	9b100100 	blls	400d3c <_stack+0x380d3c>
     938:	02000000 	andeq	r0, r0, #0
     93c:	72056c91 	andvc	r6, r5, #37120	; 0x9100
     940:	10010031 	andne	r0, r1, r1, lsr r0
     944:	0000009b 	muleq	r0, fp, r0
     948:	05689102 	strbeq	r9, [r8, #-258]!	; 0xfffffefe
     94c:	01003272 	tsteq	r0, r2, ror r2
     950:	00009b10 	andeq	r9, r0, r0, lsl fp
     954:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     958:	73736206 	cmnvc	r3, #1610612736	; 0x60000000
     95c:	a2120100 	andsge	r0, r2, #0, 2
     960:	02000000 	andeq	r0, r0, #0
     964:	fa077491 	blx	1ddbb0 <_stack+0x15dbb0>
     968:	01000005 	tsteq	r0, r5
     96c:	0000a213 	andeq	sl, r0, r3, lsl r2
     970:	70910200 	addsvc	r0, r1, r0, lsl #4
     974:	07040800 	streq	r0, [r4, -r0, lsl #16]
     978:	0000004f 	andeq	r0, r0, pc, asr #32
     97c:	00300409 	eorseq	r0, r0, r9, lsl #8
     980:	23000000 	movwcs	r0, #0
     984:	0400000f 	streq	r0, [r0], #-15
     988:	00025000 	andeq	r5, r2, r0
     98c:	05010400 	streq	r0, [r1, #-1024]	; 0xfffffc00
     990:	0c000002 	stceq	0, cr0, [r0], {2}
     994:	0000072c 	andeq	r0, r0, ip, lsr #14
     998:	00000380 	andeq	r0, r0, r0, lsl #7
     99c:	00008170 	andeq	r8, r0, r0, ror r1
     9a0:	000003f4 	strdeq	r0, [r0], -r4
     9a4:	000002da 	ldrdeq	r0, [r0], -sl
     9a8:	69050402 	stmdbvs	r5, {r1, sl}
     9ac:	0300746e 	movweq	r7, #1134	; 0x46e
     9b0:	004f0704 	subeq	r0, pc, r4, lsl #14
     9b4:	08030000 	stmdaeq	r3, {}	; <UNPREDICTABLE>
     9b8:	00008805 	andeq	r8, r0, r5, lsl #16
     9bc:	04080300 	streq	r0, [r8], #-768	; 0xfffffd00
     9c0:	000002d9 	ldrdeq	r0, [r0], -r9
     9c4:	d0060103 	andle	r0, r6, r3, lsl #2
     9c8:	03000003 	movweq	r0, #3
     9cc:	03ce0801 	biceq	r0, lr, #65536	; 0x10000
     9d0:	02030000 	andeq	r0, r3, #0
     9d4:	0003ea05 	andeq	lr, r3, r5, lsl #20
     9d8:	07020300 	streq	r0, [r2, -r0, lsl #6]
     9dc:	00000194 	muleq	r0, r4, r1
     9e0:	8d050403 	cfstrshi	mvf0, [r5, #-12]
     9e4:	04000000 	streq	r0, [r0], #-0
     9e8:	000006cf 	andeq	r0, r0, pc, asr #13
     9ec:	006f4f02 	rsbeq	r4, pc, r2, lsl #30
     9f0:	04030000 	streq	r0, [r3], #-0
     9f4:	00004a07 	andeq	r4, r0, r7, lsl #20
     9f8:	07080300 	streq	r0, [r8, -r0, lsl #6]
     9fc:	00000045 	andeq	r0, r0, r5, asr #32
     a00:	00065f04 	andeq	r5, r6, r4, lsl #30
     a04:	33c80200 	biccc	r0, r8, #0, 4
     a08:	04000000 	streq	r0, [r0], #-0
     a0c:	000001dd 	ldrdeq	r0, [r0], -sp
     a10:	00932203 	addseq	r2, r3, r3, lsl #4
     a14:	04050000 	streq	r0, [r5], #-0
     a18:	00000099 	muleq	r0, r9, r0
     a1c:	00049506 	andeq	r9, r4, r6, lsl #10
     a20:	06990400 	ldreq	r0, [r9], r0, lsl #8
     a24:	1c040000 	stcne	0, cr0, [r4], {-0}
     a28:	0000005d 	andeq	r0, r0, sp, asr r0
     a2c:	00079004 	andeq	r9, r7, r4
     a30:	5d200400 	cfstrspl	mvf0, [r0, #-0]
     a34:	04000000 	streq	r0, [r0], #-0
     a38:	0000061d 	andeq	r0, r0, sp, lsl r6
     a3c:	005d2c04 	subseq	r2, sp, r4, lsl #24
     a40:	e2040000 	and	r0, r4, #0
     a44:	04000006 	streq	r0, [r0], #-6
     a48:	00004f36 	andeq	r4, r0, r6, lsr pc
     a4c:	08040400 	stmdaeq	r4, {sl}
     a50:	3a040000 	bcc	100a58 <_stack+0x80a58>
     a54:	00000056 	andeq	r0, r0, r6, asr r0
     a58:	00062404 	andeq	r2, r6, r4, lsl #8
     a5c:	563d0400 	ldrtpl	r0, [sp], -r0, lsl #8
     a60:	04000000 	streq	r0, [r0], #-0
     a64:	000007dc 	ldrdeq	r0, [r0], -ip
     a68:	00564904 	subseq	r4, r6, r4, lsl #18
     a6c:	90040000 	andls	r0, r4, r0
     a70:	04000006 	streq	r0, [r0], #-6
     a74:	00006458 	andeq	r6, r0, r8, asr r4
     a78:	061c0400 	ldreq	r0, [ip], -r0, lsl #8
     a7c:	64040000 	strvs	r0, [r4], #-0
     a80:	000000b4 	strheq	r0, [r0], -r4
     a84:	0004aa04 	andeq	sl, r4, r4, lsl #20
     a88:	5d720400 	cfldrdpl	mvd0, [r2, #-0]
     a8c:	07000000 	streq	r0, [r0, -r0]
     a90:	000001e5 	andeq	r0, r0, r5, ror #3
     a94:	2c016505 	cfstr32cs	mvfx6, [r1], {5}
     a98:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     a9c:	37a60404 	strcc	r0, [r6, r4, lsl #8]!
     aa0:	09000001 	stmdbeq	r0, {r0}
     aa4:	000001d7 	ldrdeq	r0, [r0], -r7
     aa8:	010ca804 	tsteq	ip, r4, lsl #16
     aac:	70090000 	andvc	r0, r9, r0
     ab0:	04000001 	streq	r0, [r0], #-1
     ab4:	000137a9 	andeq	r3, r1, r9, lsr #15
     ab8:	480a0000 	stmdami	sl, {}	; <UNPREDICTABLE>
     abc:	47000000 	strmi	r0, [r0, -r0]
     ac0:	0b000001 	bleq	acc <CPSR_IRQ_INHIBIT+0xa4c>
     ac4:	0000002c 	andeq	r0, r0, ip, lsr #32
     ac8:	080c0003 	stmdaeq	ip, {r0, r1}
     acc:	0168a304 	cmneq	r8, r4, lsl #6
     ad0:	8d0d0000 	stchi	0, cr0, [sp, #-0]
     ad4:	04000004 	streq	r0, [r0], #-4
     ad8:	000025a5 	andeq	r2, r0, r5, lsr #11
     adc:	9c0d0000 	stcls	0, cr0, [sp], {-0}
     ae0:	04000004 	streq	r0, [r0], #-4
     ae4:	000118aa 	andeq	r1, r1, sl, lsr #17
     ae8:	04000400 	streq	r0, [r0], #-1024	; 0xfffffc00
     aec:	00000416 	andeq	r0, r0, r6, lsl r4
     af0:	0147ab04 	cmpeq	r7, r4, lsl #22
     af4:	33040000 	movwcc	r0, #16384	; 0x4000
     af8:	04000001 	streq	r0, [r0], #-1
     afc:	000088af 	andeq	r8, r0, pc, lsr #17
     b00:	04040e00 	streq	r0, [r4], #-3584	; 0xfffff200
     b04:	0000084f 	andeq	r0, r0, pc, asr #16
     b08:	0056d504 	subseq	sp, r6, r4, lsl #10
     b0c:	04050000 	streq	r0, [r5], #-0
     b10:	00000191 	muleq	r0, r1, r1
     b14:	d7080103 	strle	r0, [r8, -r3, lsl #2]
     b18:	0f000003 	svceq	0x00000003
     b1c:	00000191 	muleq	r0, r1, r1
     b20:	0004dc04 	andeq	sp, r4, r4, lsl #24
     b24:	6f160600 	svcvs	0x00160600
     b28:	10000000 	andne	r0, r0, r0
     b2c:	00000144 	andeq	r0, r0, r4, asr #2
     b30:	fb2f0618 	blx	bc239a <_stack+0xb4239a>
     b34:	0d000001 	stceq	0, cr0, [r0, #-4]
     b38:	00000437 	andeq	r0, r0, r7, lsr r4
     b3c:	01fb3106 	mvnseq	r3, r6, lsl #2
     b40:	11000000 	mrsne	r0, (UNDEF: 0)
     b44:	06006b5f 			; <UNDEFINED> instruction: 0x06006b5f
     b48:	00002532 	andeq	r2, r0, r2, lsr r5
     b4c:	780d0400 	stmdavc	sp, {sl}
     b50:	06000004 	streq	r0, [r0], -r4
     b54:	00002532 	andeq	r2, r0, r2, lsr r5
     b58:	2d0d0800 	stccs	8, cr0, [sp, #-0]
     b5c:	06000001 	streq	r0, [r0], -r1
     b60:	00002532 	andeq	r2, r0, r2, lsr r5
     b64:	110d0c00 	tstne	sp, r0, lsl #24
     b68:	06000005 	streq	r0, [r0], -r5
     b6c:	00002532 	andeq	r2, r0, r2, lsr r5
     b70:	5f111000 	svcpl	0x00111000
     b74:	33060078 	movwcc	r0, #24696	; 0x6078
     b78:	00000201 	andeq	r0, r0, r1, lsl #4
     b7c:	04050014 	streq	r0, [r5], #-20	; 0xffffffec
     b80:	000001a8 	andeq	r0, r0, r8, lsr #3
     b84:	00019d0a 	andeq	r9, r1, sl, lsl #26
     b88:	00021100 	andeq	r1, r2, r0, lsl #2
     b8c:	002c0b00 	eoreq	r0, ip, r0, lsl #22
     b90:	00000000 	andeq	r0, r0, r0
     b94:	00016b10 	andeq	r6, r1, r0, lsl fp
     b98:	37062400 	strcc	r2, [r6, -r0, lsl #8]
     b9c:	0000028a 	andeq	r0, r0, sl, lsl #5
     ba0:	00007f0d 	andeq	r7, r0, sp, lsl #30
     ba4:	25390600 	ldrcs	r0, [r9, #-1536]!	; 0xfffffa00
     ba8:	00000000 	andeq	r0, r0, r0
     bac:	0004b20d 	andeq	fp, r4, sp, lsl #4
     bb0:	253a0600 	ldrcs	r0, [sl, #-1536]!	; 0xfffffa00
     bb4:	04000000 	streq	r0, [r0], #-0
     bb8:	0000a20d 	andeq	sl, r0, sp, lsl #4
     bbc:	253b0600 	ldrcs	r0, [fp, #-1536]!	; 0xfffffa00
     bc0:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     bc4:	00058a0d 	andeq	r8, r5, sp, lsl #20
     bc8:	253c0600 	ldrcs	r0, [ip, #-1536]!	; 0xfffffa00
     bcc:	0c000000 	stceq	0, cr0, [r0], {-0}
     bd0:	0002ec0d 	andeq	lr, r2, sp, lsl #24
     bd4:	253d0600 	ldrcs	r0, [sp, #-1536]!	; 0xfffffa00
     bd8:	10000000 	andne	r0, r0, r0
     bdc:	0001fb0d 	andeq	pc, r1, sp, lsl #22
     be0:	253e0600 	ldrcs	r0, [lr, #-1536]!	; 0xfffffa00
     be4:	14000000 	strne	r0, [r0], #-0
     be8:	0005160d 	andeq	r1, r5, sp, lsl #12
     bec:	253f0600 	ldrcs	r0, [pc, #-1536]!	; 5f4 <CPSR_IRQ_INHIBIT+0x574>
     bf0:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     bf4:	0003f40d 	andeq	pc, r3, sp, lsl #8
     bf8:	25400600 	strbcs	r0, [r0, #-1536]	; 0xfffffa00
     bfc:	1c000000 	stcne	0, cr0, [r0], {-0}
     c00:	0005510d 	andeq	r5, r5, sp, lsl #2
     c04:	25410600 	strbcs	r0, [r1, #-1536]	; 0xfffffa00
     c08:	20000000 	andcs	r0, r0, r0
     c0c:	00b11200 	adcseq	r1, r1, r0, lsl #4
     c10:	01080000 	mrseq	r0, (UNDEF: 8)
     c14:	02ca4a06 	sbceq	r4, sl, #24576	; 0x6000
     c18:	140d0000 	strne	r0, [sp], #-0
     c1c:	06000001 	streq	r0, [r0], -r1
     c20:	0002ca4b 	andeq	ip, r2, fp, asr #20
     c24:	000d0000 	andeq	r0, sp, r0
     c28:	06000000 	streq	r0, [r0], -r0
     c2c:	0002ca4c 	andeq	ip, r2, ip, asr #20
     c30:	ce138000 	cdpgt	0, 1, cr8, cr3, cr0, {0}
     c34:	06000004 	streq	r0, [r0], -r4
     c38:	00019d4e 	andeq	r9, r1, lr, asr #26
     c3c:	13010000 	movwne	r0, #4096	; 0x1000
     c40:	000000d6 	ldrdeq	r0, [r0], -r6
     c44:	019d5106 	orrseq	r5, sp, r6, lsl #2
     c48:	01040000 	mrseq	r0, (UNDEF: 4)
     c4c:	017e0a00 	cmneq	lr, r0, lsl #20
     c50:	02da0000 	sbcseq	r0, sl, #0
     c54:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     c58:	1f000000 	svcne	0x00000000
     c5c:	02f51200 	rscseq	r1, r5, #0, 4
     c60:	01900000 	orrseq	r0, r0, r0
     c64:	03185d06 	tsteq	r8, #384	; 0x180
     c68:	370d0000 	strcc	r0, [sp, -r0]
     c6c:	06000004 	streq	r0, [r0], -r4
     c70:	0003185e 	andeq	r1, r3, lr, asr r8
     c74:	480d0000 	stmdami	sp, {}	; <UNPREDICTABLE>
     c78:	06000004 	streq	r0, [r0], -r4
     c7c:	0000255f 	andeq	r2, r0, pc, asr r5
     c80:	1c0d0400 	cfstrsne	mvf0, [sp], {-0}
     c84:	06000001 	streq	r0, [r0], -r1
     c88:	00031e61 	andeq	r1, r3, r1, ror #28
     c8c:	b10d0800 	tstlt	sp, r0, lsl #16
     c90:	06000000 	streq	r0, [r0], -r0
     c94:	00028a62 	andeq	r8, r2, r2, ror #20
     c98:	05008800 	streq	r8, [r0, #-2048]	; 0xfffff800
     c9c:	0002da04 	andeq	sp, r2, r4, lsl #20
     ca0:	032e0a00 			; <UNDEFINED> instruction: 0x032e0a00
     ca4:	032e0000 			; <UNDEFINED> instruction: 0x032e0000
     ca8:	2c0b0000 	stccs	0, cr0, [fp], {-0}
     cac:	1f000000 	svcne	0x00000000
     cb0:	34040500 	strcc	r0, [r4], #-1280	; 0xfffffb00
     cb4:	14000003 	strne	r0, [r0], #-3
     cb8:	0003fe10 	andeq	pc, r3, r0, lsl lr	; <UNPREDICTABLE>
     cbc:	75060800 	strvc	r0, [r6, #-2048]	; 0xfffff800
     cc0:	0000035a 	andeq	r0, r0, sl, asr r3
     cc4:	00009c0d 	andeq	r9, r0, sp, lsl #24
     cc8:	5a760600 	bpl	1d824d0 <_stack+0x1d024d0>
     ccc:	00000003 	andeq	r0, r0, r3
     cd0:	00071f0d 	andeq	r1, r7, sp, lsl #30
     cd4:	25770600 	ldrbcs	r0, [r7, #-1536]!	; 0xfffffa00
     cd8:	04000000 	streq	r0, [r0], #-0
     cdc:	48040500 	stmdami	r4, {r8, sl}
     ce0:	10000000 	andne	r0, r0, r0
     ce4:	00000421 	andeq	r0, r0, r1, lsr #8
     ce8:	8ab50668 	bhi	fed42690 <_stack+0xfecc2690>
     cec:	11000004 	tstne	r0, r4
     cf0:	0600705f 			; <UNDEFINED> instruction: 0x0600705f
     cf4:	00035ab6 			; <UNDEFINED> instruction: 0x00035ab6
     cf8:	5f110000 	svcpl	0x00110000
     cfc:	b7060072 	smlsdxlt	r6, r2, r0, r0
     d00:	00000025 	andeq	r0, r0, r5, lsr #32
     d04:	775f1104 	ldrbvc	r1, [pc, -r4, lsl #2]
     d08:	25b80600 	ldrcs	r0, [r8, #1536]!	; 0x600
     d0c:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
     d10:	0000cf0d 	andeq	ip, r0, sp, lsl #30
     d14:	4fb90600 	svcmi	0x00b90600
     d18:	0c000000 	stceq	0, cr0, [r0], {-0}
     d1c:	0001870d 	andeq	r8, r1, sp, lsl #14
     d20:	4fba0600 	svcmi	0x00ba0600
     d24:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
     d28:	66625f11 	uqadd16vs	r5, r2, r1
     d2c:	35bb0600 	ldrcc	r0, [fp, #1536]!	; 0x600
     d30:	10000003 	andne	r0, r0, r3
     d34:	00005c0d 	andeq	r5, r0, sp, lsl #24
     d38:	25bc0600 	ldrcs	r0, [ip, #1536]!	; 0x600
     d3c:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     d40:	0000bf0d 	andeq	fp, r0, sp, lsl #30
     d44:	7ec30600 	cdpvc	6, 12, cr0, cr3, cr0, {0}
     d48:	1c000001 	stcne	0, cr0, [r0], {1}
     d4c:	00015b0d 	andeq	r5, r1, sp, lsl #22
     d50:	e5c50600 	strb	r0, [r5, #1536]	; 0x600
     d54:	20000005 	andcs	r0, r0, r5
     d58:	0001f40d 	andeq	pc, r1, sp, lsl #8
     d5c:	14c70600 	strbne	r0, [r7], #1536	; 0x600
     d60:	24000006 	strcs	r0, [r0], #-6
     d64:	0004a40d 	andeq	sl, r4, sp, lsl #8
     d68:	38ca0600 	stmiacc	sl, {r9, sl}^
     d6c:	28000006 	stmdacs	r0, {r1, r2}
     d70:	00056b0d 	andeq	r6, r5, sp, lsl #22
     d74:	52cb0600 	sbcpl	r0, fp, #0, 12
     d78:	2c000006 	stccs	0, cr0, [r0], {6}
     d7c:	62755f11 	rsbsvs	r5, r5, #17, 30	; 0x44
     d80:	35ce0600 	strbcc	r0, [lr, #1536]	; 0x600
     d84:	30000003 	andcc	r0, r0, r3
     d88:	70755f11 	rsbsvc	r5, r5, r1, lsl pc
     d8c:	5acf0600 	bpl	ff3c2594 <_stack+0xff342594>
     d90:	38000003 	stmdacc	r0, {r0, r1}
     d94:	72755f11 	rsbsvc	r5, r5, #17, 30	; 0x44
     d98:	25d00600 	ldrbcs	r0, [r0, #1536]	; 0x600
     d9c:	3c000000 	stccc	0, cr0, [r0], {-0}
     da0:	0000960d 	andeq	r9, r0, sp, lsl #12
     da4:	58d30600 	ldmpl	r3, {r9, sl}^
     da8:	40000006 	andmi	r0, r0, r6
     dac:	0005430d 	andeq	r4, r5, sp, lsl #6
     db0:	68d40600 	ldmvs	r4, {r9, sl}^
     db4:	43000006 	movwmi	r0, #6
     db8:	626c5f11 	rsbvs	r5, ip, #17, 30	; 0x44
     dbc:	35d70600 	ldrbcc	r0, [r7, #1536]	; 0x600
     dc0:	44000003 	strmi	r0, [r0], #-3
     dc4:	0007c00d 	andeq	ip, r7, sp
     dc8:	25da0600 	ldrbcs	r0, [sl, #1536]	; 0x600
     dcc:	4c000000 	stcmi	0, cr0, [r0], {-0}
     dd0:	0000ed0d 	andeq	lr, r0, sp, lsl #26
     dd4:	b4db0600 	ldrblt	r0, [fp], #1536	; 0x600
     dd8:	50000000 	andpl	r0, r0, r0
     ddc:	00001f0d 	andeq	r1, r0, sp, lsl #30
     de0:	a8de0600 	ldmge	lr, {r9, sl}^
     de4:	54000004 	strpl	r0, [r0], #-4
     de8:	0004960d 	andeq	r9, r4, sp, lsl #12
     dec:	73e20600 	mvnvc	r0, #0, 12
     df0:	58000001 	stmdapl	r0, {r0}
     df4:	0004290d 	andeq	r2, r4, sp, lsl #18
     df8:	68e40600 	stmiavs	r4!, {r9, sl}^
     dfc:	5c000001 	stcpl	0, cr0, [r0], {1}
     e00:	0001ec0d 	andeq	lr, r1, sp, lsl #24
     e04:	25e50600 	strbcs	r0, [r5, #1536]!	; 0x600
     e08:	64000000 	strvs	r0, [r0], #-0
     e0c:	00251500 	eoreq	r1, r5, r0, lsl #10
     e10:	04a80000 	strteq	r0, [r8], #0
     e14:	a8160000 	ldmdage	r6, {}	; <UNPREDICTABLE>
     e18:	16000004 	strne	r0, [r0], -r4
     e1c:	0000017e 	andeq	r0, r0, lr, ror r1
     e20:	00018b16 	andeq	r8, r1, r6, lsl fp
     e24:	00251600 	eoreq	r1, r5, r0, lsl #12
     e28:	05000000 	streq	r0, [r0, #-0]
     e2c:	0004b304 	andeq	fp, r4, r4, lsl #6
     e30:	04a80f00 	strteq	r0, [r8], #3840	; 0xf00
     e34:	80170000 	andshi	r0, r7, r0
     e38:	28000004 	stmdacs	r0, {r2}
     e3c:	02600604 	rsbeq	r0, r0, #4, 12	; 0x400000
     e40:	000005e5 	andeq	r0, r0, r5, ror #11
     e44:	0003e318 	andeq	lr, r3, r8, lsl r3
     e48:	02620600 	rsbeq	r0, r2, #0, 12
     e4c:	00000025 	andeq	r0, r0, r5, lsr #32
     e50:	00de1800 	sbcseq	r1, lr, r0, lsl #16
     e54:	67060000 	strvs	r0, [r6, -r0]
     e58:	0006bf02 	andeq	fp, r6, r2, lsl #30
     e5c:	77180400 	ldrvc	r0, [r8, -r0, lsl #8]
     e60:	06000001 	streq	r0, [r0], -r1
     e64:	06bf0267 	ldrteq	r0, [pc], r7, ror #4
     e68:	18080000 	stmdane	r8, {}	; <UNPREDICTABLE>
     e6c:	0000013c 	andeq	r0, r0, ip, lsr r1
     e70:	bf026706 	svclt	0x00026706
     e74:	0c000006 	stceq	0, cr0, [r0], {6}
     e78:	00044318 	andeq	r4, r4, r8, lsl r3
     e7c:	02690600 	rsbeq	r0, r9, #0, 12
     e80:	00000025 	andeq	r0, r0, r5, lsr #32
     e84:	00141810 	andseq	r1, r4, r0, lsl r8
     e88:	6a060000 	bvs	180e90 <_stack+0x100e90>
     e8c:	0008a102 	andeq	sl, r8, r2, lsl #2
     e90:	5f181400 	svcpl	0x00181400
     e94:	06000004 	streq	r0, [r0], -r4
     e98:	0025026d 	eoreq	r0, r5, sp, ror #4
     e9c:	18300000 	ldmdane	r0!, {}	; <UNPREDICTABLE>
     ea0:	0000044d 	andeq	r0, r0, sp, asr #8
     ea4:	b6026e06 	strlt	r6, [r2], -r6, lsl #28
     ea8:	34000008 	strcc	r0, [r0], #-8
     eac:	00030718 	andeq	r0, r3, r8, lsl r7
     eb0:	02700600 	rsbseq	r0, r0, #0, 12
     eb4:	00000025 	andeq	r0, r0, r5, lsr #32
     eb8:	04551838 	ldrbeq	r1, [r5], #-2104	; 0xfffff7c8
     ebc:	72060000 	andvc	r0, r6, #0
     ec0:	0008c702 	andeq	ip, r8, r2, lsl #14
     ec4:	cf183c00 	svcgt	0x00183c00
     ec8:	06000001 	streq	r0, [r0], -r1
     ecc:	01fb0275 	mvnseq	r0, r5, ror r2
     ed0:	18400000 	stmdane	r0, {}^	; <UNPREDICTABLE>
     ed4:	00000161 	andeq	r0, r0, r1, ror #2
     ed8:	25027606 	strcs	r7, [r2, #-1542]	; 0xfffff9fa
     edc:	44000000 	strmi	r0, [r0], #-0
     ee0:	00058518 	andeq	r8, r5, r8, lsl r5
     ee4:	02770600 	rsbseq	r0, r7, #0, 12
     ee8:	000001fb 	strdeq	r0, [r0], -fp
     eec:	04051848 	streq	r1, [r5], #-2120	; 0xfffff7b8
     ef0:	78060000 	stmdavc	r6, {}	; <UNPREDICTABLE>
     ef4:	0008cd02 	andeq	ip, r8, r2, lsl #26
     ef8:	7f184c00 	svcvc	0x00184c00
     efc:	06000001 	streq	r0, [r0], -r1
     f00:	0025027b 	eoreq	r0, r5, fp, ror r2
     f04:	18500000 	ldmdane	r0, {}^	; <UNPREDICTABLE>
     f08:	000000e5 	andeq	r0, r0, r5, ror #1
     f0c:	8b027c06 	blhi	9ff2c <_stack+0x1ff2c>
     f10:	54000001 	strpl	r0, [r0], #-1
     f14:	0003dc18 	andeq	sp, r3, r8, lsl ip
     f18:	029f0600 	addseq	r0, pc, #0, 12
     f1c:	0000087f 	andeq	r0, r0, pc, ror r8
     f20:	02f51958 	rscseq	r1, r5, #88, 18	; 0x160000
     f24:	a3060000 	movwge	r0, #24576	; 0x6000
     f28:	00031802 	andeq	r1, r3, r2, lsl #16
     f2c:	19014800 	stmdbne	r1, {fp, lr}
     f30:	000001a7 	andeq	r0, r0, r7, lsr #3
     f34:	da02a406 	ble	a9f54 <_stack+0x29f54>
     f38:	4c000002 	stcmi	0, cr0, [r0], {2}
     f3c:	05391901 	ldreq	r1, [r9, #-2305]!	; 0xfffff6ff
     f40:	a8060000 	stmdage	r6, {}	; <UNPREDICTABLE>
     f44:	0008de02 	andeq	sp, r8, r2, lsl #28
     f48:	1902dc00 	stmdbne	r2, {sl, fp, ip, lr, pc}
     f4c:	000000c7 	andeq	r0, r0, r7, asr #1
     f50:	8402ad06 	strhi	sl, [r2], #-3334	; 0xfffff2fa
     f54:	e0000006 	and	r0, r0, r6
     f58:	00ac1902 	adceq	r1, ip, r2, lsl #18
     f5c:	af060000 	svcge	0x00060000
     f60:	0008ea02 	andeq	lr, r8, r2, lsl #20
     f64:	0002ec00 	andeq	lr, r2, r0, lsl #24
     f68:	048a0405 	streq	r0, [sl], #1029	; 0x405
     f6c:	25150000 	ldrcs	r0, [r5, #-0]
     f70:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
     f74:	16000006 	strne	r0, [r0], -r6
     f78:	000004a8 	andeq	r0, r0, r8, lsr #9
     f7c:	00017e16 	andeq	r7, r1, r6, lsl lr
     f80:	06091600 	streq	r1, [r9], -r0, lsl #12
     f84:	25160000 	ldrcs	r0, [r6, #-0]
     f88:	00000000 	andeq	r0, r0, r0
     f8c:	01980405 	orrseq	r0, r8, r5, lsl #8
     f90:	090f0000 	stmdbeq	pc, {}	; <UNPREDICTABLE>
     f94:	05000006 	streq	r0, [r0, #-6]
     f98:	0005eb04 	andeq	lr, r5, r4, lsl #22
     f9c:	01011500 	tsteq	r1, r0, lsl #10
     fa0:	06380000 	ldrteq	r0, [r8], -r0
     fa4:	a8160000 	ldmdage	r6, {}	; <UNPREDICTABLE>
     fa8:	16000004 	strne	r0, [r0], -r4
     fac:	0000017e 	andeq	r0, r0, lr, ror r1
     fb0:	00010116 	andeq	r0, r1, r6, lsl r1
     fb4:	00251600 	eoreq	r1, r5, r0, lsl #12
     fb8:	05000000 	streq	r0, [r0, #-0]
     fbc:	00061a04 	andeq	r1, r6, r4, lsl #20
     fc0:	00251500 	eoreq	r1, r5, r0, lsl #10
     fc4:	06520000 	ldrbeq	r0, [r2], -r0
     fc8:	a8160000 	ldmdage	r6, {}	; <UNPREDICTABLE>
     fcc:	16000004 	strne	r0, [r0], -r4
     fd0:	0000017e 	andeq	r0, r0, lr, ror r1
     fd4:	3e040500 	cfsh32cc	mvfx0, mvfx4, #0
     fd8:	0a000006 	beq	ff8 <CPSR_IRQ_INHIBIT+0xf78>
     fdc:	00000048 	andeq	r0, r0, r8, asr #32
     fe0:	00000668 	andeq	r0, r0, r8, ror #12
     fe4:	00002c0b 	andeq	r2, r0, fp, lsl #24
     fe8:	0a000200 	beq	17f0 <CPSR_IRQ_INHIBIT+0x1770>
     fec:	00000048 	andeq	r0, r0, r8, asr #32
     ff0:	00000678 	andeq	r0, r0, r8, ror r6
     ff4:	00002c0b 	andeq	r2, r0, fp, lsl #24
     ff8:	07000000 	streq	r0, [r0, -r0]
     ffc:	0000040f 	andeq	r0, r0, pc, lsl #8
    1000:	60011f06 	andvs	r1, r1, r6, lsl #30
    1004:	1a000003 	bne	1018 <CPSR_IRQ_INHIBIT+0xf98>
    1008:	00000520 	andeq	r0, r0, r0, lsr #10
    100c:	0123060c 			; <UNDEFINED> instruction: 0x0123060c
    1010:	000006b9 			; <UNDEFINED> instruction: 0x000006b9
    1014:	00043718 	andeq	r3, r4, r8, lsl r7
    1018:	01250600 			; <UNDEFINED> instruction: 0x01250600
    101c:	000006b9 			; <UNDEFINED> instruction: 0x000006b9
    1020:	018d1800 	orreq	r1, sp, r0, lsl #16
    1024:	26060000 	strcs	r0, [r6], -r0
    1028:	00002501 	andeq	r2, r0, r1, lsl #10
    102c:	3d180400 	cfldrscc	mvf0, [r8, #-0]
    1030:	06000004 	streq	r0, [r0], -r4
    1034:	06bf0127 	ldrteq	r0, [pc], r7, lsr #2
    1038:	00080000 	andeq	r0, r8, r0
    103c:	06840405 	streq	r0, [r4], r5, lsl #8
    1040:	04050000 	streq	r0, [r5], #-0
    1044:	00000678 	andeq	r0, r0, r8, ror r6
    1048:	00000c1a 	andeq	r0, r0, sl, lsl ip
    104c:	3f060e00 	svccc	0x00060e00
    1050:	0006fa01 	andeq	pc, r6, r1, lsl #20
    1054:	04871800 	streq	r1, [r7], #2048	; 0x800
    1058:	40060000 	andmi	r0, r6, r0
    105c:	0006fa01 	andeq	pc, r6, r1, lsl #20
    1060:	bb180000 	bllt	601068 <_stack+0x581068>
    1064:	06000004 	streq	r0, [r0], -r4
    1068:	06fa0141 	ldrbteq	r0, [sl], r1, asr #2
    106c:	18060000 	stmdane	r6, {}	; <UNPREDICTABLE>
    1070:	000004d7 	ldrdeq	r0, [r0], -r7
    1074:	56014206 	strpl	r4, [r1], -r6, lsl #4
    1078:	0c000000 	stceq	0, cr0, [r0], {-0}
    107c:	00560a00 	subseq	r0, r6, r0, lsl #20
    1080:	070a0000 	streq	r0, [sl, -r0]
    1084:	2c0b0000 	stccs	0, cr0, [fp], {-0}
    1088:	02000000 	andeq	r0, r0, #0
    108c:	06d01b00 	ldrbeq	r1, [r0], r0, lsl #22
    1090:	080b0280 	stmdaeq	fp, {r7, r9}
    1094:	04180000 	ldreq	r0, [r8], #-0
    1098:	06000005 	streq	r0, [r0], -r5
    109c:	002c0282 	eoreq	r0, ip, r2, lsl #5
    10a0:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    10a4:	000004c1 	andeq	r0, r0, r1, asr #9
    10a8:	8b028306 	blhi	a1cc8 <_stack+0x21cc8>
    10ac:	04000001 	streq	r0, [r0], #-1
    10b0:	0001c218 	andeq	ip, r1, r8, lsl r2
    10b4:	02840600 	addeq	r0, r4, #0, 12
    10b8:	0000080b 	andeq	r0, r0, fp, lsl #16
    10bc:	055c1808 	ldrbeq	r1, [ip, #-2056]	; 0xfffff7f8
    10c0:	85060000 	strhi	r0, [r6, #-0]
    10c4:	00021102 	andeq	r1, r2, r2, lsl #2
    10c8:	4c182400 	cfldrsmi	mvf2, [r8], {-0}
    10cc:	06000001 	streq	r0, [r0], -r1
    10d0:	00250286 	eoreq	r0, r5, r6, lsl #5
    10d4:	18480000 	stmdane	r8, {}^	; <UNPREDICTABLE>
    10d8:	00000432 	andeq	r0, r0, r2, lsr r4
    10dc:	76028706 	strvc	r8, [r2], -r6, lsl #14
    10e0:	50000000 	andpl	r0, r0, r0
    10e4:	00057218 	andeq	r7, r5, r8, lsl r2
    10e8:	02880600 	addeq	r0, r8, #0, 12
    10ec:	000006c5 	andeq	r0, r0, r5, asr #13
    10f0:	03731858 	cmneq	r3, #88, 16	; 0x580000
    10f4:	89060000 	stmdbhi	r6, {}	; <UNPREDICTABLE>
    10f8:	00016802 	andeq	r6, r1, r2, lsl #16
    10fc:	77186800 	ldrvc	r6, [r8, -r0, lsl #16]
    1100:	06000005 	streq	r0, [r0], -r5
    1104:	0168028a 	smulbbeq	r8, sl, r2
    1108:	18700000 	ldmdane	r0!, {}^	; <UNPREDICTABLE>
    110c:	00000365 	andeq	r0, r0, r5, ror #6
    1110:	68028b06 	stmdavs	r2, {r1, r2, r8, r9, fp, pc}
    1114:	78000001 	stmdavc	r0, {r0}
    1118:	00052f18 	andeq	r2, r5, r8, lsl pc
    111c:	028c0600 	addeq	r0, ip, #0, 12
    1120:	0000081b 	andeq	r0, r0, fp, lsl r8
    1124:	01b61880 			; <UNDEFINED> instruction: 0x01b61880
    1128:	8d060000 	stchi	0, cr0, [r6, #-0]
    112c:	00082b02 	andeq	r2, r8, r2, lsl #22
    1130:	e4188800 	ldr	r8, [r8], #-2048	; 0xfffff800
    1134:	06000004 	streq	r0, [r0], -r4
    1138:	0025028e 	eoreq	r0, r5, lr, lsl #5
    113c:	18a00000 	stmiane	r0!, {}	; <UNPREDICTABLE>
    1140:	00000106 	andeq	r0, r0, r6, lsl #2
    1144:	68028f06 	stmdavs	r2, {r1, r2, r8, r9, sl, fp, pc}
    1148:	a4000001 	strge	r0, [r0], #-1
    114c:	00007018 	andeq	r7, r0, r8, lsl r0
    1150:	02900600 	addseq	r0, r0, #0, 12
    1154:	00000168 	andeq	r0, r0, r8, ror #2
    1158:	00f518ac 	rscseq	r1, r5, ip, lsr #17
    115c:	91060000 	mrsls	r0, (UNDEF: 6)
    1160:	00016802 	andeq	r6, r1, r2, lsl #16
    1164:	2518b400 	ldrcs	fp, [r8, #-1024]	; 0xfffffc00
    1168:	06000000 	streq	r0, [r0], -r0
    116c:	01680292 			; <UNDEFINED> instruction: 0x01680292
    1170:	18bc0000 	ldmne	ip!, {}	; <UNPREDICTABLE>
    1174:	00000034 	andeq	r0, r0, r4, lsr r0
    1178:	68029306 	stmdavs	r2, {r1, r2, r8, r9, ip, pc}
    117c:	c4000001 	strgt	r0, [r0], #-1
    1180:	0003e118 	andeq	lr, r3, r8, lsl r1
    1184:	02940600 	addseq	r0, r4, #0, 12
    1188:	00000025 	andeq	r0, r0, r5, lsr #32
    118c:	910a00cc 	smlabtls	sl, ip, r0, r0
    1190:	1b000001 	blne	119c <CPSR_IRQ_INHIBIT+0x111c>
    1194:	0b000008 	bleq	11bc <CPSR_IRQ_INHIBIT+0x113c>
    1198:	0000002c 	andeq	r0, r0, ip, lsr #32
    119c:	910a0019 	tstls	sl, r9, lsl r0
    11a0:	2b000001 	blcs	11ac <CPSR_IRQ_INHIBIT+0x112c>
    11a4:	0b000008 	bleq	11cc <CPSR_IRQ_INHIBIT+0x114c>
    11a8:	0000002c 	andeq	r0, r0, ip, lsr #32
    11ac:	910a0007 	tstls	sl, r7
    11b0:	3b000001 	blcc	11bc <CPSR_IRQ_INHIBIT+0x113c>
    11b4:	0b000008 	bleq	11dc <CPSR_IRQ_INHIBIT+0x115c>
    11b8:	0000002c 	andeq	r0, r0, ip, lsr #32
    11bc:	f01b0017 			; <UNDEFINED> instruction: 0xf01b0017
    11c0:	5f029906 	svcpl	0x00029906
    11c4:	18000008 	stmdane	r0, {r3}
    11c8:	000002e5 	andeq	r0, r0, r5, ror #5
    11cc:	5f029c06 	svcpl	0x00029c06
    11d0:	00000008 	andeq	r0, r0, r8
    11d4:	00052618 	andeq	r2, r5, r8, lsl r6
    11d8:	029d0600 	addseq	r0, sp, #0, 12
    11dc:	0000086f 	andeq	r0, r0, pc, ror #16
    11e0:	5a0a0078 	bpl	2813c8 <_stack+0x2013c8>
    11e4:	6f000003 	svcvs	0x00000003
    11e8:	0b000008 	bleq	1210 <CPSR_IRQ_INHIBIT+0x1190>
    11ec:	0000002c 	andeq	r0, r0, ip, lsr #32
    11f0:	2c0a001d 	stccs	0, cr0, [sl], {29}
    11f4:	7f000000 	svcvc	0x00000000
    11f8:	0b000008 	bleq	1220 <CPSR_IRQ_INHIBIT+0x11a0>
    11fc:	0000002c 	andeq	r0, r0, ip, lsr #32
    1200:	f01c001d 			; <UNDEFINED> instruction: 0xf01c001d
    1204:	a1027e06 	tstge	r2, r6, lsl #28
    1208:	1d000008 	stcne	0, cr0, [r0, #-32]	; 0xffffffe0
    120c:	00000480 	andeq	r0, r0, r0, lsl #9
    1210:	0a029506 	beq	a6630 <_stack+0x26630>
    1214:	1d000007 	stcne	0, cr0, [r0, #-28]	; 0xffffffe4
    1218:	00000549 	andeq	r0, r0, r9, asr #10
    121c:	3b029e06 	blcc	a8a3c <_stack+0x28a3c>
    1220:	00000008 	andeq	r0, r0, r8
    1224:	0001910a 	andeq	r9, r1, sl, lsl #2
    1228:	0008b100 	andeq	fp, r8, r0, lsl #2
    122c:	002c0b00 	eoreq	r0, ip, r0, lsl #22
    1230:	00180000 	andseq	r0, r8, r0
    1234:	00006506 	andeq	r6, r0, r6, lsl #10
    1238:	b1040500 	tstlt	r4, r0, lsl #10
    123c:	1e000008 	cdpne	0, 0, cr0, cr0, cr8, {0}
    1240:	000008c7 	andeq	r0, r0, r7, asr #17
    1244:	0004a816 	andeq	sl, r4, r6, lsl r8
    1248:	04050000 	streq	r0, [r5], #-0
    124c:	000008bc 			; <UNDEFINED> instruction: 0x000008bc
    1250:	01fb0405 	mvnseq	r0, r5, lsl #8
    1254:	de1e0000 	cdple	0, 1, cr0, cr14, cr0, {0}
    1258:	16000008 	strne	r0, [r0], -r8
    125c:	00000025 	andeq	r0, r0, r5, lsr #32
    1260:	e4040500 	str	r0, [r4], #-1280	; 0xfffffb00
    1264:	05000008 	streq	r0, [r0, #-8]
    1268:	0008d304 	andeq	sp, r8, r4, lsl #6
    126c:	06780a00 	ldrbteq	r0, [r8], -r0, lsl #20
    1270:	08fa0000 	ldmeq	sl!, {}^	; <UNPREDICTABLE>
    1274:	2c0b0000 	stccs	0, cr0, [fp], {-0}
    1278:	02000000 	andeq	r0, r0, #0
    127c:	04f81f00 	ldrbteq	r1, [r8], #3840	; 0xf00
    1280:	2e060000 	cdpcs	0, 0, cr0, cr6, cr0, {0}
    1284:	0004a803 	andeq	sl, r4, r3, lsl #16
    1288:	04f11f00 	ldrbteq	r1, [r1], #3840	; 0xf00
    128c:	2f060000 	svccs	0x00060000
    1290:	0004ae03 	andeq	sl, r4, r3, lsl #28
    1294:	060f0a00 	streq	r0, [pc], -r0, lsl #20
    1298:	091d0000 	ldmdbeq	sp, {}	; <UNPREDICTABLE>
    129c:	00200000 	eoreq	r0, r0, r0
    12a0:	0009120f 	andeq	r1, r9, pc, lsl #4
    12a4:	06c22100 	strbeq	r2, [r2], r0, lsl #2
    12a8:	14070000 	strne	r0, [r7], #-0
    12ac:	0000091d 	andeq	r0, r0, sp, lsl r9
    12b0:	0007c921 	andeq	ip, r7, r1, lsr #18
    12b4:	25150700 	ldrcs	r0, [r5, #-1792]	; 0xfffff900
    12b8:	21000000 	mrscs	r0, (UNDEF: 0)
    12bc:	000003e4 	andeq	r0, r0, r4, ror #7
    12c0:	00252501 	eoreq	r2, r5, r1, lsl #10
    12c4:	9c040000 	stcls	0, cr0, [r4], {-0}
    12c8:	08000007 	stmdaeq	r0, {r0, r1, r2}
    12cc:	00007d28 	andeq	r7, r0, r8, lsr #26
    12d0:	069b0400 	ldreq	r0, [fp], r0, lsl #8
    12d4:	71090000 	mrsvc	r0, (UNDEF: 9)
    12d8:	0000009e 	muleq	r0, lr, r0
    12dc:	00079204 	andeq	r9, r7, r4, lsl #4
    12e0:	a9760900 	ldmdbge	r6!, {r8, fp}^
    12e4:	04000000 	streq	r0, [r0], #-0
    12e8:	000006da 	ldrdeq	r0, [r0], -sl
    12ec:	006f7b09 	rsbeq	r7, pc, r9, lsl #22
    12f0:	e4040000 	str	r0, [r4], #-0
    12f4:	09000007 	stmdbeq	r0, {r0, r1, r2}
    12f8:	00018b8b 	andeq	r8, r1, fp, lsl #23
    12fc:	07de0400 	ldrbeq	r0, [lr, r0, lsl #8]
    1300:	9b090000 	blls	241308 <_stack+0x1c1308>
    1304:	000000e0 	andeq	r0, r0, r0, ror #1
    1308:	00061e04 	andeq	r1, r6, r4, lsl #28
    130c:	f6ad0900 			; <UNDEFINED> instruction: 0xf6ad0900
    1310:	04000000 	streq	r0, [r0], #-0
    1314:	000006e4 	andeq	r0, r0, r4, ror #13
    1318:	00bfb109 	adcseq	fp, pc, r9, lsl #2
    131c:	06040000 	streq	r0, [r4], -r0
    1320:	09000008 	stmdbeq	r0, {r3}
    1324:	0000cab5 			; <UNDEFINED> instruction: 0x0000cab5
    1328:	06260400 	strteq	r0, [r6], -r0, lsl #8
    132c:	b9090000 	stmdblt	r9, {}	; <UNPREDICTABLE>
    1330:	000000d5 	ldrdeq	r0, [r0], -r5
    1334:	00069204 	andeq	r9, r6, r4, lsl #4
    1338:	ebcd0900 	bl	ff343740 <_stack+0xff2c3740>
    133c:	04000000 	streq	r0, [r0], #-0
    1340:	00000851 	andeq	r0, r0, r1, asr r8
    1344:	0180d209 	orreq	sp, r0, r9, lsl #4
    1348:	ad210000 	stcge	0, cr0, [r1, #-0]
    134c:	0a000007 	beq	1370 <CPSR_IRQ_INHIBIT+0x12f0>
    1350:	00005d9a 	muleq	r0, sl, sp
    1354:	06322100 	ldrteq	r2, [r2], -r0, lsl #2
    1358:	9b0a0000 	blls	281360 <_stack+0x201360>
    135c:	00000025 	andeq	r0, r0, r5, lsr #32
    1360:	00018b0a 	andeq	r8, r1, sl, lsl #22
    1364:	0009ed00 	andeq	lr, r9, r0, lsl #26
    1368:	002c0b00 	eoreq	r0, ip, r0, lsl #22
    136c:	00010000 	andeq	r0, r1, r0
    1370:	00066f21 	andeq	r6, r6, r1, lsr #30
    1374:	dd9e0a00 	vldrle	s0, [lr]
    1378:	10000009 	andne	r0, r0, r9
    137c:	00000826 	andeq	r0, r0, r6, lsr #16
    1380:	d11b0b58 	tstle	fp, r8, asr fp
    1384:	0d00000a 	stceq	0, cr0, [r0, #-40]	; 0xffffffd8
    1388:	0000063c 	andeq	r0, r0, ip, lsr r6
    138c:	09901d0b 	ldmibeq	r0, {r0, r1, r3, r8, sl, fp, ip}
    1390:	0d000000 	stceq	0, cr0, [r0, #-0]
    1394:	000007b7 			; <UNDEFINED> instruction: 0x000007b7
    1398:	097a1e0b 	ldmdbeq	sl!, {r0, r1, r3, r9, sl, fp, ip}^
    139c:	0d020000 	stceq	0, cr0, [r2, #-0]
    13a0:	0000080c 	andeq	r0, r0, ip, lsl #16
    13a4:	09b11f0b 	ldmibeq	r1!, {r0, r1, r3, r8, r9, sl, fp, ip}
    13a8:	0d040000 	stceq	0, cr0, [r4, #-0]
    13ac:	0000082b 	andeq	r0, r0, fp, lsr #16
    13b0:	09bc200b 	ldmibeq	ip!, {r0, r1, r3, sp}
    13b4:	0d080000 	stceq	0, cr0, [r8, #-0]
    13b8:	000006fe 	strdeq	r0, [r0], -lr
    13bc:	099b210b 	ldmibeq	fp, {r0, r1, r3, r8, sp}
    13c0:	0d0a0000 	stceq	0, cr0, [sl, #-0]
    13c4:	00000643 	andeq	r0, r0, r3, asr #12
    13c8:	09a6220b 	stmibeq	r6!, {r0, r1, r3, r9, sp}
    13cc:	0d0c0000 	stceq	0, cr0, [ip, #-0]
    13d0:	00000842 	andeq	r0, r0, r2, asr #16
    13d4:	0990230b 	ldmibeq	r0, {r0, r1, r3, r8, r9, sp}
    13d8:	0d0e0000 	stceq	0, cr0, [lr, #-0]
    13dc:	0000071d 	andeq	r0, r0, sp, lsl r7
    13e0:	0985240b 	stmibeq	r5, {r0, r1, r3, sl, sp}
    13e4:	0d100000 	ldceq	0, cr0, [r0, #-0]
    13e8:	000007ec 	andeq	r0, r0, ip, ror #15
    13ec:	0943320b 	stmdbeq	r3, {r0, r1, r3, r9, ip, sp}^
    13f0:	0d180000 	ldceq	0, cr0, [r8, #-0]
    13f4:	000006ea 	andeq	r0, r0, sl, ror #13
    13f8:	005d330b 	subseq	r3, sp, fp, lsl #6
    13fc:	0d200000 	stceq	0, cr0, [r0, #-0]
    1400:	00000859 	andeq	r0, r0, r9, asr r8
    1404:	0943340b 	stmdbeq	r3, {r0, r1, r3, sl, ip, sp}^
    1408:	0d280000 	stceq	0, cr0, [r8, #-0]
    140c:	000006f4 	strdeq	r0, [r0], -r4
    1410:	005d350b 	subseq	r3, sp, fp, lsl #10
    1414:	0d300000 	ldceq	0, cr0, [r0, #-0]
    1418:	000007d3 	ldrdeq	r0, [r0], -r3
    141c:	0943360b 	stmdbeq	r3, {r0, r1, r3, r9, sl, ip, sp}^
    1420:	0d380000 	ldceq	0, cr0, [r8, #-0]
    1424:	000006a9 	andeq	r0, r0, r9, lsr #13
    1428:	005d370b 	subseq	r3, sp, fp, lsl #14
    142c:	0d400000 	stcleq	0, cr0, [r0, #-0]
    1430:	000007be 			; <UNDEFINED> instruction: 0x000007be
    1434:	0959380b 	ldmdbeq	r9, {r0, r1, r3, fp, ip, sp}^
    1438:	0d440000 	stcleq	0, cr0, [r4, #-0]
    143c:	0000064a 	andeq	r0, r0, sl, asr #12
    1440:	094e390b 	stmdbeq	lr, {r0, r1, r3, r8, fp, ip, sp}^
    1444:	0d480000 	stcleq	0, cr0, [r8, #-0]
    1448:	000007f5 	strdeq	r0, [r0], -r5
    144c:	0ad13a0b 	beq	ff44fc80 <_stack+0xff3cfc80>
    1450:	004c0000 	subeq	r0, ip, r0
    1454:	00005d0a 	andeq	r5, r0, sl, lsl #26
    1458:	000ae100 	andeq	lr, sl, r0, lsl #2
    145c:	002c0b00 	eoreq	r0, ip, r0, lsl #22
    1460:	00010000 	andeq	r0, r1, r0
    1464:	736d7422 	cmnvc	sp, #570425344	; 0x22000000
    1468:	110c1000 	mrsne	r1, (UNDEF: 12)
    146c:	00000b1e 	andeq	r0, r0, lr, lsl fp
    1470:	0007a30d 	andeq	sl, r7, sp, lsl #6
    1474:	64120c00 	ldrvs	r0, [r2], #-3072	; 0xfffff400
    1478:	00000009 	andeq	r0, r0, r9
    147c:	00070b0d 	andeq	r0, r7, sp, lsl #22
    1480:	64130c00 	ldrvs	r0, [r3], #-3072	; 0xfffff400
    1484:	04000009 	streq	r0, [r0], #-9
    1488:	0006540d 	andeq	r5, r6, sp, lsl #8
    148c:	64140c00 	ldrvs	r0, [r4], #-3072	; 0xfffff400
    1490:	08000009 	stmdaeq	r0, {r0, r3}
    1494:	0008140d 	andeq	r1, r8, sp, lsl #8
    1498:	64150c00 	ldrvs	r0, [r5], #-3072	; 0xfffff400
    149c:	0c000009 	stceq	0, cr0, [r0], {9}
    14a0:	018b0a00 	orreq	r0, fp, r0, lsl #20
    14a4:	0b2e0000 	bleq	b814ac <_stack+0xb014ac>
    14a8:	2c0b0000 	stccs	0, cr0, [fp], {-0}
    14ac:	00000000 	andeq	r0, r0, r0
    14b0:	062c2300 	strteq	r2, [ip], -r0, lsl #6
    14b4:	2f010000 	svccs	0x00010000
    14b8:	00000b1e 	andeq	r0, r0, lr, lsl fp
    14bc:	98f80305 	ldmls	r8!, {r0, r2, r8, r9}^
    14c0:	15230001 	strne	r0, [r3, #-1]!
    14c4:	01000007 	tsteq	r0, r7
    14c8:	000b5030 	andeq	r5, fp, r0, lsr r0
    14cc:	a8030500 	stmdage	r3, {r8, sl}
    14d0:	05000190 	streq	r0, [r0, #-400]	; 0xfffffe70
    14d4:	00018b04 	andeq	r8, r1, r4, lsl #22
    14d8:	01f52400 	mvnseq	r2, r0, lsl #8
    14dc:	e4010000 	str	r0, [r1], #-0
    14e0:	00000025 	andeq	r0, r0, r5, lsr #32
    14e4:	000084fc 	strdeq	r8, [r0], -ip
    14e8:	00000068 	andeq	r0, r0, r8, rrx
    14ec:	0ba89c01 	bleq	fea284f8 <_stack+0xfe9a84f8>
    14f0:	88250000 	stmdahi	r5!, {}	; <UNPREDICTABLE>
    14f4:	01000001 	tsteq	r0, r1
    14f8:	000025e4 	andeq	r2, r0, r4, ror #11
    14fc:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1500:	72747026 	rsbsvc	r7, r4, #38	; 0x26
    1504:	8be40100 	blhi	ff90190c <_stack+0xff88190c>
    1508:	02000001 	andeq	r0, r0, #1
    150c:	6c266891 	stcvs	8, cr6, [r6], #-580	; 0xfffffdbc
    1510:	01006e65 	tsteq	r0, r5, ror #28
    1514:	000025e4 	andeq	r2, r0, r4, ror #11
    1518:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    151c:	00078b27 	andeq	r8, r7, r7, lsr #22
    1520:	25e60100 	strbcs	r0, [r6, #256]!	; 0x100
    1524:	02000000 	andeq	r0, r0, #0
    1528:	28007491 	stmdacs	r0, {r0, r4, r7, sl, ip, sp, lr}
    152c:	000006ba 			; <UNDEFINED> instruction: 0x000006ba
    1530:	84d8d801 	ldrbhi	sp, [r8], #2049	; 0x801
    1534:	00240000 	eoreq	r0, r4, r0
    1538:	9c010000 	stcls	0, cr0, [r1], {-0}
    153c:	00000bca 	andeq	r0, r0, sl, asr #23
    1540:	01006226 	tsteq	r0, r6, lsr #4
    1544:	000191d8 	ldrdeq	r9, [r1], -r8
    1548:	77910200 	ldrvc	r0, [r1, r0, lsl #4]
    154c:	07ff2900 	ldrbeq	r2, [pc, r0, lsl #18]!
    1550:	d1010000 	mrsle	r0, (UNDEF: 1)
    1554:	00000025 	andeq	r0, r0, r5, lsr #32
    1558:	000084a4 	andeq	r8, r0, r4, lsr #9
    155c:	00000034 	andeq	r0, r0, r4, lsr r0
    1560:	0bf29c01 	bleq	ffca856c <_stack+0xffc2856c>
    1564:	2a250000 	bcs	94156c <_stack+0x8c156c>
    1568:	0100000d 	tsteq	r0, sp
    156c:	000bf2d1 	ldrdeq	pc, [fp], -r1
    1570:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1574:	25040500 	strcs	r0, [r4, #-1280]	; 0xfffffb00
    1578:	29000000 	stmdbcs	r0, {}	; <UNPREDICTABLE>
    157c:	00000725 	andeq	r0, r0, r5, lsr #14
    1580:	0025c901 	eoreq	ip, r5, r1, lsl #18
    1584:	84700000 	ldrbthi	r0, [r0], #-0
    1588:	00340000 	eorseq	r0, r4, r0
    158c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1590:	00000c20 	andeq	r0, r0, r0, lsr #24
    1594:	00067225 	andeq	r7, r6, r5, lsr #4
    1598:	8bc90100 	blhi	ff2419a0 <_stack+0xff1c19a0>
    159c:	02000001 	andeq	r0, r0, #1
    15a0:	29007491 	stmdbcs	r0, {r0, r4, r7, sl, ip, sp, lr}
    15a4:	0000081f 	andeq	r0, r0, pc, lsl r8
    15a8:	0964180c 	stmdbeq	r4!, {r2, r3, fp, ip}^
    15ac:	844c0000 	strbhi	r0, [ip], #-0
    15b0:	00240000 	eoreq	r0, r4, r0
    15b4:	9c010000 	stcls	0, cr0, [r1], {-0}
    15b8:	00000c48 	andeq	r0, r0, r8, asr #24
    15bc:	66756226 	ldrbtvs	r6, [r5], -r6, lsr #4
    15c0:	48c20100 	stmiami	r2, {r8}^
    15c4:	0200000c 	andeq	r0, r0, #12
    15c8:	05007491 	streq	r7, [r0, #-1169]	; 0xfffffb6f
    15cc:	000ae104 	andeq	lr, sl, r4, lsl #2
    15d0:	08262900 	stmdaeq	r6!, {r8, fp, sp}
    15d4:	980b0000 	stmdals	fp, {}	; <UNPREDICTABLE>
    15d8:	00000025 	andeq	r0, r0, r5, lsr #32
    15dc:	00008418 	andeq	r8, r0, r8, lsl r4
    15e0:	00000034 	andeq	r0, r0, r4, lsr r0
    15e4:	0c839c01 	stceq	12, cr9, [r3], {1}
    15e8:	88250000 	stmdahi	r5!, {}	; <UNPREDICTABLE>
    15ec:	01000001 	tsteq	r0, r1
    15f0:	000609ba 			; <UNDEFINED> instruction: 0x000609ba
    15f4:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    15f8:	00747326 	rsbseq	r7, r4, r6, lsr #6
    15fc:	0c83ba01 	vstmiaeq	r3, {s22}
    1600:	91020000 	mrsls	r0, (UNDEF: 2)
    1604:	04050070 	streq	r0, [r5], #-112	; 0xffffff90
    1608:	000009f8 	strdeq	r0, [r0], -r8
    160c:	00086724 	andeq	r6, r8, r4, lsr #14
    1610:	6fa40100 	svcvs	0x00a40100
    1614:	78000009 	stmdavc	r0, {r0, r3}
    1618:	a0000083 	andge	r0, r0, r3, lsl #1
    161c:	01000000 	mrseq	r0, (UNDEF: 0)
    1620:	000cdb9c 	muleq	ip, ip, fp
    1624:	08622500 	stmdaeq	r2!, {r8, sl, sp}^
    1628:	a4010000 	strge	r0, [r1], #-0
    162c:	00000025 	andeq	r0, r0, r5, lsr #32
    1630:	21649102 	cmncs	r4, r2, lsl #2
    1634:	0000068b 	andeq	r0, r0, fp, lsl #13
    1638:	0191a601 	orrseq	sl, r1, r1, lsl #12
    163c:	87270000 	strhi	r0, [r7, -r0]!
    1640:	01000006 	tsteq	r0, r6
    1644:	00018ba7 	andeq	r8, r1, r7, lsr #23
    1648:	fc030500 	stc2	5, cr0, [r3], {-0}
    164c:	27000198 			; <UNDEFINED> instruction: 0x27000198
    1650:	00000682 	andeq	r0, r0, r2, lsl #13
    1654:	018ba801 	orreq	sl, fp, r1, lsl #16
    1658:	91020000 	mrsls	r0, (UNDEF: 2)
    165c:	5c29006c 	stcpl	0, cr0, [r9], #-432	; 0xfffffe50
    1660:	01000001 	tsteq	r0, r1
    1664:	0000259a 	muleq	r0, sl, r5
    1668:	00834c00 	addeq	r4, r3, r0, lsl #24
    166c:	00002c00 	andeq	r2, r0, r0, lsl #24
    1670:	1f9c0100 	svcne	0x009c0100
    1674:	2500000d 	strcs	r0, [r0, #-13]
    1678:	00000188 	andeq	r0, r0, r8, lsl #3
    167c:	00259a01 	eoreq	r9, r5, r1, lsl #20
    1680:	91020000 	mrsls	r0, (UNDEF: 2)
    1684:	74702674 	ldrbtvc	r2, [r0], #-1652	; 0xfffff98c
    1688:	9a010072 	bls	41858 <__bss_end__+0x27ef8>
    168c:	0000018b 	andeq	r0, r0, fp, lsl #3
    1690:	26709102 	ldrbtcs	r9, [r0], -r2, lsl #2
    1694:	006e656c 	rsbeq	r6, lr, ip, ror #10
    1698:	00259a01 	eoreq	r9, r5, r1, lsl #20
    169c:	91020000 	mrsls	r0, (UNDEF: 2)
    16a0:	8629006c 	strthi	r0, [r9], -ip, rrx
    16a4:	01000007 	tsteq	r0, r7
    16a8:	00002593 	muleq	r0, r3, r5
    16ac:	00832000 	addeq	r2, r3, r0
    16b0:	00002c00 	andeq	r2, r0, r0, lsl #24
    16b4:	639c0100 	orrsvs	r0, ip, #0, 2
    16b8:	2500000d 	strcs	r0, [r0, #-13]
    16bc:	00000672 	andeq	r0, r0, r2, ror r6
    16c0:	06099301 	streq	r9, [r9], -r1, lsl #6
    16c4:	91020000 	mrsls	r0, (UNDEF: 2)
    16c8:	00d02574 	sbcseq	r2, r0, r4, ror r5
    16cc:	93010000 	movwls	r0, #4096	; 0x1000
    16d0:	00000025 	andeq	r0, r0, r5, lsr #32
    16d4:	25709102 	ldrbcs	r9, [r0, #-258]!	; 0xfffffefe
    16d8:	0000080f 	andeq	r0, r0, pc, lsl #16
    16dc:	00259301 	eoreq	r9, r5, r1, lsl #6
    16e0:	91020000 	mrsls	r0, (UNDEF: 2)
    16e4:	0529006c 	streq	r0, [r9, #-108]!	; 0xffffff94
    16e8:	01000007 	tsteq	r0, r7
    16ec:	0000258c 	andeq	r2, r0, ip, lsl #11
    16f0:	0082f400 	addeq	pc, r2, r0, lsl #8
    16f4:	00002c00 	andeq	r2, r0, r0, lsl #24
    16f8:	a79c0100 	ldrge	r0, [ip, r0, lsl #2]
    16fc:	2500000d 	strcs	r0, [r0, #-13]
    1700:	00000188 	andeq	r0, r0, r8, lsl #3
    1704:	00258c01 	eoreq	r8, r5, r1, lsl #24
    1708:	91020000 	mrsls	r0, (UNDEF: 2)
    170c:	74702674 	ldrbtvc	r2, [r0], #-1652	; 0xfffff98c
    1710:	8c010072 	stchi	0, cr0, [r1], {114}	; 0x72
    1714:	00000025 	andeq	r0, r0, r5, lsr #32
    1718:	26709102 	ldrbtcs	r9, [r0], -r2, lsl #2
    171c:	00726964 	rsbseq	r6, r2, r4, ror #18
    1720:	00258c01 	eoreq	r8, r5, r1, lsl #24
    1724:	91020000 	mrsls	r0, (UNDEF: 2)
    1728:	2f29006c 	svccs	0x0029006c
    172c:	01000008 	tsteq	r0, r8
    1730:	00002584 	andeq	r2, r0, r4, lsl #11
    1734:	0082bc00 	addeq	fp, r2, r0, lsl #24
    1738:	00003800 	andeq	r3, r0, r0, lsl #16
    173c:	dd9c0100 	ldfles	f0, [ip]
    1740:	2600000d 	strcs	r0, [r0], -sp
    1744:	00646c6f 	rsbeq	r6, r4, pc, ror #24
    1748:	018b8401 	orreq	r8, fp, r1, lsl #8
    174c:	91020000 	mrsls	r0, (UNDEF: 2)
    1750:	656e2674 	strbvs	r2, [lr, #-1652]!	; 0xfffff98c
    1754:	84010077 	strhi	r0, [r1], #-119	; 0xffffff89
    1758:	0000018b 	andeq	r0, r0, fp, lsl #3
    175c:	00709102 	rsbseq	r9, r0, r2, lsl #2
    1760:	0006a429 	andeq	sl, r6, r9, lsr #8
    1764:	257c0100 	ldrbcs	r0, [ip, #-256]!	; 0xffffff00
    1768:	84000000 	strhi	r0, [r0], #-0
    176c:	38000082 	stmdacc	r0, {r1, r7}
    1770:	01000000 	mrseq	r0, (UNDEF: 0)
    1774:	000e139c 	muleq	lr, ip, r3
    1778:	69702600 	ldmdbvs	r0!, {r9, sl, sp}^
    177c:	7c010064 	stcvc	0, cr0, [r1], {100}	; 0x64
    1780:	00000025 	andeq	r0, r0, r5, lsr #32
    1784:	26749102 	ldrbtcs	r9, [r4], -r2, lsl #2
    1788:	00676973 	rsbeq	r6, r7, r3, ror r9
    178c:	00257c01 	eoreq	r7, r5, r1, lsl #24
    1790:	91020000 	mrsls	r0, (UNDEF: 2)
    1794:	3b290070 	blcc	a4195c <_stack+0x9c195c>
    1798:	01000008 	tsteq	r0, r8
    179c:	00002575 	andeq	r2, r0, r5, ror r5
    17a0:	00826000 	addeq	r6, r2, r0
    17a4:	00002400 	andeq	r2, r0, r0, lsl #8
    17a8:	3b9c0100 	blcc	fe701bb0 <_stack+0xfe681bb0>
    17ac:	2500000e 	strcs	r0, [r0, #-14]
    17b0:	00000188 	andeq	r0, r0, r8, lsl #3
    17b4:	00257501 	eoreq	r7, r5, r1, lsl #10
    17b8:	91020000 	mrsls	r0, (UNDEF: 2)
    17bc:	342a0074 	strtcc	r0, [sl], #-116	; 0xffffff8c
    17c0:	01000008 	tsteq	r0, r8
    17c4:	0000256c 	andeq	r2, r0, ip, ror #10
    17c8:	00824400 	addeq	r4, r2, r0, lsl #8
    17cc:	00001c00 	andeq	r1, r0, r0, lsl #24
    17d0:	299c0100 	ldmibcs	ip, {r8}
    17d4:	00000825 	andeq	r0, r0, r5, lsr #16
    17d8:	0025950b 	eoreq	r9, r5, fp, lsl #10
    17dc:	82100000 	andshi	r0, r0, #0
    17e0:	00340000 	eorseq	r0, r4, r0
    17e4:	9c010000 	stcls	0, cr0, [r1], {-0}
    17e8:	00000e85 	andeq	r0, r0, r5, lsl #29
    17ec:	00018825 	andeq	r8, r1, r5, lsr #16
    17f0:	25620100 	strbcs	r0, [r2, #-256]!	; 0xffffff00
    17f4:	02000000 	andeq	r0, r0, #0
    17f8:	73267491 			; <UNDEFINED> instruction: 0x73267491
    17fc:	62010074 	andvs	r0, r1, #116	; 0x74
    1800:	00000c83 	andeq	r0, r0, r3, lsl #25
    1804:	00709102 	rsbseq	r9, r0, r2, lsl #2
    1808:	0006772a 	andeq	r7, r6, sl, lsr #14
    180c:	25570100 	ldrbcs	r0, [r7, #-256]	; 0xffffff00
    1810:	e4000000 	str	r0, [r0], #-0
    1814:	2c000081 	stccs	0, cr0, [r0], {129}	; 0x81
    1818:	01000000 	mrseq	r0, (UNDEF: 0)
    181c:	06b3299c 	ssateq	r2, #20, ip, lsl #19
    1820:	4e010000 	cdpmi	0, 0, cr0, cr1, cr0, {0}
    1824:	00000025 	andeq	r0, r0, r5, lsr #32
    1828:	000081a8 	andeq	r8, r0, r8, lsr #3
    182c:	0000003c 	andeq	r0, r0, ip, lsr r0
    1830:	0ede9c01 	cdpeq	12, 13, cr9, cr14, cr1, {0}
    1834:	72250000 	eorvc	r0, r5, #0
    1838:	01000006 	tsteq	r0, r6
    183c:	00018b4e 	andeq	r8, r1, lr, asr #22
    1840:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1844:	00084a25 	andeq	r4, r8, r5, lsr #20
    1848:	504e0100 	subpl	r0, lr, r0, lsl #2
    184c:	0200000b 	andeq	r0, r0, #11
    1850:	65267091 	strvs	r7, [r6, #-145]!	; 0xffffff6f
    1854:	0100766e 	tsteq	r0, lr, ror #12
    1858:	000b504e 	andeq	r5, fp, lr, asr #32
    185c:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1860:	056c2900 	strbeq	r2, [ip, #-2304]!	; 0xfffff700
    1864:	46010000 	strmi	r0, [r1], -r0
    1868:	00000025 	andeq	r0, r0, r5, lsr #32
    186c:	00008184 	andeq	r8, r0, r4, lsl #3
    1870:	00000024 	andeq	r0, r0, r4, lsr #32
    1874:	0f069c01 	svceq	0x00069c01
    1878:	88250000 	stmdahi	r5!, {}	; <UNPREDICTABLE>
    187c:	01000001 	tsteq	r0, r1
    1880:	00002546 	andeq	r2, r0, r6, asr #10
    1884:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1888:	067c2b00 	ldrbteq	r2, [ip], -r0, lsl #22
    188c:	38010000 	stmdacc	r1, {}	; <UNPREDICTABLE>
    1890:	00008170 	andeq	r8, r0, r0, ror r1
    1894:	00000014 	andeq	r0, r0, r4, lsl r0
    1898:	2a259c01 	bcs	9688a4 <_stack+0x8e88a4>
    189c:	0100000d 	tsteq	r0, sp
    18a0:	00002538 	andeq	r2, r0, r8, lsr r5
    18a4:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    18a8:	01400000 	mrseq	r0, (UNDEF: 64)
    18ac:	00040000 	andeq	r0, r4, r0
    18b0:	000004b8 			; <UNDEFINED> instruction: 0x000004b8
    18b4:	02050104 	andeq	r0, r5, #4, 2
    18b8:	f30c0000 	vhadd.u8	d0, d12, d0
    18bc:	80000008 	andhi	r0, r0, r8
    18c0:	64000003 	strvs	r0, [r0], #-3
    18c4:	3c000085 	stccc	0, cr0, [r0], {133}	; 0x85
    18c8:	4c000000 	stcmi	0, cr0, [r0], {-0}
    18cc:	02000006 	andeq	r0, r0, #6
    18d0:	03d00601 	bicseq	r0, r0, #1048576	; 0x100000
    18d4:	01020000 	mrseq	r0, (UNDEF: 2)
    18d8:	0003ce08 	andeq	ip, r3, r8, lsl #28
    18dc:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
    18e0:	000003ea 	andeq	r0, r0, sl, ror #7
    18e4:	94070202 	strls	r0, [r7], #-514	; 0xfffffdfe
    18e8:	02000001 	andeq	r0, r0, #1
    18ec:	008d0504 	addeq	r0, sp, r4, lsl #10
    18f0:	cf030000 	svcgt	0x00030000
    18f4:	02000006 	andeq	r0, r0, #6
    18f8:	0000534f 	andeq	r5, r0, pc, asr #6
    18fc:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1900:	0000004a 	andeq	r0, r0, sl, asr #32
    1904:	88050802 	stmdahi	r5, {r1, fp}
    1908:	02000000 	andeq	r0, r0, #0
    190c:	00450708 	subeq	r0, r5, r8, lsl #14
    1910:	04040000 	streq	r0, [r4], #-0
    1914:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
    1918:	07040200 	streq	r0, [r4, -r0, lsl #4]
    191c:	0000004f 	andeq	r0, r0, pc, asr #32
    1920:	0006d103 	andeq	sp, r6, r3, lsl #2
    1924:	48300300 	ldmdami	r0!, {r8, r9}
    1928:	05000000 	streq	r0, [r0, #-0]
    192c:	00000076 	andeq	r0, r0, r6, ror r0
    1930:	28042406 	stmdacs	r4, {r1, r2, sl, sp}
    1934:	000000fb 	strdeq	r0, [r0], -fp
    1938:	00086d07 	andeq	r6, r8, r7, lsl #26
    193c:	812e0400 			; <UNDEFINED> instruction: 0x812e0400
    1940:	00000000 	andeq	r0, r0, r0
    1944:	0008b607 	andeq	fp, r8, r7, lsl #12
    1948:	81350400 	teqhi	r5, r0, lsl #8
    194c:	04000000 	streq	r0, [r0], #-0
    1950:	0008da07 	andeq	sp, r8, r7, lsl #20
    1954:	813c0400 	teqhi	ip, r0, lsl #8
    1958:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    195c:	00094a07 	andeq	r4, r9, r7, lsl #20
    1960:	81410400 	cmphi	r1, r0, lsl #8
    1964:	0c000000 	stceq	0, cr0, [r0], {-0}
    1968:	0008a507 	andeq	sl, r8, r7, lsl #10
    196c:	814b0400 	cmphi	fp, r0, lsl #8
    1970:	10000000 	andne	r0, r0, r0
    1974:	0008ac07 	andeq	sl, r8, r7, lsl #24
    1978:	81520400 	cmphi	r2, r0, lsl #8
    197c:	14000000 	strne	r0, [r0], #-0
    1980:	00087207 	andeq	r7, r8, r7, lsl #4
    1984:	81590400 	cmphi	r9, r0, lsl #8
    1988:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    198c:	0008bc07 	andeq	fp, r8, r7, lsl #24
    1990:	81640400 	cmnhi	r4, r0, lsl #8
    1994:	1c000000 	stcne	0, cr0, [r0], {-0}
    1998:	0008c707 	andeq	ip, r8, r7, lsl #14
    199c:	81720400 	cmnhi	r2, r0, lsl #8
    19a0:	20000000 	andcs	r0, r0, r0
    19a4:	08890300 	stmeq	r9, {r8, r9}
    19a8:	74040000 	strvc	r0, [r4], #-0
    19ac:	00000086 	andeq	r0, r0, r6, lsl #1
    19b0:	00089908 	andeq	r9, r8, r8, lsl #18
    19b4:	170e0100 	strne	r0, [lr, -r0, lsl #2]
    19b8:	05000001 	streq	r0, [r0, #-1]
    19bc:	0190ac03 	orrseq	sl, r0, r3, lsl #24
    19c0:	fb040900 	blx	103dca <_stack+0x83dca>
    19c4:	0a000000 	beq	19cc <CPSR_IRQ_INHIBIT+0x194c>
    19c8:	000008e2 	andeq	r0, r0, r2, ror #17
    19cc:	85881501 	strhi	r1, [r8, #1281]	; 0x501
    19d0:	00180000 	andseq	r0, r8, r0
    19d4:	9c010000 	stcls	0, cr0, [r1], {-0}
    19d8:	0008790b 	andeq	r7, r8, fp, lsl #18
    19dc:	17100100 	ldrne	r0, [r0, -r0, lsl #2]
    19e0:	64000001 	strvs	r0, [r0], #-1
    19e4:	24000085 	strcs	r0, [r0], #-133	; 0xffffff7b
    19e8:	01000000 	mrseq	r0, (UNDEF: 0)
    19ec:	02e6009c 	rsceq	r0, r6, #156	; 0x9c
    19f0:	00040000 	andeq	r0, r4, r0
    19f4:	0000055c 	andeq	r0, r0, ip, asr r5
    19f8:	02050104 	andeq	r0, r5, #4, 2
    19fc:	990c0000 	stmdbls	ip, {}	; <UNPREDICTABLE>
    1a00:	8000000a 	andhi	r0, r0, sl
    1a04:	a0000003 	andge	r0, r0, r3
    1a08:	3c000085 	stccc	0, cr0, [r0], {133}	; 0x85
    1a0c:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    1a10:	02000008 	andeq	r0, r0, #8
    1a14:	03d00601 	bicseq	r0, r0, #1048576	; 0x100000
    1a18:	01020000 	mrseq	r0, (UNDEF: 2)
    1a1c:	0003ce08 	andeq	ip, r3, r8, lsl #28
    1a20:	05020200 	streq	r0, [r2, #-512]	; 0xfffffe00
    1a24:	000003ea 	andeq	r0, r0, sl, ror #7
    1a28:	94070202 	strls	r0, [r7], #-514	; 0xfffffdfe
    1a2c:	02000001 	andeq	r0, r0, #1
    1a30:	008d0504 	addeq	r0, sp, r4, lsl #10
    1a34:	cf030000 	svcgt	0x00030000
    1a38:	02000006 	andeq	r0, r0, #6
    1a3c:	0000534f 	andeq	r5, r0, pc, asr #6
    1a40:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1a44:	0000004a 	andeq	r0, r0, sl, asr #32
    1a48:	88050802 	stmdahi	r5, {r1, fp}
    1a4c:	02000000 	andeq	r0, r0, #0
    1a50:	00450708 	subeq	r0, r5, r8, lsl #14
    1a54:	04040000 	streq	r0, [r4], #-0
    1a58:	746e6905 	strbtvc	r6, [lr], #-2309	; 0xfffff6fb
    1a5c:	07040200 	streq	r0, [r4, -r0, lsl #4]
    1a60:	0000004f 	andeq	r0, r0, pc, asr #32
    1a64:	0006d103 	andeq	sp, r6, r3, lsl #2
    1a68:	48300300 	ldmdami	r0!, {r8, r9}
    1a6c:	05000000 	streq	r0, [r0, #-0]
    1a70:	00000076 	andeq	r0, r0, r6, ror r0
    1a74:	00008106 	andeq	r8, r0, r6, lsl #2
    1a78:	0a8c0300 	beq	fe302680 <_stack+0xfe282680>
    1a7c:	1a040000 	bne	101a84 <_stack+0x81a84>
    1a80:	00000081 	andeq	r0, r0, r1, lsl #1
    1a84:	000a4403 	andeq	r4, sl, r3, lsl #8
    1a88:	861b0400 	ldrhi	r0, [fp], -r0, lsl #8
    1a8c:	03000000 	movweq	r0, #0
    1a90:	00000b20 	andeq	r0, r0, r0, lsr #22
    1a94:	00811c04 	addeq	r1, r1, r4, lsl #24
    1a98:	a4070000 	strge	r0, [r7], #-0
    1a9c:	02a17b05 	adceq	r7, r1, #5120	; 0x1400
    1aa0:	5a080000 	bpl	201aa8 <_stack+0x181aa8>
    1aa4:	05000009 	streq	r0, [r0, #-9]
    1aa8:	00008b7c 	andeq	r8, r0, ip, ror fp
    1aac:	62080000 	andvs	r0, r8, #0
    1ab0:	05000009 	streq	r0, [r0, #-9]
    1ab4:	00008b7d 	andeq	r8, r0, sp, ror fp
    1ab8:	6a080400 	bvs	202ac0 <_stack+0x182ac0>
    1abc:	05000009 	streq	r0, [r0, #-9]
    1ac0:	00008b7e 	andeq	r8, r0, lr, ror fp
    1ac4:	72080800 	andvc	r0, r8, #0, 16
    1ac8:	05000009 	streq	r0, [r0, #-9]
    1acc:	00008b7f 	andeq	r8, r0, pc, ror fp
    1ad0:	7a080c00 	bvc	204ad8 <_stack+0x184ad8>
    1ad4:	05000009 	streq	r0, [r0, #-9]
    1ad8:	00008b80 	andeq	r8, r0, r0, lsl #23
    1adc:	82081000 	andhi	r1, r8, #0
    1ae0:	05000009 	streq	r0, [r0, #-9]
    1ae4:	00008b81 	andeq	r8, r0, r1, lsl #23
    1ae8:	b6081400 	strlt	r1, [r8], -r0, lsl #8
    1aec:	05000009 	streq	r0, [r0, #-9]
    1af0:	00009682 	andeq	r9, r0, r2, lsl #13
    1af4:	53081800 	movwpl	r1, #34816	; 0x8800
    1af8:	05000009 	streq	r0, [r0, #-9]
    1afc:	0000a183 	andeq	sl, r0, r3, lsl #3
    1b00:	3f081c00 	svccc	0x00081c00
    1b04:	0500000b 	streq	r0, [r0, #-11]
    1b08:	0000a184 	andeq	sl, r0, r4, lsl #3
    1b0c:	c0082000 	andgt	r2, r8, r0
    1b10:	05000009 	streq	r0, [r0, #-9]
    1b14:	00009685 	andeq	r9, r0, r5, lsl #13
    1b18:	46082400 	strmi	r2, [r8], -r0, lsl #8
    1b1c:	0500000b 	streq	r0, [r0, #-11]
    1b20:	0000a186 	andeq	sl, r0, r6, lsl #3
    1b24:	3d082800 	stccc	8, cr2, [r8, #-0]
    1b28:	0500000a 	streq	r0, [r0, #-10]
    1b2c:	0000a187 	andeq	sl, r0, r7, lsl #3
    1b30:	ca082c00 	bgt	20cb38 <_stack+0x18cb38>
    1b34:	05000009 	streq	r0, [r0, #-9]
    1b38:	00009688 	andeq	r9, r0, r8, lsl #13
    1b3c:	f6083000 			; <UNDEFINED> instruction: 0xf6083000
    1b40:	0500000a 	streq	r0, [r0, #-10]
    1b44:	0000a189 	andeq	sl, r0, r9, lsl #3
    1b48:	fd083400 	stc2	4, cr3, [r8, #-0]
    1b4c:	0500000a 	streq	r0, [r0, #-10]
    1b50:	0000a18a 	andeq	sl, r0, sl, lsl #3
    1b54:	d4083800 	strle	r3, [r8], #-2048	; 0xfffff800
    1b58:	05000009 	streq	r0, [r0, #-9]
    1b5c:	0000968b 	andeq	r9, r0, fp, lsl #13
    1b60:	f2083c00 			; <UNDEFINED> instruction: 0xf2083c00
    1b64:	05000009 	streq	r0, [r0, #-9]
    1b68:	0000a18c 	andeq	sl, r0, ip, lsl #3
    1b6c:	f9084000 			; <UNDEFINED> instruction: 0xf9084000
    1b70:	05000009 	streq	r0, [r0, #-9]
    1b74:	0000a18d 	andeq	sl, r0, sp, lsl #3
    1b78:	de084400 	cfcpysle	mvf4, mvf8
    1b7c:	05000009 	streq	r0, [r0, #-9]
    1b80:	0000968e 	andeq	r9, r0, lr, lsl #13
    1b84:	a8084800 	stmdage	r8, {fp, lr}
    1b88:	05000009 	streq	r0, [r0, #-9]
    1b8c:	0000a18f 	andeq	sl, r0, pc, lsl #3
    1b90:	af084c00 	svcge	0x00084c00
    1b94:	05000009 	streq	r0, [r0, #-9]
    1b98:	0000a190 	muleq	r0, r0, r1
    1b9c:	e8085000 	stmda	r8, {ip, lr}
    1ba0:	05000009 	streq	r0, [r0, #-9]
    1ba4:	00009691 	muleq	r0, r1, r6
    1ba8:	2d085400 	cfstrscs	mvf5, [r8, #-0]
    1bac:	0500000b 	streq	r0, [r0, #-11]
    1bb0:	0000a192 	muleq	r0, r2, r1
    1bb4:	8a085800 	bhi	217bbc <_stack+0x197bbc>
    1bb8:	05000009 	streq	r0, [r0, #-9]
    1bbc:	0000a193 	muleq	r0, r3, r1
    1bc0:	04085c00 	streq	r5, [r8], #-3072	; 0xfffff400
    1bc4:	0500000b 	streq	r0, [r0, #-11]
    1bc8:	00009694 	muleq	r0, r4, r6
    1bcc:	59086000 	stmdbpl	r8, {sp, lr}
    1bd0:	0500000a 	streq	r0, [r0, #-10]
    1bd4:	0000a195 	muleq	r0, r5, r1
    1bd8:	60086400 	andvs	r6, r8, r0, lsl #8
    1bdc:	0500000a 	streq	r0, [r0, #-10]
    1be0:	0000a196 	muleq	r0, r6, r1
    1be4:	0e086800 	cdpeq	8, 0, cr6, cr8, cr0, {0}
    1be8:	0500000b 	streq	r0, [r0, #-11]
    1bec:	00009697 	muleq	r0, r7, r6
    1bf0:	14086c00 	strne	r6, [r8], #-3072	; 0xfffff400
    1bf4:	0500000a 	streq	r0, [r0, #-10]
    1bf8:	0000a198 	muleq	r0, r8, r1
    1bfc:	85087000 	strhi	r7, [r8, #-0]
    1c00:	0500000a 	streq	r0, [r0, #-10]
    1c04:	0000a199 	muleq	r0, r9, r1
    1c08:	00087400 	andeq	r7, r8, r0, lsl #8
    1c0c:	0500000a 	streq	r0, [r0, #-10]
    1c10:	0000969a 	muleq	r0, sl, r6
    1c14:	7d087800 	stcvc	8, cr7, [r8, #-0]
    1c18:	0500000a 	streq	r0, [r0, #-10]
    1c1c:	0000a19b 	muleq	r0, fp, r1
    1c20:	51087c00 	tstpl	r8, r0, lsl #24
    1c24:	0500000a 	streq	r0, [r0, #-10]
    1c28:	0000a19c 	muleq	r0, ip, r1
    1c2c:	0a088000 	beq	221c34 <_stack+0x1a1c34>
    1c30:	0500000a 	streq	r0, [r0, #-10]
    1c34:	0000969d 	muleq	r0, sp, r6
    1c38:	2d088400 	cfstrscs	mvf8, [r8, #-0]
    1c3c:	0500000a 	streq	r0, [r0, #-10]
    1c40:	0000a19e 	muleq	r0, lr, r1
    1c44:	35088800 	strcc	r8, [r8, #-2048]	; 0xfffff800
    1c48:	0500000a 	streq	r0, [r0, #-10]
    1c4c:	0000a19f 	muleq	r0, pc, r1	; <UNPREDICTABLE>
    1c50:	67088c00 	strvs	r8, [r8, -r0, lsl #24]
    1c54:	0500000a 	streq	r0, [r0, #-10]
    1c58:	000096a0 	andeq	r9, r0, r0, lsr #13
    1c5c:	1b089000 	blne	225c64 <_stack+0x1a5c64>
    1c60:	0500000a 	streq	r0, [r0, #-10]
    1c64:	0000a1a1 	andeq	sl, r0, r1, lsr #3
    1c68:	91089400 	tstls	r8, r0, lsl #8
    1c6c:	05000009 	streq	r0, [r0, #-9]
    1c70:	0000a1a2 	andeq	sl, r0, r2, lsr #3
    1c74:	ec089800 	stc	8, cr9, [r8], {-0}
    1c78:	0500000a 	streq	r0, [r0, #-10]
    1c7c:	0000a1a3 	andeq	sl, r0, r3, lsr #3
    1c80:	72089c00 	andvc	r9, r8, #0, 24
    1c84:	0500000a 	streq	r0, [r0, #-10]
    1c88:	000096a4 	andeq	r9, r0, r4, lsr #13
    1c8c:	0300a000 	movweq	sl, #0
    1c90:	00000b34 	andeq	r0, r0, r4, lsr fp
    1c94:	00aca505 	adceq	sl, ip, r5, lsl #10
    1c98:	18090000 	stmdane	r9, {}	; <UNPREDICTABLE>
    1c9c:	0100000b 	tsteq	r0, fp
    1ca0:	0002bd0e 	andeq	fp, r2, lr, lsl #26
    1ca4:	b0030500 	andlt	r0, r3, r0, lsl #10
    1ca8:	0a000190 	beq	22f0 <CPSR_IRQ_INHIBIT+0x2270>
    1cac:	0002a104 	andeq	sl, r2, r4, lsl #2
    1cb0:	099b0b00 	ldmibeq	fp, {r8, r9, fp}
    1cb4:	15010000 	strne	r0, [r1, #-0]
    1cb8:	000085c4 	andeq	r8, r0, r4, asr #11
    1cbc:	00000018 	andeq	r0, r0, r8, lsl r0
    1cc0:	210c9c01 	tstcs	ip, r1, lsl #24
    1cc4:	0100000a 	tsteq	r0, sl
    1cc8:	0002bd10 	andeq	fp, r2, r0, lsl sp
    1ccc:	0085a000 	addeq	sl, r5, r0
    1cd0:	00002400 	andeq	r2, r0, r0, lsl #8
    1cd4:	009c0100 	addseq	r0, ip, r0, lsl #2
    1cd8:	000001c8 	andeq	r0, r0, r8, asr #3
    1cdc:	06070004 	streq	r0, [r7], -r4
    1ce0:	01040000 	mrseq	r0, (UNDEF: 4)
    1ce4:	00000205 	andeq	r0, r0, r5, lsl #4
    1ce8:	000bdc0c 	andeq	sp, fp, ip, lsl #24
    1cec:	00038000 	andeq	r8, r3, r0
    1cf0:	0085dc00 	addeq	sp, r5, r0, lsl #24
    1cf4:	00011400 	andeq	r1, r1, r0, lsl #8
    1cf8:	0009cc00 	andeq	ip, r9, r0, lsl #24
    1cfc:	06010200 	streq	r0, [r1], -r0, lsl #4
    1d00:	000003d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    1d04:	ce080102 	adfgte	f0, f0, f2
    1d08:	02000003 	andeq	r0, r0, #3
    1d0c:	03ea0502 	mvneq	r0, #8388608	; 0x800000
    1d10:	02020000 	andeq	r0, r2, #0
    1d14:	00019407 	andeq	r9, r1, r7, lsl #8
    1d18:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    1d1c:	0000008d 	andeq	r0, r0, sp, lsl #1
    1d20:	0006cf03 	andeq	ip, r6, r3, lsl #30
    1d24:	534f0200 	movtpl	r0, #61952	; 0xf200
    1d28:	02000000 	andeq	r0, r0, #0
    1d2c:	004a0704 	subeq	r0, sl, r4, lsl #14
    1d30:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    1d34:	00008805 	andeq	r8, r0, r5, lsl #16
    1d38:	07080200 	streq	r0, [r8, -r0, lsl #4]
    1d3c:	00000045 	andeq	r0, r0, r5, asr #32
    1d40:	69050404 	stmdbvs	r5, {r2, sl}
    1d44:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    1d48:	004f0704 	subeq	r0, pc, r4, lsl #14
    1d4c:	d1030000 	mrsle	r0, (UNDEF: 3)
    1d50:	03000006 	movweq	r0, #6
    1d54:	00004830 	andeq	r4, r0, r0, lsr r8
    1d58:	00760500 	rsbseq	r0, r6, r0, lsl #10
    1d5c:	28060000 	stmdacs	r6, {}	; <UNPREDICTABLE>
    1d60:	01072504 	tsteq	r7, r4, lsl #10
    1d64:	ea070000 	b	1c1d6c <_stack+0x141d6c>
    1d68:	0400000c 	streq	r0, [r0], #-12
    1d6c:	00008126 	andeq	r8, r0, r6, lsr #2
    1d70:	dc070000 	stcle	0, cr0, [r7], {-0}
    1d74:	0400000c 	streq	r0, [r0], #-12
    1d78:	00008127 	andeq	r8, r0, r7, lsr #2
    1d7c:	71070400 	tstvc	r7, r0, lsl #8
    1d80:	0400000c 	streq	r0, [r0], #-12
    1d84:	00008128 	andeq	r8, r0, r8, lsr #2
    1d88:	72070800 	andvc	r0, r7, #0, 16
    1d8c:	0400000b 	streq	r0, [r0], #-11
    1d90:	00008129 	andeq	r8, r0, r9, lsr #2
    1d94:	35070c00 	strcc	r0, [r7, #-3072]	; 0xfffff400
    1d98:	0400000c 	streq	r0, [r0], #-12
    1d9c:	0000812a 	andeq	r8, r0, sl, lsr #2
    1da0:	43071000 	movwmi	r1, #28672	; 0x7000
    1da4:	0400000c 	streq	r0, [r0], #-12
    1da8:	0000812b 	andeq	r8, r0, fp, lsr #2
    1dac:	8e071400 	cfcpyshi	mvf1, mvf7
    1db0:	0400000c 	streq	r0, [r0], #-12
    1db4:	0000812c 	andeq	r8, r0, ip, lsr #2
    1db8:	7f071800 	svcvc	0x00071800
    1dbc:	0400000c 	streq	r0, [r0], #-12
    1dc0:	0000812d 	andeq	r8, r0, sp, lsr #2
    1dc4:	63071c00 	movwvs	r1, #31744	; 0x7c00
    1dc8:	0400000b 	streq	r0, [r0], #-11
    1dcc:	0000812e 	andeq	r8, r0, lr, lsr #2
    1dd0:	51072000 	mrspl	r2, (UNDEF: 7)
    1dd4:	0400000c 	streq	r0, [r0], #-12
    1dd8:	0000812f 	andeq	r8, r0, pc, lsr #2
    1ddc:	03002400 	movweq	r2, #1024	; 0x400
    1de0:	00000ca0 	andeq	r0, r0, r0, lsr #25
    1de4:	00863004 	addeq	r3, r6, r4
    1de8:	7e080000 	cdpvc	0, 0, cr0, cr8, cr0, {0}
    1dec:	0100000b 	tsteq	r0, fp
    1df0:	00012314 	andeq	r2, r1, r4, lsl r3
    1df4:	b4030500 	strlt	r0, [r3], #-1280	; 0xfffffb00
    1df8:	09000190 	stmdbeq	r0, {r4, r7, r8}
    1dfc:	00010704 	andeq	r0, r1, r4, lsl #14
    1e00:	0bc60a00 	bleq	ff184608 <_stack+0xff104608>
    1e04:	9b010000 	blls	41e0c <__bss_end__+0x284ac>
    1e08:	000086e0 	andeq	r8, r0, r0, ror #13
    1e0c:	00000010 	andeq	r0, r0, r0, lsl r0
    1e10:	980b9c01 	stmdals	fp, {r0, sl, fp, ip, pc}
    1e14:	0100000b 	tsteq	r0, fp
    1e18:	0086606b 	addeq	r6, r6, fp, rrx
    1e1c:	00008000 	andeq	r8, r0, r0
    1e20:	619c0100 	orrsvs	r0, ip, r0, lsl #2
    1e24:	0c000001 	stceq	0, cr0, [r0], {1}
    1e28:	0074696c 	rsbseq	r6, r4, ip, ror #18
    1e2c:	00686d01 	rsbeq	r6, r8, r1, lsl #26
    1e30:	03050000 	movweq	r0, #20480	; 0x5000
    1e34:	00019900 	andeq	r9, r1, r0, lsl #18
    1e38:	0cca0a00 	vstmiaeq	sl, {s1-s0}
    1e3c:	5d010000 	stcpl	0, cr0, [r1, #-0]
    1e40:	00008648 	andeq	r8, r0, r8, asr #12
    1e44:	00000018 	andeq	r0, r0, r8, lsl r0
    1e48:	4d0a9c01 	stcmi	12, cr9, [sl, #-4]
    1e4c:	0100000b 	tsteq	r0, fp
    1e50:	00863051 	addeq	r3, r6, r1, asr r0
    1e54:	00001800 	andeq	r1, r0, r0, lsl #16
    1e58:	0a9c0100 	beq	fe702260 <_stack+0xfe682260>
    1e5c:	00000b8f 	andeq	r0, r0, pc, lsl #23
    1e60:	86244201 	strthi	r4, [r4], -r1, lsl #4
    1e64:	000c0000 	andeq	r0, ip, r0
    1e68:	9c010000 	stcls	0, cr0, [r1], {-0}
    1e6c:	000ba90a 	andeq	sl, fp, sl, lsl #18
    1e70:	18330100 	ldmdane	r3!, {r8}
    1e74:	0c000086 	stceq	0, cr0, [r0], {134}	; 0x86
    1e78:	01000000 	mrseq	r0, (UNDEF: 0)
    1e7c:	0c640a9c 			; <UNDEFINED> instruction: 0x0c640a9c
    1e80:	28010000 	stmdacs	r1, {}	; <UNPREDICTABLE>
    1e84:	00008600 	andeq	r8, r0, r0, lsl #12
    1e88:	00000018 	andeq	r0, r0, r8, lsl r0
    1e8c:	b50d9c01 	strlt	r9, [sp, #-3073]	; 0xfffff3ff
    1e90:	0100000c 	tsteq	r0, ip
    1e94:	0001231b 	andeq	r2, r1, fp, lsl r3
    1e98:	0085dc00 	addeq	sp, r5, r0, lsl #24
    1e9c:	00002400 	andeq	r2, r0, r0, lsl #8
    1ea0:	009c0100 	addseq	r0, ip, r0, lsl #2
    1ea4:	00000147 	andeq	r0, r0, r7, asr #2
    1ea8:	06d40004 	ldrbeq	r0, [r4], r4
    1eac:	01040000 	mrseq	r0, (UNDEF: 4)
    1eb0:	00000205 	andeq	r0, r0, r5, lsl #4
    1eb4:	000d7d0c 	andeq	r7, sp, ip, lsl #26
    1eb8:	00038000 	andeq	r8, r3, r0
    1ebc:	0086f000 	addeq	pc, r6, r0
    1ec0:	00008000 	andeq	r8, r0, r0
    1ec4:	000bb600 	andeq	fp, fp, r0, lsl #12
    1ec8:	06010200 	streq	r0, [r1], -r0, lsl #4
    1ecc:	000003d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    1ed0:	ce080102 	adfgte	f0, f0, f2
    1ed4:	02000003 	andeq	r0, r0, #3
    1ed8:	03ea0502 	mvneq	r0, #8388608	; 0x800000
    1edc:	02020000 	andeq	r0, r2, #0
    1ee0:	00019407 	andeq	r9, r1, r7, lsl #8
    1ee4:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    1ee8:	0000008d 	andeq	r0, r0, sp, lsl #1
    1eec:	0006cf03 	andeq	ip, r6, r3, lsl #30
    1ef0:	534f0200 	movtpl	r0, #61952	; 0xf200
    1ef4:	02000000 	andeq	r0, r0, #0
    1ef8:	004a0704 	subeq	r0, sl, r4, lsl #14
    1efc:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    1f00:	00008805 	andeq	r8, r0, r5, lsl #16
    1f04:	07080200 	streq	r0, [r8, -r0, lsl #4]
    1f08:	00000045 	andeq	r0, r0, r5, asr #32
    1f0c:	69050404 	stmdbvs	r5, {r2, sl}
    1f10:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
    1f14:	004f0704 	subeq	r0, pc, r4, lsl #14
    1f18:	d1030000 	mrsle	r0, (UNDEF: 3)
    1f1c:	03000006 	movweq	r0, #6
    1f20:	00004830 	andeq	r4, r0, r0, lsr r8
    1f24:	00760500 	rsbseq	r0, r6, r0, lsl #10
    1f28:	1c060000 	stcne	0, cr0, [r6], {-0}
    1f2c:	00e31504 	rsceq	r1, r3, r4, lsl #10
    1f30:	22070000 	andcs	r0, r7, #0
    1f34:	0400000d 	streq	r0, [r0], #-13
    1f38:	00008116 	andeq	r8, r0, r6, lsl r1
    1f3c:	31070000 	mrscc	r0, (UNDEF: 7)
    1f40:	0400000d 	streq	r0, [r0], #-13
    1f44:	00008117 	andeq	r8, r0, r7, lsl r1
    1f48:	17070400 	strne	r0, [r7, -r0, lsl #8]
    1f4c:	0400000d 	streq	r0, [r0], #-13
    1f50:	00008118 	andeq	r8, r0, r8, lsl r1
    1f54:	fc070800 	stc2	8, cr0, [r7], {-0}
    1f58:	0400000c 	streq	r0, [r0], #-12
    1f5c:	00008119 	andeq	r8, r0, r9, lsl r1
    1f60:	05070c00 	streq	r0, [r7, #-3072]	; 0xfffff400
    1f64:	0400000d 	streq	r0, [r0], #-13
    1f68:	0000811a 	andeq	r8, r0, sl, lsl r1
    1f6c:	0e071000 	cdpeq	0, 0, cr1, cr7, cr0, {0}
    1f70:	0400000d 	streq	r0, [r0], #-13
    1f74:	0000811b 	andeq	r8, r0, fp, lsl r1
    1f78:	4f071400 	svcmi	0x00071400
    1f7c:	0400000d 	streq	r0, [r0], #-13
    1f80:	0000811c 	andeq	r8, r0, ip, lsl r1
    1f84:	03001800 	movweq	r1, #2048	; 0x800
    1f88:	00000d6d 	andeq	r0, r0, sp, ror #26
    1f8c:	00861d04 	addeq	r1, r6, r4, lsl #26
    1f90:	d4080000 	strle	r0, [r8], #-0
    1f94:	0100000d 	tsteq	r0, sp
    1f98:	0000ff0e 	andeq	pc, r0, lr, lsl #30
    1f9c:	b8030500 	stmdalt	r3, {r8, sl}
    1fa0:	09000190 	stmdbeq	r0, {r4, r7, r8}
    1fa4:	0000e304 	andeq	lr, r0, r4, lsl #6
    1fa8:	0d580a00 	vldreq	s1, [r8, #-0]
    1fac:	15010000 	strne	r0, [r1, #-0]
    1fb0:	00008714 	andeq	r8, r0, r4, lsl r7
    1fb4:	0000005c 	andeq	r0, r0, ip, asr r0
    1fb8:	01359c01 	teqeq	r5, r1, lsl #24
    1fbc:	750b0000 	strvc	r0, [fp, #-0]
    1fc0:	15010073 	strne	r0, [r1, #-115]	; 0xffffff8d
    1fc4:	00000076 	andeq	r0, r0, r6, ror r0
    1fc8:	0c6c9102 	stfeqp	f1, [ip], #-8
    1fcc:	01007374 	tsteq	r0, r4, ror r3
    1fd0:	00008117 	andeq	r8, r0, r7, lsl r1
    1fd4:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1fd8:	0d3c0d00 	ldceq	13, cr0, [ip, #-0]
    1fdc:	10010000 	andne	r0, r1, r0
    1fe0:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    1fe4:	000086f0 	strdeq	r8, [r0], -r0
    1fe8:	00000024 	andeq	r0, r0, r4, lsr #32
    1fec:	Address 0x0000000000001fec is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <_stack+0x2400ac>
  18:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	000e030b 	andeq	r0, lr, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <_stack+0xe03840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	0f050000 	svceq	0x00050000
  38:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
  3c:	06000013 			; <UNDEFINED> instruction: 0x06000013
  40:	0e030013 	mcreq	0, 0, r0, cr3, cr3, {0}
  44:	0000193c 	andeq	r1, r0, ip, lsr r9
  48:	03001607 	movweq	r1, #1543	; 0x607
  4c:	3b0b3a0e 	blcc	2ce88c <_stack+0x24e88c>
  50:	00134905 	andseq	r4, r3, r5, lsl #18
  54:	01170800 	tsteq	r7, r0, lsl #16
  58:	0b3a0b0b 	bleq	e82c8c <_stack+0xe02c8c>
  5c:	13010b3b 	movwne	r0, #6971	; 0x1b3b
  60:	0d090000 	stceq	0, cr0, [r9, #-0]
  64:	3a0e0300 	bcc	380c6c <_stack+0x300c6c>
  68:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  6c:	0a000013 	beq	c0 <CPSR_IRQ_INHIBIT+0x40>
  70:	13490101 	movtne	r0, #37121	; 0x9101
  74:	00001301 	andeq	r1, r0, r1, lsl #6
  78:	4900210b 	stmdbmi	r0, {r0, r1, r3, r8, sp}
  7c:	000b2f13 	andeq	r2, fp, r3, lsl pc
  80:	01130c00 	tsteq	r3, r0, lsl #24
  84:	0b3a0b0b 	bleq	e82cb8 <_stack+0xe02cb8>
  88:	13010b3b 	movwne	r0, #6971	; 0x1b3b
  8c:	0d0d0000 	stceq	0, cr0, [sp, #-0]
  90:	3a0e0300 	bcc	380c98 <_stack+0x300c98>
  94:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  98:	000b3813 	andeq	r3, fp, r3, lsl r8
  9c:	000f0e00 	andeq	r0, pc, r0, lsl #28
  a0:	00000b0b 	andeq	r0, r0, fp, lsl #22
  a4:	4900260f 	stmdbmi	r0, {r0, r1, r2, r3, r9, sl, sp}
  a8:	10000013 	andne	r0, r0, r3, lsl r0
  ac:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
  b0:	0b3a0b0b 	bleq	e82ce4 <_stack+0xe02ce4>
  b4:	13010b3b 	movwne	r0, #6971	; 0x1b3b
  b8:	0d110000 	ldceq	0, cr0, [r1, #-0]
  bc:	3a080300 	bcc	200cc4 <_stack+0x180cc4>
  c0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  c4:	000b3813 	andeq	r3, fp, r3, lsl r8
  c8:	01131200 	tsteq	r3, r0, lsl #4
  cc:	050b0e03 	streq	r0, [fp, #-3587]	; 0xfffff1fd
  d0:	0b3b0b3a 	bleq	ec2dc0 <_stack+0xe42dc0>
  d4:	00001301 	andeq	r1, r0, r1, lsl #6
  d8:	03000d13 	movweq	r0, #3347	; 0xd13
  dc:	3b0b3a0e 	blcc	2ce91c <_stack+0x24e91c>
  e0:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
  e4:	14000005 	strne	r0, [r0], #-5
  e8:	19270015 	stmdbne	r7!, {r0, r2, r4}
  ec:	15150000 	ldrne	r0, [r5, #-0]
  f0:	49192701 	ldmdbmi	r9, {r0, r8, r9, sl, sp}
  f4:	00130113 	andseq	r0, r3, r3, lsl r1
  f8:	00051600 	andeq	r1, r5, r0, lsl #12
  fc:	00001349 	andeq	r1, r0, r9, asr #6
 100:	03011317 	movweq	r1, #4887	; 0x1317
 104:	3a050b0e 	bcc	142d44 <_stack+0xc2d44>
 108:	01053b0b 	tsteq	r5, fp, lsl #22
 10c:	18000013 	stmdane	r0, {r0, r1, r4}
 110:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 114:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 118:	0b381349 	bleq	e04e44 <_stack+0xd84e44>
 11c:	0d190000 	ldceq	0, cr0, [r9, #-0]
 120:	3a0e0300 	bcc	380d28 <_stack+0x300d28>
 124:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 128:	00053813 	andeq	r3, r5, r3, lsl r8
 12c:	01131a00 	tsteq	r3, r0, lsl #20
 130:	0b0b0e03 	bleq	2c3944 <_stack+0x243944>
 134:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 138:	00001301 	andeq	r1, r0, r1, lsl #6
 13c:	0b01131b 	bleq	44db0 <__bss_end__+0x2b450>
 140:	3b0b3a0b 	blcc	2ce974 <_stack+0x24e974>
 144:	00130105 	andseq	r0, r3, r5, lsl #2
 148:	01171c00 	tsteq	r7, r0, lsl #24
 14c:	0b3a0b0b 	bleq	e82d80 <_stack+0xe02d80>
 150:	1301053b 	movwne	r0, #5435	; 0x153b
 154:	0d1d0000 	ldceq	0, cr0, [sp, #-0]
 158:	3a0e0300 	bcc	380d60 <_stack+0x300d60>
 15c:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 160:	1e000013 	mcrne	0, 0, r0, cr0, cr3, {0}
 164:	19270115 	stmdbne	r7!, {r0, r2, r4, r8}
 168:	00001301 	andeq	r1, r0, r1, lsl #6
 16c:	0300341f 	movweq	r3, #1055	; 0x41f
 170:	3b0b3a0e 	blcc	2ce9b0 <_stack+0x24e9b0>
 174:	3f134905 	svccc	0x00134905
 178:	00193c19 	andseq	r3, r9, r9, lsl ip
 17c:	00342000 	eorseq	r2, r4, r0
 180:	0b3a0e03 	bleq	e83994 <_stack+0xe03994>
 184:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 188:	193c193f 	ldmdbne	ip!, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 18c:	2e210000 	cdpcs	0, 2, cr0, cr1, cr0, {0}
 190:	03193f01 	tsteq	r9, #1, 30
 194:	3b0b3a0e 	blcc	2ce9d4 <_stack+0x24e9d4>
 198:	1119270b 	tstne	r9, fp, lsl #14
 19c:	40061201 	andmi	r1, r6, r1, lsl #4
 1a0:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 1a4:	05220000 	streq	r0, [r2, #-0]!
 1a8:	3a080300 	bcc	200db0 <_stack+0x180db0>
 1ac:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1b0:	00180213 	andseq	r0, r8, r3, lsl r2
 1b4:	00052300 	andeq	r2, r5, r0, lsl #6
 1b8:	0b3a0e03 	bleq	e839cc <_stack+0xe039cc>
 1bc:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1c0:	00001802 	andeq	r1, r0, r2, lsl #16
 1c4:	01110100 	tsteq	r1, r0, lsl #2
 1c8:	0b130e25 	bleq	4c3a64 <_stack+0x443a64>
 1cc:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 1d0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 1d4:	00001710 	andeq	r1, r0, r0, lsl r7
 1d8:	03003402 	movweq	r3, #1026	; 0x402
 1dc:	3b0b3a0e 	blcc	2cea1c <_stack+0x24ea1c>
 1e0:	3f13490b 	svccc	0x0013490b
 1e4:	00193c19 	andseq	r3, r9, r9, lsl ip
 1e8:	00240300 	eoreq	r0, r4, r0, lsl #6
 1ec:	0b3e0b0b 	bleq	f82e20 <_stack+0xf02e20>
 1f0:	00000803 	andeq	r0, r0, r3, lsl #16
 1f4:	3f012e04 	svccc	0x00012e04
 1f8:	3a0e0319 	bcc	380e64 <_stack+0x300e64>
 1fc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 200:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 204:	96184006 	ldrls	r4, [r8], -r6
 208:	13011942 	movwne	r1, #6466	; 0x1942
 20c:	05050000 	streq	r0, [r5, #-0]
 210:	3a080300 	bcc	200e18 <_stack+0x180e18>
 214:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 218:	00180213 	andseq	r0, r8, r3, lsl r2
 21c:	00340600 	eorseq	r0, r4, r0, lsl #12
 220:	0b3a0803 	bleq	e82234 <_stack+0xe02234>
 224:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 228:	00001802 	andeq	r1, r0, r2, lsl #16
 22c:	03003407 	movweq	r3, #1031	; 0x407
 230:	3b0b3a0e 	blcc	2cea70 <_stack+0x24ea70>
 234:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 238:	08000018 	stmdaeq	r0, {r3, r4}
 23c:	0b0b0024 	bleq	2c02d4 <_stack+0x2402d4>
 240:	0e030b3e 	vmoveq.16	d3[0], r0
 244:	0f090000 	svceq	0x00090000
 248:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 24c:	00000013 	andeq	r0, r0, r3, lsl r0
 250:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 254:	030b130e 	movweq	r1, #45838	; 0xb30e
 258:	110e1b0e 	tstne	lr, lr, lsl #22
 25c:	10061201 	andne	r1, r6, r1, lsl #4
 260:	02000017 	andeq	r0, r0, #23
 264:	0b0b0024 	bleq	2c02fc <_stack+0x2402fc>
 268:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 26c:	24030000 	strcs	r0, [r3], #-0
 270:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 274:	000e030b 	andeq	r0, lr, fp, lsl #6
 278:	00160400 	andseq	r0, r6, r0, lsl #8
 27c:	0b3a0e03 	bleq	e83a90 <_stack+0xe03a90>
 280:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 284:	0f050000 	svceq	0x00050000
 288:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 28c:	06000013 			; <UNDEFINED> instruction: 0x06000013
 290:	0e030013 	mcreq	0, 0, r0, cr3, cr3, {0}
 294:	0000193c 	andeq	r1, r0, ip, lsr r9
 298:	03001607 	movweq	r1, #1543	; 0x607
 29c:	3b0b3a0e 	blcc	2ceadc <_stack+0x24eadc>
 2a0:	00134905 	andseq	r4, r3, r5, lsl #18
 2a4:	01170800 	tsteq	r7, r0, lsl #16
 2a8:	0b3a0b0b 	bleq	e82edc <_stack+0xe02edc>
 2ac:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 2b0:	0d090000 	stceq	0, cr0, [r9, #-0]
 2b4:	3a0e0300 	bcc	380ebc <_stack+0x300ebc>
 2b8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2bc:	0a000013 	beq	310 <CPSR_IRQ_INHIBIT+0x290>
 2c0:	13490101 	movtne	r0, #37121	; 0x9101
 2c4:	00001301 	andeq	r1, r0, r1, lsl #6
 2c8:	4900210b 	stmdbmi	r0, {r0, r1, r3, r8, sp}
 2cc:	000b2f13 	andeq	r2, fp, r3, lsl pc
 2d0:	01130c00 	tsteq	r3, r0, lsl #24
 2d4:	0b3a0b0b 	bleq	e82f08 <_stack+0xe02f08>
 2d8:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 2dc:	0d0d0000 	stceq	0, cr0, [sp, #-0]
 2e0:	3a0e0300 	bcc	380ee8 <_stack+0x300ee8>
 2e4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2e8:	000b3813 	andeq	r3, fp, r3, lsl r8
 2ec:	000f0e00 	andeq	r0, pc, r0, lsl #28
 2f0:	00000b0b 	andeq	r0, r0, fp, lsl #22
 2f4:	4900260f 	stmdbmi	r0, {r0, r1, r2, r3, r9, sl, sp}
 2f8:	10000013 	andne	r0, r0, r3, lsl r0
 2fc:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 300:	0b3a0b0b 	bleq	e82f34 <_stack+0xe02f34>
 304:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 308:	0d110000 	ldceq	0, cr0, [r1, #-0]
 30c:	3a080300 	bcc	200f14 <_stack+0x180f14>
 310:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 314:	000b3813 	andeq	r3, fp, r3, lsl r8
 318:	01131200 	tsteq	r3, r0, lsl #4
 31c:	050b0e03 	streq	r0, [fp, #-3587]	; 0xfffff1fd
 320:	0b3b0b3a 	bleq	ec3010 <_stack+0xe43010>
 324:	00001301 	andeq	r1, r0, r1, lsl #6
 328:	03000d13 	movweq	r0, #3347	; 0xd13
 32c:	3b0b3a0e 	blcc	2ceb6c <_stack+0x24eb6c>
 330:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 334:	14000005 	strne	r0, [r0], #-5
 338:	19270015 	stmdbne	r7!, {r0, r2, r4}
 33c:	15150000 	ldrne	r0, [r5, #-0]
 340:	49192701 	ldmdbmi	r9, {r0, r8, r9, sl, sp}
 344:	00130113 	andseq	r0, r3, r3, lsl r1
 348:	00051600 	andeq	r1, r5, r0, lsl #12
 34c:	00001349 	andeq	r1, r0, r9, asr #6
 350:	03011317 	movweq	r1, #4887	; 0x1317
 354:	3a050b0e 	bcc	142f94 <_stack+0xc2f94>
 358:	01053b0b 	tsteq	r5, fp, lsl #22
 35c:	18000013 	stmdane	r0, {r0, r1, r4}
 360:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 364:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 368:	0b381349 	bleq	e05094 <_stack+0xd85094>
 36c:	0d190000 	ldceq	0, cr0, [r9, #-0]
 370:	3a0e0300 	bcc	380f78 <_stack+0x300f78>
 374:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 378:	00053813 	andeq	r3, r5, r3, lsl r8
 37c:	01131a00 	tsteq	r3, r0, lsl #20
 380:	0b0b0e03 	bleq	2c3b94 <_stack+0x243b94>
 384:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 388:	00001301 	andeq	r1, r0, r1, lsl #6
 38c:	0b01131b 	bleq	45000 <__bss_end__+0x2b6a0>
 390:	3b0b3a0b 	blcc	2cebc4 <_stack+0x24ebc4>
 394:	00130105 	andseq	r0, r3, r5, lsl #2
 398:	01171c00 	tsteq	r7, r0, lsl #24
 39c:	0b3a0b0b 	bleq	e82fd0 <_stack+0xe02fd0>
 3a0:	1301053b 	movwne	r0, #5435	; 0x153b
 3a4:	0d1d0000 	ldceq	0, cr0, [sp, #-0]
 3a8:	3a0e0300 	bcc	380fb0 <_stack+0x300fb0>
 3ac:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 3b0:	1e000013 	mcrne	0, 0, r0, cr0, cr3, {0}
 3b4:	19270115 	stmdbne	r7!, {r0, r2, r4, r8}
 3b8:	00001301 	andeq	r1, r0, r1, lsl #6
 3bc:	0300341f 	movweq	r3, #1055	; 0x41f
 3c0:	3b0b3a0e 	blcc	2cec00 <_stack+0x24ec00>
 3c4:	3f134905 	svccc	0x00134905
 3c8:	00193c19 	andseq	r3, r9, r9, lsl ip
 3cc:	00212000 	eoreq	r2, r1, r0
 3d0:	34210000 	strtcc	r0, [r1], #-0
 3d4:	3a0e0300 	bcc	380fdc <_stack+0x300fdc>
 3d8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3dc:	3c193f13 	ldccc	15, cr3, [r9], {19}
 3e0:	22000019 	andcs	r0, r0, #25
 3e4:	08030113 	stmdaeq	r3, {r0, r1, r4, r8}
 3e8:	0b3a0b0b 	bleq	e8301c <_stack+0xe0301c>
 3ec:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 3f0:	34230000 	strtcc	r0, [r3], #-0
 3f4:	3a0e0300 	bcc	380ffc <_stack+0x300ffc>
 3f8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3fc:	02193f13 	andseq	r3, r9, #19, 30	; 0x4c
 400:	24000018 	strcs	r0, [r0], #-24	; 0xffffffe8
 404:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 408:	0b3a0e03 	bleq	e83c1c <_stack+0xe03c1c>
 40c:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 410:	01111349 	tsteq	r1, r9, asr #6
 414:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 418:	01194296 			; <UNDEFINED> instruction: 0x01194296
 41c:	25000013 	strcs	r0, [r0, #-19]	; 0xffffffed
 420:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 424:	0b3b0b3a 	bleq	ec3114 <_stack+0xe43114>
 428:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 42c:	05260000 	streq	r0, [r6, #-0]!
 430:	3a080300 	bcc	201038 <_stack+0x181038>
 434:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 438:	00180213 	andseq	r0, r8, r3, lsl r2
 43c:	00342700 	eorseq	r2, r4, r0, lsl #14
 440:	0b3a0e03 	bleq	e83c54 <_stack+0xe03c54>
 444:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 448:	00001802 	andeq	r1, r0, r2, lsl #16
 44c:	3f012e28 	svccc	0x00012e28
 450:	3a0e0319 	bcc	3810bc <_stack+0x3010bc>
 454:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 458:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 45c:	97184006 	ldrls	r4, [r8, -r6]
 460:	13011942 	movwne	r1, #6466	; 0x1942
 464:	2e290000 	cdpcs	0, 2, cr0, cr9, cr0, {0}
 468:	03193f01 	tsteq	r9, #1, 30
 46c:	3b0b3a0e 	blcc	2cecac <_stack+0x24ecac>
 470:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 474:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 478:	97184006 	ldrls	r4, [r8, -r6]
 47c:	13011942 	movwne	r1, #6466	; 0x1942
 480:	2e2a0000 	cdpcs	0, 2, cr0, cr10, cr0, {0}
 484:	03193f00 	tsteq	r9, #0, 30
 488:	3b0b3a0e 	blcc	2cecc8 <_stack+0x24ecc8>
 48c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 490:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 494:	97184006 	ldrls	r4, [r8, -r6]
 498:	00001942 	andeq	r1, r0, r2, asr #18
 49c:	3f012e2b 	svccc	0x00012e2b
 4a0:	3a0e0319 	bcc	38110c <_stack+0x30110c>
 4a4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 4a8:	19018719 	stmdbne	r1, {r0, r3, r4, r8, r9, sl, pc}
 4ac:	06120111 			; <UNDEFINED> instruction: 0x06120111
 4b0:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 4b4:	00000019 	andeq	r0, r0, r9, lsl r0
 4b8:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 4bc:	030b130e 	movweq	r1, #45838	; 0xb30e
 4c0:	110e1b0e 	tstne	lr, lr, lsl #22
 4c4:	10061201 	andne	r1, r6, r1, lsl #4
 4c8:	02000017 	andeq	r0, r0, #23
 4cc:	0b0b0024 	bleq	2c0564 <_stack+0x240564>
 4d0:	0e030b3e 	vmoveq.16	d3[0], r0
 4d4:	16030000 	strne	r0, [r3], -r0
 4d8:	3a0e0300 	bcc	3810e0 <_stack+0x3010e0>
 4dc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 4e0:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 4e4:	0b0b0024 	bleq	2c057c <_stack+0x24057c>
 4e8:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 4ec:	35050000 	strcc	r0, [r5, #-0]
 4f0:	00134900 	andseq	r4, r3, r0, lsl #18
 4f4:	01130600 	tsteq	r3, r0, lsl #12
 4f8:	0b3a0b0b 	bleq	e8312c <_stack+0xe0312c>
 4fc:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 500:	0d070000 	stceq	0, cr0, [r7, #-0]
 504:	3a0e0300 	bcc	38110c <_stack+0x30110c>
 508:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 50c:	000b3813 	andeq	r3, fp, r3, lsl r8
 510:	00340800 	eorseq	r0, r4, r0, lsl #16
 514:	0b3a0e03 	bleq	e83d28 <_stack+0xe03d28>
 518:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 51c:	00001802 	andeq	r1, r0, r2, lsl #16
 520:	0b000f09 	bleq	414c <CPSR_IRQ_INHIBIT+0x40cc>
 524:	0013490b 	andseq	r4, r3, fp, lsl #18
 528:	002e0a00 	eoreq	r0, lr, r0, lsl #20
 52c:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 530:	0b3b0b3a 	bleq	ec3220 <_stack+0xe43220>
 534:	01111927 	tsteq	r1, r7, lsr #18
 538:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 53c:	00194297 	mulseq	r9, r7, r2
 540:	002e0b00 	eoreq	r0, lr, r0, lsl #22
 544:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 548:	0b3b0b3a 	bleq	ec3238 <_stack+0xe43238>
 54c:	13491927 	movtne	r1, #39207	; 0x9927
 550:	06120111 			; <UNDEFINED> instruction: 0x06120111
 554:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 558:	00000019 	andeq	r0, r0, r9, lsl r0
 55c:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 560:	030b130e 	movweq	r1, #45838	; 0xb30e
 564:	110e1b0e 	tstne	lr, lr, lsl #22
 568:	10061201 	andne	r1, r6, r1, lsl #4
 56c:	02000017 	andeq	r0, r0, #23
 570:	0b0b0024 	bleq	2c0608 <_stack+0x240608>
 574:	0e030b3e 	vmoveq.16	d3[0], r0
 578:	16030000 	strne	r0, [r3], -r0
 57c:	3a0e0300 	bcc	381184 <_stack+0x301184>
 580:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 584:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 588:	0b0b0024 	bleq	2c0620 <_stack+0x240620>
 58c:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 590:	35050000 	strcc	r0, [r5, #-0]
 594:	00134900 	andseq	r4, r3, r0, lsl #18
 598:	00260600 	eoreq	r0, r6, r0, lsl #12
 59c:	00001349 	andeq	r1, r0, r9, asr #6
 5a0:	0b011307 	bleq	451c4 <__bss_end__+0x2b864>
 5a4:	3b0b3a0b 	blcc	2cedd8 <_stack+0x24edd8>
 5a8:	0013010b 	andseq	r0, r3, fp, lsl #2
 5ac:	000d0800 	andeq	r0, sp, r0, lsl #16
 5b0:	0b3a0e03 	bleq	e83dc4 <_stack+0xe03dc4>
 5b4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 5b8:	00000b38 	andeq	r0, r0, r8, lsr fp
 5bc:	03003409 	movweq	r3, #1033	; 0x409
 5c0:	3b0b3a0e 	blcc	2cee00 <_stack+0x24ee00>
 5c4:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 5c8:	0a000018 	beq	630 <CPSR_IRQ_INHIBIT+0x5b0>
 5cc:	0b0b000f 	bleq	2c0610 <_stack+0x240610>
 5d0:	00001349 	andeq	r1, r0, r9, asr #6
 5d4:	3f002e0b 	svccc	0x00002e0b
 5d8:	3a0e0319 	bcc	381244 <_stack+0x301244>
 5dc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 5e0:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 5e4:	97184006 	ldrls	r4, [r8, -r6]
 5e8:	00001942 	andeq	r1, r0, r2, asr #18
 5ec:	3f002e0c 	svccc	0x00002e0c
 5f0:	3a0e0319 	bcc	38125c <_stack+0x30125c>
 5f4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 5f8:	11134919 	tstne	r3, r9, lsl r9
 5fc:	40061201 	andmi	r1, r6, r1, lsl #4
 600:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 604:	01000000 	mrseq	r0, (UNDEF: 0)
 608:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 60c:	0e030b13 	vmoveq.32	d3[0], r0
 610:	01110e1b 	tsteq	r1, fp, lsl lr
 614:	17100612 			; <UNDEFINED> instruction: 0x17100612
 618:	24020000 	strcs	r0, [r2], #-0
 61c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 620:	000e030b 	andeq	r0, lr, fp, lsl #6
 624:	00160300 	andseq	r0, r6, r0, lsl #6
 628:	0b3a0e03 	bleq	e83e3c <_stack+0xe03e3c>
 62c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 630:	24040000 	strcs	r0, [r4], #-0
 634:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 638:	0008030b 	andeq	r0, r8, fp, lsl #6
 63c:	00350500 	eorseq	r0, r5, r0, lsl #10
 640:	00001349 	andeq	r1, r0, r9, asr #6
 644:	0b011306 	bleq	45264 <__bss_end__+0x2b904>
 648:	3b0b3a0b 	blcc	2cee7c <_stack+0x24ee7c>
 64c:	0013010b 	andseq	r0, r3, fp, lsl #2
 650:	000d0700 	andeq	r0, sp, r0, lsl #14
 654:	0b3a0e03 	bleq	e83e68 <_stack+0xe03e68>
 658:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 65c:	00000b38 	andeq	r0, r0, r8, lsr fp
 660:	03003408 	movweq	r3, #1032	; 0x408
 664:	3b0b3a0e 	blcc	2ceea4 <_stack+0x24eea4>
 668:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 66c:	09000018 	stmdbeq	r0, {r3, r4}
 670:	0b0b000f 	bleq	2c06b4 <_stack+0x2406b4>
 674:	00001349 	andeq	r1, r0, r9, asr #6
 678:	3f002e0a 	svccc	0x00002e0a
 67c:	3a0e0319 	bcc	3812e8 <_stack+0x3012e8>
 680:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 684:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 688:	97184006 	ldrls	r4, [r8, -r6]
 68c:	00001942 	andeq	r1, r0, r2, asr #18
 690:	3f012e0b 	svccc	0x00012e0b
 694:	3a0e0319 	bcc	381300 <_stack+0x301300>
 698:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 69c:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 6a0:	96184006 	ldrls	r4, [r8], -r6
 6a4:	13011942 	movwne	r1, #6466	; 0x1942
 6a8:	340c0000 	strcc	r0, [ip], #-0
 6ac:	3a080300 	bcc	2012b4 <_stack+0x1812b4>
 6b0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 6b4:	00180213 	andseq	r0, r8, r3, lsl r2
 6b8:	002e0d00 	eoreq	r0, lr, r0, lsl #26
 6bc:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 6c0:	0b3b0b3a 	bleq	ec33b0 <_stack+0xe433b0>
 6c4:	13491927 	movtne	r1, #39207	; 0x9927
 6c8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 6cc:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 6d0:	00000019 	andeq	r0, r0, r9, lsl r0
 6d4:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 6d8:	030b130e 	movweq	r1, #45838	; 0xb30e
 6dc:	110e1b0e 	tstne	lr, lr, lsl #22
 6e0:	10061201 	andne	r1, r6, r1, lsl #4
 6e4:	02000017 	andeq	r0, r0, #23
 6e8:	0b0b0024 	bleq	2c0780 <_stack+0x240780>
 6ec:	0e030b3e 	vmoveq.16	d3[0], r0
 6f0:	16030000 	strne	r0, [r3], -r0
 6f4:	3a0e0300 	bcc	3812fc <_stack+0x3012fc>
 6f8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 6fc:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
 700:	0b0b0024 	bleq	2c0798 <_stack+0x240798>
 704:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 708:	35050000 	strcc	r0, [r5, #-0]
 70c:	00134900 	andseq	r4, r3, r0, lsl #18
 710:	01130600 	tsteq	r3, r0, lsl #12
 714:	0b3a0b0b 	bleq	e83348 <_stack+0xe03348>
 718:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 71c:	0d070000 	stceq	0, cr0, [r7, #-0]
 720:	3a0e0300 	bcc	381328 <_stack+0x301328>
 724:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 728:	000b3813 	andeq	r3, fp, r3, lsl r8
 72c:	00340800 	eorseq	r0, r4, r0, lsl #16
 730:	0b3a0e03 	bleq	e83f44 <_stack+0xe03f44>
 734:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 738:	00001802 	andeq	r1, r0, r2, lsl #16
 73c:	0b000f09 	bleq	4368 <CPSR_IRQ_INHIBIT+0x42e8>
 740:	0013490b 	andseq	r4, r3, fp, lsl #18
 744:	012e0a00 			; <UNDEFINED> instruction: 0x012e0a00
 748:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 74c:	0b3b0b3a 	bleq	ec343c <_stack+0xe4343c>
 750:	01111927 	tsteq	r1, r7, lsr #18
 754:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 758:	01194297 			; <UNDEFINED> instruction: 0x01194297
 75c:	0b000013 	bleq	7b0 <CPSR_IRQ_INHIBIT+0x730>
 760:	08030005 	stmdaeq	r3, {r0, r2}
 764:	0b3b0b3a 	bleq	ec3454 <_stack+0xe43454>
 768:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 76c:	340c0000 	strcc	r0, [ip], #-0
 770:	3a080300 	bcc	201378 <_stack+0x181378>
 774:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 778:	00180213 	andseq	r0, r8, r3, lsl r2
 77c:	002e0d00 	eoreq	r0, lr, r0, lsl #26
 780:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 784:	0b3b0b3a 	bleq	ec3474 <_stack+0xe43474>
 788:	13491927 	movtne	r1, #39207	; 0x9927
 78c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 790:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 794:	00000019 	andeq	r0, r0, r9, lsl r0

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0000023e 	andeq	r0, r0, lr, lsr r2
   4:	02220002 	eoreq	r0, r2, #2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	2f010000 	svccs	0x00010000
  1c:	2f746e6d 	svccs	0x00746e6d
  20:	6e752f64 	cdpvs	15, 7, cr2, cr5, cr4, {3}
  24:	30322f69 	eorscc	r2, r2, r9, ror #30
  28:	322d3931 	eorcc	r3, sp, #802816	; 0xc4000
  2c:	2f303230 	svccs	0x00303230
  30:	2f485443 	svccs	0x00485443
  34:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
  38:	5f6c6174 	svcpl	0x006c6174
  3c:	6a6f7270 	bvs	1bdca04 <_stack+0x1b5ca04>
  40:	5f746365 	svcpl	0x00746365
  44:	6f62616c 	svcvs	0x0062616c
  48:	6f746172 	svcvs	0x00746172
  4c:	6d2f7972 			; <UNDEFINED> instruction: 0x6d2f7972
  50:	702f7563 	eorvc	r7, pc, r3, ror #10
  54:	2d747261 	lfmcs	f7, 2, [r4, #-388]!	; 0xfffffe7c
  58:	72612f34 	rsbvc	r2, r1, #52, 30	; 0xd0
  5c:	302d636d 	eorcc	r6, sp, sp, ror #6
  60:	2f003331 	svccs	0x00003331
  64:	2f746e6d 	svccs	0x00746e6d
  68:	6e752f64 	cdpvs	15, 7, cr2, cr5, cr4, {3}
  6c:	30322f69 	eorscc	r2, r2, r9, ror #30
  70:	322d3931 	eorcc	r3, sp, #802816	; 0xc4000
  74:	2f303230 	svccs	0x00303230
  78:	2f485443 	svccs	0x00485443
  7c:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
  80:	5f6c6174 	svcpl	0x006c6174
  84:	6a6f7270 	bvs	1bdca4c <_stack+0x1b5ca4c>
  88:	5f746365 	svcpl	0x00746365
  8c:	6f62616c 	svcvs	0x0062616c
  90:	6f746172 	svcvs	0x00746172
  94:	6d2f7972 			; <UNDEFINED> instruction: 0x6d2f7972
  98:	632f7563 			; <UNDEFINED> instruction: 0x632f7563
  9c:	69706d6f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
  a0:	2f72656c 	svccs	0x0072656c
  a4:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
  a8:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
  ac:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
  b0:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
  b4:	2d372d69 	ldccs	13, cr2, [r7, #-420]!	; 0xfffffe5c
  b8:	38313032 	ldmdacc	r1!, {r1, r4, r5, ip, sp}
  bc:	2d32712d 	ldfcss	f7, [r2, #-180]!	; 0xffffff4c
  c0:	61647075 	smcvs	18181	; 0x4705
  c4:	612f6574 			; <UNDEFINED> instruction: 0x612f6574
  c8:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
  cc:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
  d0:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
  d4:	636e692f 	cmnvs	lr, #770048	; 0xbc000
  d8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
  dc:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
  e0:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
  e4:	2f642f74 	svccs	0x00642f74
  e8:	2f696e75 	svccs	0x00696e75
  ec:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
  f0:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
  f4:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
  f8:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
  fc:	61746967 	cmnvs	r4, r7, ror #18
 100:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 104:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 108:	616c5f74 	smcvs	50676	; 0xc5f4
 10c:	61726f62 	cmnvs	r2, r2, ror #30
 110:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 114:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 118:	6d6f632f 	stclvs	3, cr6, [pc, #-188]!	; 64 <CPSR_FIQ_INHIBIT+0x24>
 11c:	656c6970 	strbvs	r6, [ip, #-2416]!	; 0xfffff690
 120:	63672f72 	cmnvs	r7, #456	; 0x1c8
 124:	72612d63 	rsbvc	r2, r1, #6336	; 0x18c0
 128:	6f6e2d6d 	svcvs	0x006e2d6d
 12c:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 130:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 134:	30322d37 	eorscc	r2, r2, r7, lsr sp
 138:	712d3831 			; <UNDEFINED> instruction: 0x712d3831
 13c:	70752d32 	rsbsvc	r2, r5, r2, lsr sp
 140:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 144:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 148:	6363672f 	cmnvs	r3, #12320768	; 0xbc0000
 14c:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 150:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 154:	61652d65 	cmnvs	r5, r5, ror #26
 158:	372f6962 	strcc	r6, [pc, -r2, ror #18]!
 15c:	312e332e 			; <UNDEFINED> instruction: 0x312e332e
 160:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 164:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 168:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 16c:	2f642f74 	svccs	0x00642f74
 170:	2f696e75 	svccs	0x00696e75
 174:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 178:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 17c:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 180:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 184:	61746967 	cmnvs	r4, r7, ror #18
 188:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 18c:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 190:	616c5f74 	smcvs	50676	; 0xc5f4
 194:	61726f62 	cmnvs	r2, r2, ror #30
 198:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 19c:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 1a0:	6d6f632f 	stclvs	3, cr6, [pc, #-188]!	; ec <CPSR_IRQ_INHIBIT+0x6c>
 1a4:	656c6970 	strbvs	r6, [ip, #-2416]!	; 0xfffff690
 1a8:	63672f72 	cmnvs	r7, #456	; 0x1c8
 1ac:	72612d63 	rsbvc	r2, r1, #6336	; 0x18c0
 1b0:	6f6e2d6d 	svcvs	0x006e2d6d
 1b4:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 1b8:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 1bc:	30322d37 	eorscc	r2, r2, r7, lsr sp
 1c0:	712d3831 			; <UNDEFINED> instruction: 0x712d3831
 1c4:	70752d32 	rsbsvc	r2, r5, r2, lsr sp
 1c8:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 1cc:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 1d0:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 1d4:	61652d65 	cmnvs	r5, r5, ror #26
 1d8:	692f6962 	stmdbvs	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
 1dc:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 1e0:	00006564 	andeq	r6, r0, r4, ror #10
 1e4:	636d7261 	cmnvs	sp, #268435462	; 0x10000006
 1e8:	3331302d 	teqcc	r1, #45	; 0x2d
 1ec:	0100632e 	tsteq	r0, lr, lsr #6
 1f0:	6f6c0000 	svcvs	0x006c0000
 1f4:	682e6b63 	stmdavs	lr!, {r0, r1, r5, r6, r8, r9, fp, sp, lr}
 1f8:	00000200 	andeq	r0, r0, r0, lsl #4
 1fc:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 200:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 204:	00000200 	andeq	r0, r0, r0, lsl #4
 208:	64647473 	strbtvs	r7, [r4], #-1139	; 0xfffffb8d
 20c:	682e6665 	stmdavs	lr!, {r0, r2, r5, r6, r9, sl, sp, lr}
 210:	00000300 	andeq	r0, r0, r0, lsl #6
 214:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 218:	00682e74 	rsbeq	r2, r8, r4, ror lr
 21c:	73000002 	movwvc	r0, #2
 220:	696c6474 	stmdbvs	ip!, {r2, r4, r5, r6, sl, sp, lr}^
 224:	00682e62 	rsbeq	r2, r8, r2, ror #28
 228:	00000004 	andeq	r0, r0, r4
 22c:	94020500 	strls	r0, [r2], #-1280	; 0xfffffb00
 230:	03000080 	movweq	r0, #128	; 0x80
 234:	a1bd011a 			; <UNDEFINED> instruction: 0xa1bd011a
 238:	35898586 	strcc	r8, [r9, #1414]	; 0x586
 23c:	0006022f 	andeq	r0, r6, pc, lsr #4
 240:	00940101 	addseq	r0, r4, r1, lsl #2
 244:	00020000 	andeq	r0, r2, r0
 248:	00000072 	andeq	r0, r0, r2, ror r0
 24c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 250:	0101000d 	tsteq	r1, sp
 254:	00000101 	andeq	r0, r0, r1, lsl #2
 258:	00000100 	andeq	r0, r0, r0, lsl #2
 25c:	6e6d2f01 	cdpvs	15, 6, cr2, cr13, cr1, {0}
 260:	2f642f74 	svccs	0x00642f74
 264:	2f696e75 	svccs	0x00696e75
 268:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 26c:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 270:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 274:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 278:	61746967 	cmnvs	r4, r7, ror #18
 27c:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 280:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 284:	616c5f74 	smcvs	50676	; 0xc5f4
 288:	61726f62 	cmnvs	r2, r2, ror #30
 28c:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 290:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 294:	7261702f 	rsbvc	r7, r1, #47	; 0x2f
 298:	2f342d74 	svccs	0x00342d74
 29c:	636d7261 	cmnvs	sp, #268435462	; 0x10000006
 2a0:	3331302d 	teqcc	r1, #45	; 0x2d
 2a4:	72610000 	rsbvc	r0, r1, #0
 2a8:	302d636d 	eorcc	r6, sp, sp, ror #6
 2ac:	632d3331 			; <UNDEFINED> instruction: 0x632d3331
 2b0:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
 2b4:	2e707574 	mrccs	5, 3, r7, cr0, cr4, {3}
 2b8:	00010063 	andeq	r0, r1, r3, rrx
 2bc:	05000000 	streq	r0, [r0, #-0]
 2c0:	00810402 	addeq	r0, r1, r2, lsl #8
 2c4:	01100300 	tsteq	r0, r0, lsl #6
 2c8:	0b0367bb 	bleq	da1bc <_stack+0x5a1bc>
 2cc:	869d2f66 	ldrhi	r2, [sp], r6, ror #30
 2d0:	01040200 	mrseq	r0, R12_usr
 2d4:	00020285 	andeq	r0, r2, r5, lsl #5
 2d8:	036e0101 	cmneq	lr, #1073741824	; 0x40000000
 2dc:	00020000 	andeq	r0, r2, r0
 2e0:	000002f6 	strdeq	r0, [r0], -r6
 2e4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 2e8:	0101000d 	tsteq	r1, sp
 2ec:	00000101 	andeq	r0, r0, r1, lsl #2
 2f0:	00000100 	andeq	r0, r0, r0, lsl #2
 2f4:	6e6d2f01 	cdpvs	15, 6, cr2, cr13, cr1, {0}
 2f8:	2f642f74 	svccs	0x00642f74
 2fc:	2f696e75 	svccs	0x00696e75
 300:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 304:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 308:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 30c:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 310:	61746967 	cmnvs	r4, r7, ror #18
 314:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 318:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 31c:	616c5f74 	smcvs	50676	; 0xc5f4
 320:	61726f62 	cmnvs	r2, r2, ror #30
 324:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 328:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 32c:	7261702f 	rsbvc	r7, r1, #47	; 0x2f
 330:	2f342d74 	svccs	0x00342d74
 334:	636d7261 	cmnvs	sp, #268435462	; 0x10000006
 338:	3331302d 	teqcc	r1, #45	; 0x2d
 33c:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 340:	2f642f74 	svccs	0x00642f74
 344:	2f696e75 	svccs	0x00696e75
 348:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 34c:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 350:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 354:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 358:	61746967 	cmnvs	r4, r7, ror #18
 35c:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 360:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 364:	616c5f74 	smcvs	50676	; 0xc5f4
 368:	61726f62 	cmnvs	r2, r2, ror #30
 36c:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 370:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 374:	6d6f632f 	stclvs	3, cr6, [pc, #-188]!	; 2c0 <CPSR_IRQ_INHIBIT+0x240>
 378:	656c6970 	strbvs	r6, [ip, #-2416]!	; 0xfffff690
 37c:	63672f72 	cmnvs	r7, #456	; 0x1c8
 380:	72612d63 	rsbvc	r2, r1, #6336	; 0x18c0
 384:	6f6e2d6d 	svcvs	0x006e2d6d
 388:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 38c:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 390:	30322d37 	eorscc	r2, r2, r7, lsr sp
 394:	712d3831 			; <UNDEFINED> instruction: 0x712d3831
 398:	70752d32 	rsbsvc	r2, r5, r2, lsr sp
 39c:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 3a0:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 3a4:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 3a8:	61652d65 	cmnvs	r5, r5, ror #26
 3ac:	692f6962 	stmdbvs	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
 3b0:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 3b4:	6d2f6564 	cfstr32vs	mvfx6, [pc, #-400]!	; 22c <CPSR_IRQ_INHIBIT+0x1ac>
 3b8:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 3bc:	2f00656e 	svccs	0x0000656e
 3c0:	2f746e6d 	svccs	0x00746e6d
 3c4:	6e752f64 	cdpvs	15, 7, cr2, cr5, cr4, {3}
 3c8:	30322f69 	eorscc	r2, r2, r9, ror #30
 3cc:	322d3931 	eorcc	r3, sp, #802816	; 0xc4000
 3d0:	2f303230 	svccs	0x00303230
 3d4:	2f485443 	svccs	0x00485443
 3d8:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
 3dc:	5f6c6174 	svcpl	0x006c6174
 3e0:	6a6f7270 	bvs	1bdcda8 <_stack+0x1b5cda8>
 3e4:	5f746365 	svcpl	0x00746365
 3e8:	6f62616c 	svcvs	0x0062616c
 3ec:	6f746172 	svcvs	0x00746172
 3f0:	6d2f7972 			; <UNDEFINED> instruction: 0x6d2f7972
 3f4:	632f7563 			; <UNDEFINED> instruction: 0x632f7563
 3f8:	69706d6f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
 3fc:	2f72656c 	svccs	0x0072656c
 400:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
 404:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 408:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 40c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 410:	2d372d69 	ldccs	13, cr2, [r7, #-420]!	; 0xfffffe5c
 414:	38313032 	ldmdacc	r1!, {r1, r4, r5, ip, sp}
 418:	2d32712d 	ldfcss	f7, [r2, #-180]!	; 0xffffff4c
 41c:	61647075 	smcvs	18181	; 0x4705
 420:	612f6574 			; <UNDEFINED> instruction: 0x612f6574
 424:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 428:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 42c:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 430:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 434:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 438:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 43c:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 440:	2f642f74 	svccs	0x00642f74
 444:	2f696e75 	svccs	0x00696e75
 448:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 44c:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 450:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 454:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 458:	61746967 	cmnvs	r4, r7, ror #18
 45c:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 460:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 464:	616c5f74 	smcvs	50676	; 0xc5f4
 468:	61726f62 	cmnvs	r2, r2, ror #30
 46c:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 470:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 474:	6d6f632f 	stclvs	3, cr6, [pc, #-188]!	; 3c0 <CPSR_IRQ_INHIBIT+0x340>
 478:	656c6970 	strbvs	r6, [ip, #-2416]!	; 0xfffff690
 47c:	63672f72 	cmnvs	r7, #456	; 0x1c8
 480:	72612d63 	rsbvc	r2, r1, #6336	; 0x18c0
 484:	6f6e2d6d 	svcvs	0x006e2d6d
 488:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 48c:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 490:	30322d37 	eorscc	r2, r2, r7, lsr sp
 494:	712d3831 			; <UNDEFINED> instruction: 0x712d3831
 498:	70752d32 	rsbsvc	r2, r5, r2, lsr sp
 49c:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 4a0:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 4a4:	6363672f 	cmnvs	r3, #12320768	; 0xbc0000
 4a8:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 4ac:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 4b0:	61652d65 	cmnvs	r5, r5, ror #26
 4b4:	372f6962 	strcc	r6, [pc, -r2, ror #18]!
 4b8:	312e332e 			; <UNDEFINED> instruction: 0x312e332e
 4bc:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 4c0:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 4c4:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 4c8:	2f642f74 	svccs	0x00642f74
 4cc:	2f696e75 	svccs	0x00696e75
 4d0:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 4d4:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 4d8:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 4dc:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 4e0:	61746967 	cmnvs	r4, r7, ror #18
 4e4:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 4e8:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 4ec:	616c5f74 	smcvs	50676	; 0xc5f4
 4f0:	61726f62 	cmnvs	r2, r2, ror #30
 4f4:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 4f8:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 4fc:	6d6f632f 	stclvs	3, cr6, [pc, #-188]!	; 448 <CPSR_IRQ_INHIBIT+0x3c8>
 500:	656c6970 	strbvs	r6, [ip, #-2416]!	; 0xfffff690
 504:	63672f72 	cmnvs	r7, #456	; 0x1c8
 508:	72612d63 	rsbvc	r2, r1, #6336	; 0x18c0
 50c:	6f6e2d6d 	svcvs	0x006e2d6d
 510:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 514:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 518:	30322d37 	eorscc	r2, r2, r7, lsr sp
 51c:	712d3831 			; <UNDEFINED> instruction: 0x712d3831
 520:	70752d32 	rsbsvc	r2, r5, r2, lsr sp
 524:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 528:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 52c:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 530:	61652d65 	cmnvs	r5, r5, ror #26
 534:	692f6962 	stmdbvs	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
 538:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 53c:	00006564 	andeq	r6, r0, r4, ror #10
 540:	636d7261 	cmnvs	sp, #268435462	; 0x10000006
 544:	3331302d 	teqcc	r1, #45	; 0x2d
 548:	7473632d 	ldrbtvc	r6, [r3], #-813	; 0xfffffcd3
 54c:	2e736275 	mrccs	2, 3, r6, cr3, cr5, {3}
 550:	00010063 	andeq	r0, r1, r3, rrx
 554:	65645f00 	strbvs	r5, [r4, #-3840]!	; 0xfffff100
 558:	6c756166 	ldfvse	f6, [r5], #-408	; 0xfffffe68
 55c:	79745f74 	ldmdbvc	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 560:	2e736570 	mrccs	5, 3, r6, cr3, cr0, {3}
 564:	00020068 	andeq	r0, r2, r8, rrx
 568:	636f6c00 	cmnvs	pc, #0, 24
 56c:	00682e6b 	rsbeq	r2, r8, fp, ror #28
 570:	5f000003 	svcpl	0x00000003
 574:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 578:	00682e73 	rsbeq	r2, r8, r3, ror lr
 57c:	73000003 	movwvc	r0, #3
 580:	65646474 	strbvs	r6, [r4, #-1140]!	; 0xfffffb8c
 584:	00682e66 	rsbeq	r2, r8, r6, ror #28
 588:	72000004 	andvc	r0, r0, #4
 58c:	746e6565 	strbtvc	r6, [lr], #-1381	; 0xfffffa9b
 590:	0300682e 	movweq	r6, #2094	; 0x82e
 594:	72650000 	rsbvc	r0, r5, #0
 598:	2e6f6e72 	mcrcs	14, 3, r6, cr15, cr2, {3}
 59c:	00030068 	andeq	r0, r3, r8, rrx
 5a0:	69745f00 	ldmdbvs	r4!, {r8, r9, sl, fp, ip, lr}^
 5a4:	6176656d 	cmnvs	r6, sp, ror #10
 5a8:	00682e6c 	rsbeq	r2, r8, ip, ror #28
 5ac:	74000003 	strvc	r0, [r0], #-3
 5b0:	73657079 	cmnvc	r5, #121	; 0x79
 5b4:	0300682e 	movweq	r6, #2094	; 0x82e
 5b8:	69740000 	ldmdbvs	r4!, {}^	; <UNPREDICTABLE>
 5bc:	682e656d 	stmdavs	lr!, {r0, r2, r3, r5, r6, r8, sl, sp, lr}
 5c0:	00000500 	andeq	r0, r0, r0, lsl #10
 5c4:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 5c8:	0300682e 	movweq	r6, #2094	; 0x82e
 5cc:	69740000 	ldmdbvs	r4!, {}^	; <UNPREDICTABLE>
 5d0:	2e73656d 	cdpcs	5, 7, cr6, cr3, cr13, {3}
 5d4:	00030068 	andeq	r0, r3, r8, rrx
 5d8:	05000000 	streq	r0, [r0, #-0]
 5dc:	00817002 	addeq	r7, r1, r2
 5e0:	01380300 	teqeq	r8, r0, lsl #6
 5e4:	01040200 	mrseq	r0, R12_usr
 5e8:	2e0a0386 	cdpcs	3, 0, cr0, cr10, cr6, {4}
 5ec:	bb882f83 	bllt	fe20c400 <_stack+0xfe18c400>
 5f0:	4b882f83 	blmi	fe20c404 <_stack+0xfe18c404>
 5f4:	9f8a2f83 	svcls	0x008a2f83
 5f8:	4b892f67 	blmi	fe24c39c <_stack+0xfe1cc39c>
 5fc:	2f83892f 	svccs	0x0083892f
 600:	2f839f87 	svccs	0x00839f87
 604:	2f839f87 	svccs	0x00839f87
 608:	872fbb87 	strhi	fp, [pc, -r7, lsl #23]!
 60c:	bb872fbb 	bllt	fe1cc500 <_stack+0xfe14c500>
 610:	9f878a2f 	svcls	0x00878a2f
 614:	020084a0 	andeq	r8, r0, #160, 8	; 0xa0000000
 618:	22080104 	andcs	r0, r8, #4, 2
 61c:	6b2ff331 	blvs	bfd2e8 <_stack+0xb7d2e8>
 620:	872f679f 			; <UNDEFINED> instruction: 0x872f679f
 624:	83872f83 	orrhi	r2, r7, #524	; 0x20c
 628:	83872f83 	orrhi	r2, r7, #524	; 0x20c
 62c:	a0862f83 	addge	r2, r6, r3, lsl #31
 630:	bd820a03 	vstrlt	s0, [r2, #12]
 634:	03040200 	movweq	r0, #16896	; 0x4200
 638:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
 63c:	0200b903 	andeq	fp, r0, #49152	; 0xc000
 640:	66060104 	strvs	r0, [r6], -r4, lsl #2
 644:	022f8506 	eoreq	r8, pc, #25165824	; 0x1800000
 648:	01010006 	tsteq	r1, r6
 64c:	000001b9 			; <UNDEFINED> instruction: 0x000001b9
 650:	01a00002 	moveq	r0, r2
 654:	01020000 	mrseq	r0, (UNDEF: 2)
 658:	000d0efb 	strdeq	r0, [sp], -fp
 65c:	01010101 	tsteq	r1, r1, lsl #2
 660:	01000000 	mrseq	r0, (UNDEF: 0)
 664:	2f010000 	svccs	0x00010000
 668:	2f746e6d 	svccs	0x00746e6d
 66c:	6e752f64 	cdpvs	15, 7, cr2, cr5, cr4, {3}
 670:	30322f69 	eorscc	r2, r2, r9, ror #30
 674:	322d3931 	eorcc	r3, sp, #802816	; 0xc4000
 678:	2f303230 	svccs	0x00303230
 67c:	2f485443 	svccs	0x00485443
 680:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
 684:	5f6c6174 	svcpl	0x006c6174
 688:	6a6f7270 	bvs	1bdd050 <_stack+0x1b5d050>
 68c:	5f746365 	svcpl	0x00746365
 690:	6f62616c 	svcvs	0x0062616c
 694:	6f746172 	svcvs	0x00746172
 698:	6d2f7972 			; <UNDEFINED> instruction: 0x6d2f7972
 69c:	702f7563 	eorvc	r7, pc, r3, ror #10
 6a0:	2d747261 	lfmcs	f7, 2, [r4, #-388]!	; 0xfffffe7c
 6a4:	72612f34 	rsbvc	r2, r1, #52, 30	; 0xd0
 6a8:	302d636d 	eorcc	r6, sp, sp, ror #6
 6ac:	2f003331 	svccs	0x00003331
 6b0:	2f746e6d 	svccs	0x00746e6d
 6b4:	6e752f64 	cdpvs	15, 7, cr2, cr5, cr4, {3}
 6b8:	30322f69 	eorscc	r2, r2, r9, ror #30
 6bc:	322d3931 	eorcc	r3, sp, #802816	; 0xc4000
 6c0:	2f303230 	svccs	0x00303230
 6c4:	2f485443 	svccs	0x00485443
 6c8:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
 6cc:	5f6c6174 	svcpl	0x006c6174
 6d0:	6a6f7270 	bvs	1bdd098 <_stack+0x1b5d098>
 6d4:	5f746365 	svcpl	0x00746365
 6d8:	6f62616c 	svcvs	0x0062616c
 6dc:	6f746172 	svcvs	0x00746172
 6e0:	6d2f7972 			; <UNDEFINED> instruction: 0x6d2f7972
 6e4:	632f7563 			; <UNDEFINED> instruction: 0x632f7563
 6e8:	69706d6f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
 6ec:	2f72656c 	svccs	0x0072656c
 6f0:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
 6f4:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 6f8:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 6fc:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 700:	2d372d69 	ldccs	13, cr2, [r7, #-420]!	; 0xfffffe5c
 704:	38313032 	ldmdacc	r1!, {r1, r4, r5, ip, sp}
 708:	2d32712d 	ldfcss	f7, [r2, #-180]!	; 0xffffff4c
 70c:	61647075 	smcvs	18181	; 0x4705
 710:	612f6574 			; <UNDEFINED> instruction: 0x612f6574
 714:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 718:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 71c:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 720:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 724:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 728:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 72c:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 730:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 734:	2f642f74 	svccs	0x00642f74
 738:	2f696e75 	svccs	0x00696e75
 73c:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 740:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 744:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 748:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 74c:	61746967 	cmnvs	r4, r7, ror #18
 750:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 754:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 758:	616c5f74 	smcvs	50676	; 0xc5f4
 75c:	61726f62 	cmnvs	r2, r2, ror #30
 760:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 764:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 768:	6d6f632f 	stclvs	3, cr6, [pc, #-188]!	; 6b4 <CPSR_IRQ_INHIBIT+0x634>
 76c:	656c6970 	strbvs	r6, [ip, #-2416]!	; 0xfffff690
 770:	63672f72 	cmnvs	r7, #456	; 0x1c8
 774:	72612d63 	rsbvc	r2, r1, #6336	; 0x18c0
 778:	6f6e2d6d 	svcvs	0x006e2d6d
 77c:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 780:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 784:	30322d37 	eorscc	r2, r2, r7, lsr sp
 788:	712d3831 			; <UNDEFINED> instruction: 0x712d3831
 78c:	70752d32 	rsbsvc	r2, r5, r2, lsr sp
 790:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 794:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 798:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 79c:	61652d65 	cmnvs	r5, r5, ror #26
 7a0:	692f6962 	stmdbvs	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
 7a4:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 7a8:	732f6564 			; <UNDEFINED> instruction: 0x732f6564
 7ac:	00007379 	andeq	r7, r0, r9, ror r3
 7b0:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 7b4:	746d7261 	strbtvc	r7, [sp], #-609	; 0xfffffd9f
 7b8:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 7bc:	0100632e 	tsteq	r0, lr, lsr #6
 7c0:	645f0000 	ldrbvs	r0, [pc], #-0	; 7c8 <CPSR_IRQ_INHIBIT+0x748>
 7c4:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
 7c8:	745f746c 	ldrbvc	r7, [pc], #-1132	; 7d0 <CPSR_IRQ_INHIBIT+0x750>
 7cc:	73657079 	cmnvc	r5, #121	; 0x79
 7d0:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 7d4:	735f0000 	cmpvc	pc, #0
 7d8:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
 7dc:	00682e74 	rsbeq	r2, r8, r4, ror lr
 7e0:	72000003 	andvc	r0, r0, #3
 7e4:	612d6970 			; <UNDEFINED> instruction: 0x612d6970
 7e8:	69746d72 	ldmdbvs	r4!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}^
 7ec:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 7f0:	00010068 	andeq	r0, r1, r8, rrx
 7f4:	05000000 	streq	r0, [r0, #-0]
 7f8:	00856402 	addeq	r6, r5, r2, lsl #8
 7fc:	01100300 	tsteq	r0, r0, lsl #6
 800:	4c85674b 	stcmi	7, cr6, [r5], {75}	; 0x4b
 804:	01000802 	tsteq	r0, r2, lsl #16
 808:	0001bf01 	andeq	fp, r1, r1, lsl #30
 80c:	a6000200 	strge	r0, [r0], -r0, lsl #4
 810:	02000001 	andeq	r0, r0, #1
 814:	0d0efb01 	vstreq	d15, [lr, #-4]
 818:	01010100 	mrseq	r0, (UNDEF: 17)
 81c:	00000001 	andeq	r0, r0, r1
 820:	01000001 	tsteq	r0, r1
 824:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xfffff2d1
 828:	752f642f 	strvc	r6, [pc, #-1071]!	; 401 <CPSR_IRQ_INHIBIT+0x381>
 82c:	322f696e 	eorcc	r6, pc, #1802240	; 0x1b8000
 830:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
 834:	30323032 	eorscc	r3, r2, r2, lsr r0
 838:	4854432f 	ldmdami	r4, {r0, r1, r2, r3, r5, r8, r9, lr}^
 83c:	6769442f 	strbvs	r4, [r9, -pc, lsr #8]!
 840:	6c617469 	cfstrdvs	mvd7, [r1], #-420	; 0xfffffe5c
 844:	6f72705f 	svcvs	0x0072705f
 848:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
 84c:	62616c5f 	rsbvs	r6, r1, #24320	; 0x5f00
 850:	7461726f 	strbtvc	r7, [r1], #-623	; 0xfffffd91
 854:	2f79726f 	svccs	0x0079726f
 858:	2f75636d 	svccs	0x0075636d
 85c:	74726170 	ldrbtvc	r6, [r2], #-368	; 0xfffffe90
 860:	612f342d 			; <UNDEFINED> instruction: 0x612f342d
 864:	2d636d72 	stclcs	13, cr6, [r3, #-456]!	; 0xfffffe38
 868:	00333130 	eorseq	r3, r3, r0, lsr r1
 86c:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xfffff2d1
 870:	752f642f 	strvc	r6, [pc, #-1071]!	; 449 <CPSR_IRQ_INHIBIT+0x3c9>
 874:	322f696e 	eorcc	r6, pc, #1802240	; 0x1b8000
 878:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
 87c:	30323032 	eorscc	r3, r2, r2, lsr r0
 880:	4854432f 	ldmdami	r4, {r0, r1, r2, r3, r5, r8, r9, lr}^
 884:	6769442f 	strbvs	r4, [r9, -pc, lsr #8]!
 888:	6c617469 	cfstrdvs	mvd7, [r1], #-420	; 0xfffffe5c
 88c:	6f72705f 	svcvs	0x0072705f
 890:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
 894:	62616c5f 	rsbvs	r6, r1, #24320	; 0x5f00
 898:	7461726f 	strbtvc	r7, [r1], #-623	; 0xfffffd91
 89c:	2f79726f 	svccs	0x0079726f
 8a0:	2f75636d 	svccs	0x0075636d
 8a4:	706d6f63 	rsbvc	r6, sp, r3, ror #30
 8a8:	72656c69 	rsbvc	r6, r5, #26880	; 0x6900
 8ac:	6363672f 	cmnvs	r3, #12320768	; 0xbc0000
 8b0:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
 8b4:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 8b8:	61652d65 	cmnvs	r5, r5, ror #26
 8bc:	372d6962 	strcc	r6, [sp, -r2, ror #18]!
 8c0:	3130322d 	teqcc	r0, sp, lsr #4
 8c4:	32712d38 	rsbscc	r2, r1, #56, 26	; 0xe00
 8c8:	6470752d 	ldrbtvs	r7, [r0], #-1325	; 0xfffffad3
 8cc:	2f657461 	svccs	0x00657461
 8d0:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 8d4:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 8d8:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 8dc:	6e692f69 	cdpvs	15, 6, cr2, cr9, cr9, {3}
 8e0:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
 8e4:	616d2f65 	cmnvs	sp, r5, ror #30
 8e8:	6e696863 	cdpvs	8, 6, cr6, cr9, cr3, {3}
 8ec:	6d2f0065 	stcvs	0, cr0, [pc, #-404]!	; 760 <CPSR_IRQ_INHIBIT+0x6e0>
 8f0:	642f746e 	strtvs	r7, [pc], #-1134	; 8f8 <CPSR_IRQ_INHIBIT+0x878>
 8f4:	696e752f 	stmdbvs	lr!, {r0, r1, r2, r3, r5, r8, sl, ip, sp, lr}^
 8f8:	3130322f 	teqcc	r0, pc, lsr #4
 8fc:	30322d39 	eorscc	r2, r2, r9, lsr sp
 900:	432f3032 			; <UNDEFINED> instruction: 0x432f3032
 904:	442f4854 	strtmi	r4, [pc], #-2132	; 90c <CPSR_IRQ_INHIBIT+0x88c>
 908:	74696769 	strbtvc	r6, [r9], #-1897	; 0xfffff897
 90c:	705f6c61 	subsvc	r6, pc, r1, ror #24
 910:	656a6f72 	strbvs	r6, [sl, #-3954]!	; 0xfffff08e
 914:	6c5f7463 	cfldrdvs	mvd7, [pc], {99}	; 0x63
 918:	726f6261 	rsbvc	r6, pc, #268435462	; 0x10000006
 91c:	726f7461 	rsbvc	r7, pc, #1627389952	; 0x61000000
 920:	636d2f79 	cmnvs	sp, #484	; 0x1e4
 924:	6f632f75 	svcvs	0x00632f75
 928:	6c69706d 	stclvs	0, cr7, [r9], #-436	; 0xfffffe4c
 92c:	672f7265 	strvs	r7, [pc, -r5, ror #4]!
 930:	612d6363 			; <UNDEFINED> instruction: 0x612d6363
 934:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 938:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 93c:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 940:	322d372d 	eorcc	r3, sp, #11796480	; 0xb40000
 944:	2d383130 	ldfcss	f3, [r8, #-192]!	; 0xffffff40
 948:	752d3271 	strvc	r3, [sp, #-625]!	; 0xfffffd8f
 94c:	74616470 	strbtvc	r6, [r1], #-1136	; 0xfffffb90
 950:	72612f65 	rsbvc	r2, r1, #404	; 0x194
 954:	6f6e2d6d 	svcvs	0x006e2d6d
 958:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 95c:	2f696261 	svccs	0x00696261
 960:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 964:	2f656475 	svccs	0x00656475
 968:	00737973 	rsbseq	r7, r3, r3, ror r9
 96c:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 970:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 974:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 978:	5f000001 	svcpl	0x00000001
 97c:	61666564 	cmnvs	r6, r4, ror #10
 980:	5f746c75 	svcpl	0x00746c75
 984:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0xfffff68c
 988:	00682e73 	rsbeq	r2, r8, r3, ror lr
 98c:	5f000002 	svcpl	0x00000002
 990:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 994:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 998:	00000300 	andeq	r0, r0, r0, lsl #6
 99c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 9a0:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
 9a4:	0100682e 	tsteq	r0, lr, lsr #16
 9a8:	70720000 	rsbsvc	r0, r2, r0
 9ac:	70672d69 	rsbvc	r2, r7, r9, ror #26
 9b0:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
 9b4:	00000100 	andeq	r0, r0, r0, lsl #2
 9b8:	02050000 	andeq	r0, r5, #0
 9bc:	000085a0 	andeq	r8, r0, r0, lsr #11
 9c0:	4b011003 	blmi	449d4 <__bss_end__+0x2b074>
 9c4:	024c8567 	subeq	r8, ip, #432013312	; 0x19c00000
 9c8:	01010008 	tsteq	r1, r8
 9cc:	000001e6 	andeq	r0, r0, r6, ror #3
 9d0:	01a40002 			; <UNDEFINED> instruction: 0x01a40002
 9d4:	01020000 	mrseq	r0, (UNDEF: 2)
 9d8:	000d0efb 	strdeq	r0, [sp], -fp
 9dc:	01010101 	tsteq	r1, r1, lsl #2
 9e0:	01000000 	mrseq	r0, (UNDEF: 0)
 9e4:	2f010000 	svccs	0x00010000
 9e8:	2f746e6d 	svccs	0x00746e6d
 9ec:	6e752f64 	cdpvs	15, 7, cr2, cr5, cr4, {3}
 9f0:	30322f69 	eorscc	r2, r2, r9, ror #30
 9f4:	322d3931 	eorcc	r3, sp, #802816	; 0xc4000
 9f8:	2f303230 	svccs	0x00303230
 9fc:	2f485443 	svccs	0x00485443
 a00:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
 a04:	5f6c6174 	svcpl	0x006c6174
 a08:	6a6f7270 	bvs	1bdd3d0 <_stack+0x1b5d3d0>
 a0c:	5f746365 	svcpl	0x00746365
 a10:	6f62616c 	svcvs	0x0062616c
 a14:	6f746172 	svcvs	0x00746172
 a18:	6d2f7972 			; <UNDEFINED> instruction: 0x6d2f7972
 a1c:	702f7563 	eorvc	r7, pc, r3, ror #10
 a20:	2d747261 	lfmcs	f7, 2, [r4, #-388]!	; 0xfffffe7c
 a24:	72612f34 	rsbvc	r2, r1, #52, 30	; 0xd0
 a28:	302d636d 	eorcc	r6, sp, sp, ror #6
 a2c:	2f003331 	svccs	0x00003331
 a30:	2f746e6d 	svccs	0x00746e6d
 a34:	6e752f64 	cdpvs	15, 7, cr2, cr5, cr4, {3}
 a38:	30322f69 	eorscc	r2, r2, r9, ror #30
 a3c:	322d3931 	eorcc	r3, sp, #802816	; 0xc4000
 a40:	2f303230 	svccs	0x00303230
 a44:	2f485443 	svccs	0x00485443
 a48:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
 a4c:	5f6c6174 	svcpl	0x006c6174
 a50:	6a6f7270 	bvs	1bdd418 <_stack+0x1b5d418>
 a54:	5f746365 	svcpl	0x00746365
 a58:	6f62616c 	svcvs	0x0062616c
 a5c:	6f746172 	svcvs	0x00746172
 a60:	6d2f7972 			; <UNDEFINED> instruction: 0x6d2f7972
 a64:	632f7563 			; <UNDEFINED> instruction: 0x632f7563
 a68:	69706d6f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
 a6c:	2f72656c 	svccs	0x0072656c
 a70:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
 a74:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 a78:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 a7c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 a80:	2d372d69 	ldccs	13, cr2, [r7, #-420]!	; 0xfffffe5c
 a84:	38313032 	ldmdacc	r1!, {r1, r4, r5, ip, sp}
 a88:	2d32712d 	ldfcss	f7, [r2, #-180]!	; 0xffffff4c
 a8c:	61647075 	smcvs	18181	; 0x4705
 a90:	612f6574 			; <UNDEFINED> instruction: 0x612f6574
 a94:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 a98:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 a9c:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 aa0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 aa4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 aa8:	63616d2f 	cmnvs	r1, #3008	; 0xbc0
 aac:	656e6968 	strbvs	r6, [lr, #-2408]!	; 0xfffff698
 ab0:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 ab4:	2f642f74 	svccs	0x00642f74
 ab8:	2f696e75 	svccs	0x00696e75
 abc:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 ac0:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 ac4:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 ac8:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 acc:	61746967 	cmnvs	r4, r7, ror #18
 ad0:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 ad4:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 ad8:	616c5f74 	smcvs	50676	; 0xc5f4
 adc:	61726f62 	cmnvs	r2, r2, ror #30
 ae0:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 ae4:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 ae8:	6d6f632f 	stclvs	3, cr6, [pc, #-188]!	; a34 <CPSR_IRQ_INHIBIT+0x9b4>
 aec:	656c6970 	strbvs	r6, [ip, #-2416]!	; 0xfffff690
 af0:	63672f72 	cmnvs	r7, #456	; 0x1c8
 af4:	72612d63 	rsbvc	r2, r1, #6336	; 0x18c0
 af8:	6f6e2d6d 	svcvs	0x006e2d6d
 afc:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 b00:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 b04:	30322d37 	eorscc	r2, r2, r7, lsr sp
 b08:	712d3831 			; <UNDEFINED> instruction: 0x712d3831
 b0c:	70752d32 	rsbsvc	r2, r5, r2, lsr sp
 b10:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 b14:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 b18:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 b1c:	61652d65 	cmnvs	r5, r5, ror #26
 b20:	692f6962 	stmdbvs	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
 b24:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 b28:	732f6564 			; <UNDEFINED> instruction: 0x732f6564
 b2c:	00007379 	andeq	r7, r0, r9, ror r3
 b30:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 b34:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 b38:	70757272 	rsbsvc	r7, r5, r2, ror r2
 b3c:	632e7374 			; <UNDEFINED> instruction: 0x632e7374
 b40:	00000100 	andeq	r0, r0, r0, lsl #2
 b44:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 b48:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 b4c:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 b50:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 b54:	00000200 	andeq	r0, r0, r0, lsl #4
 b58:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 b5c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 b60:	00030068 	andeq	r0, r3, r8, rrx
 b64:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 b68:	746e692d 	strbtvc	r6, [lr], #-2349	; 0xfffff6d3
 b6c:	75727265 	ldrbvc	r7, [r2, #-613]!	; 0xfffffd9b
 b70:	2e737470 	mrccs	4, 3, r7, cr3, cr0, {3}
 b74:	00010068 	andeq	r0, r1, r8, rrx
 b78:	05000000 	streq	r0, [r0, #-0]
 b7c:	0085dc02 	addeq	sp, r5, r2, lsl #24
 b80:	011b0300 	tsteq	fp, r0, lsl #6
 b84:	0b03674b 	bleq	da8b8 <_stack+0x5a8b8>
 b88:	09034c82 	stmdbeq	r3, {r1, r7, sl, fp, lr}
 b8c:	04020082 	streq	r0, [r2], #-130	; 0xffffff7e
 b90:	0e034b01 	vmlaeq.f64	d4, d3, d1
 b94:	0402002e 	streq	r0, [r2], #-46	; 0xffffffd2
 b98:	0e034b01 	vmlaeq.f64	d4, d3, d1
 b9c:	0a034c2e 	beq	d3c5c <_stack+0x53c5c>
 ba0:	0c034c82 	stceq	12, cr4, [r3], {130}	; 0x82
 ba4:	a0856c82 	addge	r6, r5, r2, lsl #25
 ba8:	832b8983 			; <UNDEFINED> instruction: 0x832b8983
 bac:	661d0384 	ldrvs	r0, [sp], -r4, lsl #7
 bb0:	00060230 	andeq	r0, r6, r0, lsr r2
 bb4:	01c30101 	biceq	r0, r3, r1, lsl #2
 bb8:	00020000 	andeq	r0, r2, r0
 bbc:	000001a0 	andeq	r0, r0, r0, lsr #3
 bc0:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 bc4:	0101000d 	tsteq	r1, sp
 bc8:	00000101 	andeq	r0, r0, r1, lsl #2
 bcc:	00000100 	andeq	r0, r0, r0, lsl #2
 bd0:	6e6d2f01 	cdpvs	15, 6, cr2, cr13, cr1, {0}
 bd4:	2f642f74 	svccs	0x00642f74
 bd8:	2f696e75 	svccs	0x00696e75
 bdc:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 be0:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 be4:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 be8:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 bec:	61746967 	cmnvs	r4, r7, ror #18
 bf0:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 bf4:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 bf8:	616c5f74 	smcvs	50676	; 0xc5f4
 bfc:	61726f62 	cmnvs	r2, r2, ror #30
 c00:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 c04:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 c08:	7261702f 	rsbvc	r7, r1, #47	; 0x2f
 c0c:	2f342d74 	svccs	0x00342d74
 c10:	636d7261 	cmnvs	sp, #268435462	; 0x10000006
 c14:	3331302d 	teqcc	r1, #45	; 0x2d
 c18:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 c1c:	2f642f74 	svccs	0x00642f74
 c20:	2f696e75 	svccs	0x00696e75
 c24:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 c28:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 c2c:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 c30:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 c34:	61746967 	cmnvs	r4, r7, ror #18
 c38:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 c3c:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 c40:	616c5f74 	smcvs	50676	; 0xc5f4
 c44:	61726f62 	cmnvs	r2, r2, ror #30
 c48:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 c4c:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 c50:	6d6f632f 	stclvs	3, cr6, [pc, #-188]!	; b9c <CPSR_IRQ_INHIBIT+0xb1c>
 c54:	656c6970 	strbvs	r6, [ip, #-2416]!	; 0xfffff690
 c58:	63672f72 	cmnvs	r7, #456	; 0x1c8
 c5c:	72612d63 	rsbvc	r2, r1, #6336	; 0x18c0
 c60:	6f6e2d6d 	svcvs	0x006e2d6d
 c64:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
 c68:	2d696261 	sfmcs	f6, 2, [r9, #-388]!	; 0xfffffe7c
 c6c:	30322d37 	eorscc	r2, r2, r7, lsr sp
 c70:	712d3831 			; <UNDEFINED> instruction: 0x712d3831
 c74:	70752d32 	rsbsvc	r2, r5, r2, lsr sp
 c78:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 c7c:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 c80:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
 c84:	61652d65 	cmnvs	r5, r5, ror #26
 c88:	692f6962 	stmdbvs	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
 c8c:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
 c90:	6d2f6564 	cfstr32vs	mvfx6, [pc, #-400]!	; b08 <CPSR_IRQ_INHIBIT+0xa88>
 c94:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
 c98:	2f00656e 	svccs	0x0000656e
 c9c:	2f746e6d 	svccs	0x00746e6d
 ca0:	6e752f64 	cdpvs	15, 7, cr2, cr5, cr4, {3}
 ca4:	30322f69 	eorscc	r2, r2, r9, ror #30
 ca8:	322d3931 	eorcc	r3, sp, #802816	; 0xc4000
 cac:	2f303230 	svccs	0x00303230
 cb0:	2f485443 	svccs	0x00485443
 cb4:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
 cb8:	5f6c6174 	svcpl	0x006c6174
 cbc:	6a6f7270 	bvs	1bdd684 <_stack+0x1b5d684>
 cc0:	5f746365 	svcpl	0x00746365
 cc4:	6f62616c 	svcvs	0x0062616c
 cc8:	6f746172 	svcvs	0x00746172
 ccc:	6d2f7972 			; <UNDEFINED> instruction: 0x6d2f7972
 cd0:	632f7563 			; <UNDEFINED> instruction: 0x632f7563
 cd4:	69706d6f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
 cd8:	2f72656c 	svccs	0x0072656c
 cdc:	2d636367 	stclcs	3, cr6, [r3, #-412]!	; 0xfffffe64
 ce0:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
 ce4:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
 ce8:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
 cec:	2d372d69 	ldccs	13, cr2, [r7, #-420]!	; 0xfffffe5c
 cf0:	38313032 	ldmdacc	r1!, {r1, r4, r5, ip, sp}
 cf4:	2d32712d 	ldfcss	f7, [r2, #-180]!	; 0xffffff4c
 cf8:	61647075 	smcvs	18181	; 0x4705
 cfc:	612f6574 			; <UNDEFINED> instruction: 0x612f6574
 d00:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 d04:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 d08:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 d0c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 d10:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
 d14:	7379732f 	cmnvc	r9, #-1140850688	; 0xbc000000
 d18:	70720000 	rsbsvc	r0, r2, r0
 d1c:	79732d69 	ldmdbvc	r3!, {r0, r3, r5, r6, r8, sl, fp, sp}^
 d20:	6d697473 	cfstrdvs	mvd7, [r9, #-460]!	; 0xfffffe34
 d24:	632e7265 			; <UNDEFINED> instruction: 0x632e7265
 d28:	00000100 	andeq	r0, r0, r0, lsl #2
 d2c:	6665645f 			; <UNDEFINED> instruction: 0x6665645f
 d30:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 d34:	7079745f 	rsbsvc	r7, r9, pc, asr r4
 d38:	682e7365 	stmdavs	lr!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}
 d3c:	00000200 	andeq	r0, r0, r0, lsl #4
 d40:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 d44:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 d48:	00030068 	andeq	r0, r3, r8, rrx
 d4c:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 d50:	7379732d 	cmnvc	r9, #-1275068416	; 0xb4000000
 d54:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 d58:	00682e72 	rsbeq	r2, r8, r2, ror lr
 d5c:	00000001 	andeq	r0, r0, r1
 d60:	f0020500 			; <UNDEFINED> instruction: 0xf0020500
 d64:	03000086 	movweq	r0, #134	; 0x86
 d68:	674b0110 	smlaldvs	r0, fp, r0, r1
 d6c:	00a08385 	adceq	r8, r0, r5, lsl #7
 d70:	06010402 	streq	r0, [r1], -r2, lsl #8
 d74:	2408062e 	strcs	r0, [r8], #-1582	; 0xfffff9d2
 d78:	01000802 	tsteq	r0, r2, lsl #16
 d7c:	Address 0x0000000000000d7c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000001c 	andeq	r0, r0, ip, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00008094 	muleq	r0, r4, r0
  1c:	00000070 	andeq	r0, r0, r0, ror r0
  20:	8b080e42 	blhi	203930 <_stack+0x183930>
  24:	42018e02 	andmi	r8, r1, #2, 28
  28:	72040b0c 	andvc	r0, r4, #12, 22	; 0x3000
  2c:	00080d0c 	andeq	r0, r8, ip, lsl #26
  30:	0000000c 	andeq	r0, r0, ip
  34:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  38:	7c020001 	stcvc	0, cr0, [r2], {1}
  3c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  40:	00000018 	andeq	r0, r0, r8, lsl r0
  44:	00000030 	andeq	r0, r0, r0, lsr r0
  48:	00008104 	andeq	r8, r0, r4, lsl #2
  4c:	0000006c 	andeq	r0, r0, ip, rrx
  50:	8b080e42 	blhi	203960 <_stack+0x183960>
  54:	42018e02 	andmi	r8, r1, #2, 28
  58:	00040b0c 	andeq	r0, r4, ip, lsl #22
  5c:	0000000c 	andeq	r0, r0, ip
  60:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  64:	7c020001 	stcvc	0, cr0, [r2], {1}
  68:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  6c:	00000014 	andeq	r0, r0, r4, lsl r0
  70:	0000005c 	andeq	r0, r0, ip, asr r0
  74:	00008170 	andeq	r8, r0, r0, ror r1
  78:	00000014 	andeq	r0, r0, r4, lsl r0
  7c:	8b040e42 	blhi	10398c <_stack+0x8398c>
  80:	0b0d4201 	bleq	35088c <_stack+0x2d088c>
  84:	0000001c 	andeq	r0, r0, ip, lsl r0
  88:	0000005c 	andeq	r0, r0, ip, asr r0
  8c:	00008184 	andeq	r8, r0, r4, lsl #3
  90:	00000024 	andeq	r0, r0, r4, lsr #32
  94:	8b040e42 	blhi	1039a4 <_stack+0x839a4>
  98:	0b0d4201 	bleq	3508a4 <_stack+0x2d08a4>
  9c:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
  a0:	00000ecb 	andeq	r0, r0, fp, asr #29
  a4:	0000001c 	andeq	r0, r0, ip, lsl r0
  a8:	0000005c 	andeq	r0, r0, ip, asr r0
  ac:	000081a8 	andeq	r8, r0, r8, lsr #3
  b0:	0000003c 	andeq	r0, r0, ip, lsr r0
  b4:	8b040e42 	blhi	1039c4 <_stack+0x839c4>
  b8:	0b0d4201 	bleq	3508c4 <_stack+0x2d08c4>
  bc:	420d0d56 	andmi	r0, sp, #5504	; 0x1580
  c0:	00000ecb 	andeq	r0, r0, fp, asr #29
  c4:	0000001c 	andeq	r0, r0, ip, lsl r0
  c8:	0000005c 	andeq	r0, r0, ip, asr r0
  cc:	000081e4 	andeq	r8, r0, r4, ror #3
  d0:	0000002c 	andeq	r0, r0, ip, lsr #32
  d4:	8b040e42 	blhi	1039e4 <_stack+0x839e4>
  d8:	0b0d4201 	bleq	3508e4 <_stack+0x2d08e4>
  dc:	420d0d4e 	andmi	r0, sp, #4992	; 0x1380
  e0:	00000ecb 	andeq	r0, r0, fp, asr #29
  e4:	0000001c 	andeq	r0, r0, ip, lsl r0
  e8:	0000005c 	andeq	r0, r0, ip, asr r0
  ec:	00008210 	andeq	r8, r0, r0, lsl r2
  f0:	00000034 	andeq	r0, r0, r4, lsr r0
  f4:	8b040e42 	blhi	103a04 <_stack+0x83a04>
  f8:	0b0d4201 	bleq	350904 <_stack+0x2d0904>
  fc:	420d0d52 	andmi	r0, sp, #5248	; 0x1480
 100:	00000ecb 	andeq	r0, r0, fp, asr #29
 104:	0000001c 	andeq	r0, r0, ip, lsl r0
 108:	0000005c 	andeq	r0, r0, ip, asr r0
 10c:	00008244 	andeq	r8, r0, r4, asr #4
 110:	0000001c 	andeq	r0, r0, ip, lsl r0
 114:	8b040e42 	blhi	103a24 <_stack+0x83a24>
 118:	0b0d4201 	bleq	350924 <_stack+0x2d0924>
 11c:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 120:	00000ecb 	andeq	r0, r0, fp, asr #29
 124:	0000001c 	andeq	r0, r0, ip, lsl r0
 128:	0000005c 	andeq	r0, r0, ip, asr r0
 12c:	00008260 	andeq	r8, r0, r0, ror #4
 130:	00000024 	andeq	r0, r0, r4, lsr #32
 134:	8b040e42 	blhi	103a44 <_stack+0x83a44>
 138:	0b0d4201 	bleq	350944 <_stack+0x2d0944>
 13c:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 140:	00000ecb 	andeq	r0, r0, fp, asr #29
 144:	0000001c 	andeq	r0, r0, ip, lsl r0
 148:	0000005c 	andeq	r0, r0, ip, asr r0
 14c:	00008284 	andeq	r8, r0, r4, lsl #5
 150:	00000038 	andeq	r0, r0, r8, lsr r0
 154:	8b040e42 	blhi	103a64 <_stack+0x83a64>
 158:	0b0d4201 	bleq	350964 <_stack+0x2d0964>
 15c:	420d0d54 	andmi	r0, sp, #84, 26	; 0x1500
 160:	00000ecb 	andeq	r0, r0, fp, asr #29
 164:	0000001c 	andeq	r0, r0, ip, lsl r0
 168:	0000005c 	andeq	r0, r0, ip, asr r0
 16c:	000082bc 			; <UNDEFINED> instruction: 0x000082bc
 170:	00000038 	andeq	r0, r0, r8, lsr r0
 174:	8b040e42 	blhi	103a84 <_stack+0x83a84>
 178:	0b0d4201 	bleq	350984 <_stack+0x2d0984>
 17c:	420d0d54 	andmi	r0, sp, #84, 26	; 0x1500
 180:	00000ecb 	andeq	r0, r0, fp, asr #29
 184:	0000001c 	andeq	r0, r0, ip, lsl r0
 188:	0000005c 	andeq	r0, r0, ip, asr r0
 18c:	000082f4 	strdeq	r8, [r0], -r4
 190:	0000002c 	andeq	r0, r0, ip, lsr #32
 194:	8b040e42 	blhi	103aa4 <_stack+0x83aa4>
 198:	0b0d4201 	bleq	3509a4 <_stack+0x2d09a4>
 19c:	420d0d4e 	andmi	r0, sp, #4992	; 0x1380
 1a0:	00000ecb 	andeq	r0, r0, fp, asr #29
 1a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1a8:	0000005c 	andeq	r0, r0, ip, asr r0
 1ac:	00008320 	andeq	r8, r0, r0, lsr #6
 1b0:	0000002c 	andeq	r0, r0, ip, lsr #32
 1b4:	8b040e42 	blhi	103ac4 <_stack+0x83ac4>
 1b8:	0b0d4201 	bleq	3509c4 <_stack+0x2d09c4>
 1bc:	420d0d4e 	andmi	r0, sp, #4992	; 0x1380
 1c0:	00000ecb 	andeq	r0, r0, fp, asr #29
 1c4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1c8:	0000005c 	andeq	r0, r0, ip, asr r0
 1cc:	0000834c 	andeq	r8, r0, ip, asr #6
 1d0:	0000002c 	andeq	r0, r0, ip, lsr #32
 1d4:	8b040e42 	blhi	103ae4 <_stack+0x83ae4>
 1d8:	0b0d4201 	bleq	3509e4 <_stack+0x2d09e4>
 1dc:	420d0d4e 	andmi	r0, sp, #4992	; 0x1380
 1e0:	00000ecb 	andeq	r0, r0, fp, asr #29
 1e4:	00000020 	andeq	r0, r0, r0, lsr #32
 1e8:	0000005c 	andeq	r0, r0, ip, asr r0
 1ec:	00008378 	andeq	r8, r0, r8, ror r3
 1f0:	000000a0 	andeq	r0, r0, r0, lsr #1
 1f4:	840c0e42 	strhi	r0, [ip], #-3650	; 0xfffff1be
 1f8:	8e028b03 	vmlahi.f64	d8, d2, d3
 1fc:	0b0c4201 	bleq	310a08 <_stack+0x290a08>
 200:	0c4a0204 	sfmeq	f0, 2, [sl], {4}
 204:	00000c0d 	andeq	r0, r0, sp, lsl #24
 208:	0000001c 	andeq	r0, r0, ip, lsl r0
 20c:	0000005c 	andeq	r0, r0, ip, asr r0
 210:	00008418 	andeq	r8, r0, r8, lsl r4
 214:	00000034 	andeq	r0, r0, r4, lsr r0
 218:	8b040e42 	blhi	103b28 <_stack+0x83b28>
 21c:	0b0d4201 	bleq	350a28 <_stack+0x2d0a28>
 220:	420d0d52 	andmi	r0, sp, #5248	; 0x1480
 224:	00000ecb 	andeq	r0, r0, fp, asr #29
 228:	0000001c 	andeq	r0, r0, ip, lsl r0
 22c:	0000005c 	andeq	r0, r0, ip, asr r0
 230:	0000844c 	andeq	r8, r0, ip, asr #8
 234:	00000024 	andeq	r0, r0, r4, lsr #32
 238:	8b040e42 	blhi	103b48 <_stack+0x83b48>
 23c:	0b0d4201 	bleq	350a48 <_stack+0x2d0a48>
 240:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 244:	00000ecb 	andeq	r0, r0, fp, asr #29
 248:	0000001c 	andeq	r0, r0, ip, lsl r0
 24c:	0000005c 	andeq	r0, r0, ip, asr r0
 250:	00008470 	andeq	r8, r0, r0, ror r4
 254:	00000034 	andeq	r0, r0, r4, lsr r0
 258:	8b040e42 	blhi	103b68 <_stack+0x83b68>
 25c:	0b0d4201 	bleq	350a68 <_stack+0x2d0a68>
 260:	420d0d52 	andmi	r0, sp, #5248	; 0x1480
 264:	00000ecb 	andeq	r0, r0, fp, asr #29
 268:	0000001c 	andeq	r0, r0, ip, lsl r0
 26c:	0000005c 	andeq	r0, r0, ip, asr r0
 270:	000084a4 	andeq	r8, r0, r4, lsr #9
 274:	00000034 	andeq	r0, r0, r4, lsr r0
 278:	8b040e42 	blhi	103b88 <_stack+0x83b88>
 27c:	0b0d4201 	bleq	350a88 <_stack+0x2d0a88>
 280:	420d0d52 	andmi	r0, sp, #5248	; 0x1480
 284:	00000ecb 	andeq	r0, r0, fp, asr #29
 288:	0000001c 	andeq	r0, r0, ip, lsl r0
 28c:	0000005c 	andeq	r0, r0, ip, asr r0
 290:	000084d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 294:	00000024 	andeq	r0, r0, r4, lsr #32
 298:	8b040e42 	blhi	103ba8 <_stack+0x83ba8>
 29c:	0b0d4201 	bleq	350aa8 <_stack+0x2d0aa8>
 2a0:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 2a4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2a8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2ac:	0000005c 	andeq	r0, r0, ip, asr r0
 2b0:	000084fc 	strdeq	r8, [r0], -ip
 2b4:	00000068 	andeq	r0, r0, r8, rrx
 2b8:	8b080e42 	blhi	203bc8 <_stack+0x183bc8>
 2bc:	42018e02 	andmi	r8, r1, #2, 28
 2c0:	6e040b0c 	vmlavs.f64	d0, d4, d12
 2c4:	00080d0c 	andeq	r0, r8, ip, lsl #26
 2c8:	0000000c 	andeq	r0, r0, ip
 2cc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2d0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2d4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2d8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2dc:	000002c8 	andeq	r0, r0, r8, asr #5
 2e0:	00008564 	andeq	r8, r0, r4, ror #10
 2e4:	00000024 	andeq	r0, r0, r4, lsr #32
 2e8:	8b040e42 	blhi	103bf8 <_stack+0x83bf8>
 2ec:	0b0d4201 	bleq	350af8 <_stack+0x2d0af8>
 2f0:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 2f4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2f8:	0000001c 	andeq	r0, r0, ip, lsl r0
 2fc:	000002c8 	andeq	r0, r0, r8, asr #5
 300:	00008588 	andeq	r8, r0, r8, lsl #11
 304:	00000018 	andeq	r0, r0, r8, lsl r0
 308:	8b040e42 	blhi	103c18 <_stack+0x83c18>
 30c:	0b0d4201 	bleq	350b18 <_stack+0x2d0b18>
 310:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 314:	00000ecb 	andeq	r0, r0, fp, asr #29
 318:	0000000c 	andeq	r0, r0, ip
 31c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 320:	7c020001 	stcvc	0, cr0, [r2], {1}
 324:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 328:	0000001c 	andeq	r0, r0, ip, lsl r0
 32c:	00000318 	andeq	r0, r0, r8, lsl r3
 330:	000085a0 	andeq	r8, r0, r0, lsr #11
 334:	00000024 	andeq	r0, r0, r4, lsr #32
 338:	8b040e42 	blhi	103c48 <_stack+0x83c48>
 33c:	0b0d4201 	bleq	350b48 <_stack+0x2d0b48>
 340:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 344:	00000ecb 	andeq	r0, r0, fp, asr #29
 348:	0000001c 	andeq	r0, r0, ip, lsl r0
 34c:	00000318 	andeq	r0, r0, r8, lsl r3
 350:	000085c4 	andeq	r8, r0, r4, asr #11
 354:	00000018 	andeq	r0, r0, r8, lsl r0
 358:	8b040e42 	blhi	103c68 <_stack+0x83c68>
 35c:	0b0d4201 	bleq	350b68 <_stack+0x2d0b68>
 360:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 364:	00000ecb 	andeq	r0, r0, fp, asr #29
 368:	0000000c 	andeq	r0, r0, ip
 36c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 370:	7c020001 	stcvc	0, cr0, [r2], {1}
 374:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 378:	0000001c 	andeq	r0, r0, ip, lsl r0
 37c:	00000368 	andeq	r0, r0, r8, ror #6
 380:	000085dc 	ldrdeq	r8, [r0], -ip
 384:	00000024 	andeq	r0, r0, r4, lsr #32
 388:	8b040e42 	blhi	103c98 <_stack+0x83c98>
 38c:	0b0d4201 	bleq	350b98 <_stack+0x2d0b98>
 390:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 394:	00000ecb 	andeq	r0, r0, fp, asr #29
 398:	0000001c 	andeq	r0, r0, ip, lsl r0
 39c:	00000368 	andeq	r0, r0, r8, ror #6
 3a0:	00008600 	andeq	r8, r0, r0, lsl #12
 3a4:	00000018 	andeq	r0, r0, r8, lsl r0
 3a8:	8b040e42 	blhi	103cb8 <_stack+0x83cb8>
 3ac:	0b0d4201 	bleq	350bb8 <_stack+0x2d0bb8>
 3b0:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 3b4:	00000ecb 	andeq	r0, r0, fp, asr #29
 3b8:	00000014 	andeq	r0, r0, r4, lsl r0
 3bc:	00000368 	andeq	r0, r0, r8, ror #6
 3c0:	00008618 	andeq	r8, r0, r8, lsl r6
 3c4:	0000000c 	andeq	r0, r0, ip
 3c8:	8b040e42 	blhi	103cd8 <_stack+0x83cd8>
 3cc:	0b0d4201 	bleq	350bd8 <_stack+0x2d0bd8>
 3d0:	00000014 	andeq	r0, r0, r4, lsl r0
 3d4:	00000368 	andeq	r0, r0, r8, ror #6
 3d8:	00008624 	andeq	r8, r0, r4, lsr #12
 3dc:	0000000c 	andeq	r0, r0, ip
 3e0:	8b040e42 	blhi	103cf0 <_stack+0x83cf0>
 3e4:	0b0d4201 	bleq	350bf0 <_stack+0x2d0bf0>
 3e8:	0000001c 	andeq	r0, r0, ip, lsl r0
 3ec:	00000368 	andeq	r0, r0, r8, ror #6
 3f0:	00008630 	andeq	r8, r0, r0, lsr r6
 3f4:	00000018 	andeq	r0, r0, r8, lsl r0
 3f8:	8b040e42 	blhi	103d08 <_stack+0x83d08>
 3fc:	0b0d4201 	bleq	350c08 <_stack+0x2d0c08>
 400:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 404:	00000ecb 	andeq	r0, r0, fp, asr #29
 408:	0000001c 	andeq	r0, r0, ip, lsl r0
 40c:	00000368 	andeq	r0, r0, r8, ror #6
 410:	00008648 	andeq	r8, r0, r8, asr #12
 414:	00000018 	andeq	r0, r0, r8, lsl r0
 418:	8b040e42 	blhi	103d28 <_stack+0x83d28>
 41c:	0b0d4201 	bleq	350c28 <_stack+0x2d0c28>
 420:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 424:	00000ecb 	andeq	r0, r0, fp, asr #29
 428:	00000028 	andeq	r0, r0, r8, lsr #32
 42c:	00000368 	andeq	r0, r0, r8, ror #6
 430:	00008660 	andeq	r8, r0, r0, ror #12
 434:	00000080 	andeq	r0, r0, r0, lsl #1
 438:	80200e44 	eorhi	r0, r0, r4, asr #28
 43c:	82078108 	andhi	r8, r7, #8, 2
 440:	84058306 	strhi	r8, [r5], #-774	; 0xfffffcfa
 444:	8c038b04 			; <UNDEFINED> instruction: 0x8c038b04
 448:	42018e02 	andmi	r8, r1, #2, 28
 44c:	78040b0c 	stmdavc	r4, {r2, r3, r8, r9, fp}
 450:	00200d0c 	eoreq	r0, r0, ip, lsl #26
 454:	00000014 	andeq	r0, r0, r4, lsl r0
 458:	00000368 	andeq	r0, r0, r8, ror #6
 45c:	000086e0 	andeq	r8, r0, r0, ror #13
 460:	00000010 	andeq	r0, r0, r0, lsl r0
 464:	040b0c42 	streq	r0, [fp], #-3138	; 0xfffff3be
 468:	000d0c44 	andeq	r0, sp, r4, asr #24
 46c:	0000000c 	andeq	r0, r0, ip
 470:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 474:	7c020001 	stcvc	0, cr0, [r2], {1}
 478:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 47c:	0000001c 	andeq	r0, r0, ip, lsl r0
 480:	0000046c 	andeq	r0, r0, ip, ror #8
 484:	000086f0 	strdeq	r8, [r0], -r0
 488:	00000024 	andeq	r0, r0, r4, lsr #32
 48c:	8b040e42 	blhi	103d9c <_stack+0x83d9c>
 490:	0b0d4201 	bleq	350c9c <_stack+0x2d0c9c>
 494:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 498:	00000ecb 	andeq	r0, r0, fp, asr #29
 49c:	0000001c 	andeq	r0, r0, ip, lsl r0
 4a0:	0000046c 	andeq	r0, r0, ip, ror #8
 4a4:	00008714 	andeq	r8, r0, r4, lsl r7
 4a8:	0000005c 	andeq	r0, r0, ip, asr r0
 4ac:	8b040e42 	blhi	103dbc <_stack+0x83dbc>
 4b0:	0b0d4201 	bleq	350cbc <_stack+0x2d0cbc>
 4b4:	420d0d66 	andmi	r0, sp, #6528	; 0x1980
 4b8:	00000ecb 	andeq	r0, r0, fp, asr #29
 4bc:	0000000c 	andeq	r0, r0, ip
 4c0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 4c4:	7c020001 	stcvc	0, cr0, [r2], {1}
 4c8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 4cc:	00000028 	andeq	r0, r0, r8, lsr #32
 4d0:	000004bc 			; <UNDEFINED> instruction: 0x000004bc
 4d4:	00008770 	andeq	r8, r0, r0, ror r7
 4d8:	00000026 	andeq	r0, r0, r6, lsr #32
 4dc:	83100e41 	tsthi	r0, #1040	; 0x410
 4e0:	85038404 	strhi	r8, [r3, #-1028]	; 0xfffffbfc
 4e4:	48018e02 	stmdami	r1, {r1, r9, sl, fp, pc}
 4e8:	c4c5ce0a 	strbgt	ip, [r5], #3594	; 0xe0a
 4ec:	42000ec3 	andmi	r0, r0, #3120	; 0xc30
 4f0:	c5ce460b 	strbgt	r4, [lr, #1547]	; 0x60b
 4f4:	000ec3c4 	andeq	ip, lr, r4, asr #7
 4f8:	00000028 	andeq	r0, r0, r8, lsr #32
 4fc:	000004bc 			; <UNDEFINED> instruction: 0x000004bc
 500:	00008798 	muleq	r0, r8, r7
 504:	00000088 	andeq	r0, r0, r8, lsl #1
 508:	84100e49 	ldrhi	r0, [r0], #-3657	; 0xfffff1b7
 50c:	86038504 	strhi	r8, [r3], -r4, lsl #10
 510:	77018e02 	strvc	r8, [r1, -r2, lsl #28]
 514:	c5c6ce0a 	strbgt	ip, [r6, #3594]	; 0xe0a
 518:	42000ec4 	andmi	r0, r0, #196, 28	; 0xc40
 51c:	000e410b 	andeq	r4, lr, fp, lsl #2
 520:	cec6c5c4 	cdpgt	5, 12, cr12, cr6, cr4, {6}
 524:	0000000c 	andeq	r0, r0, ip
 528:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 52c:	7c020001 	stcvc	0, cr0, [r2], {1}
 530:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 534:	0000001c 	andeq	r0, r0, ip, lsl r0
 538:	00000524 	andeq	r0, r0, r4, lsr #10
 53c:	00008820 	andeq	r8, r0, r0, lsr #16
 540:	000000aa 	andeq	r0, r0, sl, lsr #1
 544:	83180e41 	tsthi	r8, #1040	; 0x410
 548:	85058406 	strhi	r8, [r5, #-1030]	; 0xfffffbfa
 54c:	87038604 	strhi	r8, [r3, -r4, lsl #12]
 550:	00018e02 	andeq	r8, r1, r2, lsl #28
 554:	0000004c 	andeq	r0, r0, ip, asr #32
 558:	00000524 	andeq	r0, r0, r4, lsr #10
 55c:	000088cc 	andeq	r8, r0, ip, asr #17
 560:	000001ec 	andeq	r0, r0, ip, ror #3
 564:	83180e43 	tsthi	r8, #1072	; 0x430
 568:	85058406 	strhi	r8, [r5, #-1030]	; 0xfffffbfa
 56c:	87038604 	strhi	r8, [r3, -r4, lsl #12]
 570:	02018e02 	andeq	r8, r1, #2, 28
 574:	c6c7ce53 			; <UNDEFINED> instruction: 0xc6c7ce53
 578:	0ec3c4c5 	cdpeq	4, 12, cr12, cr3, cr5, {6}
 57c:	180e4300 	stmdane	lr, {r8, r9, lr}
 580:	05840683 	streq	r0, [r4, #1667]	; 0x683
 584:	03860485 	orreq	r0, r6, #-2063597568	; 0x85000000
 588:	018e0287 	orreq	r0, lr, r7, lsl #5
 58c:	c7ce0a74 			; <UNDEFINED> instruction: 0xc7ce0a74
 590:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 594:	0b42000e 	bleq	10805d4 <_stack+0x10005d4>
 598:	c7ce0a55 			; <UNDEFINED> instruction: 0xc7ce0a55
 59c:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 5a0:	0b42000e 	bleq	10805e0 <_stack+0x10005e0>
 5a4:	0000000c 	andeq	r0, r0, ip
 5a8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 5ac:	7c020001 	stcvc	0, cr0, [r2], {1}
 5b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 5b4:	0000004c 	andeq	r0, r0, ip, asr #32
 5b8:	000005a4 	andeq	r0, r0, r4, lsr #11
 5bc:	00008ab8 			; <UNDEFINED> instruction: 0x00008ab8
 5c0:	00000580 	andeq	r0, r0, r0, lsl #11
 5c4:	84240e42 	strthi	r0, [r4], #-3650	; 0xfffff1be
 5c8:	86088509 	strhi	r8, [r8], -r9, lsl #10
 5cc:	88068707 	stmdahi	r6, {r0, r1, r2, r8, r9, sl, pc}
 5d0:	8a048905 	bhi	1229ec <_stack+0xa29ec>
 5d4:	8e028b03 	vmlahi.f64	d8, d2, d3
 5d8:	300e4401 	andcc	r4, lr, r1, lsl #8
 5dc:	240e0a68 	strcs	r0, [lr], #-2664	; 0xfffff598
 5e0:	68030b42 	stmdavs	r3, {r1, r6, r8, r9, fp}
 5e4:	240e0a01 	strcs	r0, [lr], #-2561	; 0xfffff5ff
 5e8:	0a4c0b42 	beq	13032f8 <_stack+0x12832f8>
 5ec:	0b42240e 	bleq	108962c <_stack+0x100962c>
 5f0:	240e0a50 	strcs	r0, [lr], #-2640	; 0xfffff5b0
 5f4:	0a4e0b42 	beq	1383304 <_stack+0x1303304>
 5f8:	0b42240e 	bleq	1089638 <_stack+0x1009638>
 5fc:	240e0a5c 	strcs	r0, [lr], #-2652	; 0xfffff5a4
 600:	00000b42 	andeq	r0, r0, r2, asr #22
 604:	0000000c 	andeq	r0, r0, ip
 608:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 60c:	7c020001 	stcvc	0, cr0, [r2], {1}
 610:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 614:	0000000c 	andeq	r0, r0, ip
 618:	00000604 	andeq	r0, r0, r4, lsl #12
 61c:	00009038 	andeq	r9, r0, r8, lsr r0
 620:	0000000c 	andeq	r0, r0, ip
 624:	0000000c 	andeq	r0, r0, ip
 628:	00000604 	andeq	r0, r0, r4, lsl #12
 62c:	00009044 	andeq	r9, r0, r4, asr #32
 630:	0000000c 	andeq	r0, r0, ip
 634:	0000000c 	andeq	r0, r0, ip
 638:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 63c:	7c020001 	stcvc	0, cr0, [r2], {1}
 640:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 644:	00000018 	andeq	r0, r0, r8, lsl r0
 648:	00000634 	andeq	r0, r0, r4, lsr r6
 64c:	00009050 	andeq	r9, r0, r0, asr r0
 650:	00000026 	andeq	r0, r0, r6, lsr #32
 654:	83100e41 	tsthi	r0, #1040	; 0x410
 658:	85038404 	strhi	r8, [r3, #-1028]	; 0xfffffbfc
 65c:	00018e02 	andeq	r8, r1, r2, lsl #28
 660:	0000000c 	andeq	r0, r0, ip
 664:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 668:	7c020001 	stcvc	0, cr0, [r2], {1}
 66c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 670:	0000000c 	andeq	r0, r0, ip
 674:	00000660 	andeq	r0, r0, r0, ror #12
 678:	00009078 	andeq	r9, r0, r8, ror r0
 67c:	00000002 	andeq	r0, r0, r2
 680:	0000000c 	andeq	r0, r0, ip
 684:	00000660 	andeq	r0, r0, r0, ror #12
 688:	0000907c 	andeq	r9, r0, ip, ror r0
 68c:	00000002 	andeq	r0, r0, r2
 690:	0000000c 	andeq	r0, r0, ip
 694:	00000660 	andeq	r0, r0, r0, ror #12
 698:	00009080 	andeq	r9, r0, r0, lsl #1
 69c:	00000002 	andeq	r0, r0, r2
 6a0:	0000000c 	andeq	r0, r0, ip
 6a4:	00000660 	andeq	r0, r0, r0, ror #12
 6a8:	00009084 	andeq	r9, r0, r4, lsl #1
 6ac:	00000002 	andeq	r0, r0, r2
 6b0:	0000000c 	andeq	r0, r0, ip
 6b4:	00000660 	andeq	r0, r0, r0, ror #12
 6b8:	00009088 	andeq	r9, r0, r8, lsl #1
 6bc:	00000002 	andeq	r0, r0, r2
 6c0:	0000000c 	andeq	r0, r0, ip
 6c4:	00000660 	andeq	r0, r0, r0, ror #12
 6c8:	0000908c 	andeq	r9, r0, ip, lsl #1
 6cc:	00000002 	andeq	r0, r0, r2
 6d0:	0000000c 	andeq	r0, r0, ip
 6d4:	00000660 	andeq	r0, r0, r0, ror #12
 6d8:	00009090 	muleq	r0, r0, r0
 6dc:	00000004 	andeq	r0, r0, r4
 6e0:	0000000c 	andeq	r0, r0, ip
 6e4:	00000660 	andeq	r0, r0, r0, ror #12
 6e8:	00009094 	muleq	r0, r4, r0
 6ec:	00000004 	andeq	r0, r0, r4
 6f0:	0000000c 	andeq	r0, r0, ip
 6f4:	00000660 	andeq	r0, r0, r0, ror #12
 6f8:	00009098 	muleq	r0, r8, r0
 6fc:	00000002 	andeq	r0, r0, r2
 700:	0000000c 	andeq	r0, r0, ip
 704:	00000660 	andeq	r0, r0, r0, ror #12
 708:	0000909c 	muleq	r0, ip, r0
 70c:	00000002 	andeq	r0, r0, r2

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6f73645f 	svcvs	0x0073645f
   4:	6e61685f 	mcrvs	8, 3, r6, cr1, cr15, {2}
   8:	00656c64 	rsbeq	r6, r5, r4, ror #24
   c:	6e61725f 	mcrvs	2, 3, r7, cr1, cr15, {2}
  10:	00383464 	eorseq	r3, r8, r4, ror #8
  14:	656d655f 	strbvs	r6, [sp, #-1375]!	; 0xfffffaa1
  18:	6e656772 	mcrvs	7, 3, r6, cr5, cr2, {3}
  1c:	5f007963 	svcpl	0x00007963
  20:	61746164 	cmnvs	r4, r4, ror #2
  24:	63775f00 	cmnvs	r7, #0, 30
  28:	6d6f7472 	cfstrdvs	mvd7, [pc, #-456]!	; fffffe68 <_stack+0xfff7fe68>
  2c:	74735f62 	ldrbtvc	r5, [r3], #-3938	; 0xfffff09e
  30:	00657461 	rsbeq	r7, r5, r1, ror #8
  34:	7363775f 	cmnvc	r3, #24903680	; 0x17c0000
  38:	6d6f7472 	cfstrdvs	mvd7, [pc, #-456]!	; fffffe78 <_stack+0xfff7fe78>
  3c:	735f7362 	cmpvc	pc, #-2013265919	; 0x88000001
  40:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
  44:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
  48:	6f6c2067 	svcvs	0x006c2067
  4c:	7520676e 	strvc	r6, [r0, #-1902]!	; 0xfffff892
  50:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
  54:	2064656e 	rsbcs	r6, r4, lr, ror #10
  58:	00746e69 	rsbseq	r6, r4, r9, ror #28
  5c:	66626c5f 			; <UNDEFINED> instruction: 0x66626c5f
  60:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
  64:	6c5f5f00 	mrrcvs	15, 0, r5, pc, cr0	; <UNPREDICTABLE>
  68:	6c61636f 	stclvs	3, cr6, [r1], #-444	; 0xfffffe44
  6c:	00745f65 	rsbseq	r5, r4, r5, ror #30
  70:	72626d5f 	rsbvc	r6, r2, #6080	; 0x17c0
  74:	63776f74 	cmnvs	r7, #116, 30	; 0x1d0
  78:	6174735f 	cmnvs	r4, pc, asr r3
  7c:	5f006574 	svcpl	0x00006574
  80:	5f6d745f 	svcpl	0x006d745f
  84:	00636573 	rsbeq	r6, r3, r3, ror r5
  88:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
  8c:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
  90:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
  94:	755f0074 	ldrbvc	r0, [pc, #-116]	; 28 <CPSR_THUMB+0x8>
  98:	00667562 	rsbeq	r7, r6, r2, ror #10
  9c:	7361625f 	cmnvc	r1, #-268435451	; 0xf0000005
  a0:	5f5f0065 	svcpl	0x005f0065
  a4:	685f6d74 	ldmdavs	pc, {r2, r4, r5, r6, r8, sl, fp, sp, lr}^	; <UNPREDICTABLE>
  a8:	0072756f 	rsbseq	r7, r2, pc, ror #10
  ac:	66735f5f 	uhsaxvs	r5, r3, pc	; <UNPREDICTABLE>
  b0:	6e6f5f00 	cdpvs	15, 6, cr5, cr15, cr0, {0}
  b4:	6978655f 	ldmdbvs	r8!, {r0, r1, r2, r3, r4, r6, r8, sl, sp, lr}^
  b8:	72615f74 	rsbvc	r5, r1, #116, 30	; 0x1d0
  bc:	5f007367 	svcpl	0x00007367
  c0:	6b6f6f63 	blvs	1bdbe54 <_stack+0x1b5be54>
  c4:	5f006569 	svcpl	0x00006569
  c8:	6c67735f 	stclvs	3, cr7, [r7], #-380	; 0xfffffe84
  cc:	5f006575 	svcpl	0x00006575
  d0:	67616c66 	strbvs	r6, [r1, -r6, ror #24]!
  d4:	695f0073 	ldmdbvs	pc, {r0, r1, r4, r5, r6}^	; <UNPREDICTABLE>
  d8:	78635f73 	stmdavc	r3!, {r0, r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
  dc:	735f0061 	cmpvc	pc, #97	; 0x61
  e0:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  e4:	76635f00 	strbtvc	r5, [r3], -r0, lsl #30
  e8:	66756274 			; <UNDEFINED> instruction: 0x66756274
  ec:	666f5f00 	strbtvs	r5, [pc], -r0, lsl #30
  f0:	74657366 	strbtvc	r7, [r5], #-870	; 0xfffffc9a
  f4:	626d5f00 	rsbvs	r5, sp, #0, 30
  f8:	6f747273 	svcvs	0x00747273
  fc:	5f736377 	svcpl	0x00736377
 100:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 104:	6d5f0065 	ldclvs	0, cr0, [pc, #-404]	; ffffff78 <_stack+0xfff7ff78>
 108:	656c7262 	strbvs	r7, [ip, #-610]!	; 0xfffffd9e
 10c:	74735f6e 	ldrbtvc	r5, [r3], #-3950	; 0xfffff092
 110:	00657461 	rsbeq	r7, r5, r1, ror #8
 114:	616e665f 	cmnvs	lr, pc, asr r6
 118:	00736772 	rsbseq	r6, r3, r2, ror r7
 11c:	736e665f 	cmnvc	lr, #99614720	; 0x5f00000
 120:	72656b00 	rsbvc	r6, r5, #0, 22
 124:	5f6c656e 	svcpl	0x006c656e
 128:	6e69616d 	powvsez	f6, f1, #5.0
 12c:	69735f00 	ldmdbvs	r3!, {r8, r9, sl, fp, ip, lr}^
 130:	5f006e67 	svcpl	0x00006e67
 134:	636f6c66 	cmnvs	pc, #26112	; 0x6600
 138:	00745f6b 	rsbseq	r5, r4, fp, ror #30
 13c:	6474735f 	ldrbtvs	r7, [r4], #-863	; 0xfffffca1
 140:	00727265 	rsbseq	r7, r2, r5, ror #4
 144:	6769425f 			; <UNDEFINED> instruction: 0x6769425f
 148:	00746e69 	rsbseq	r6, r4, r9, ror #28
 14c:	6d61675f 	stclvs	7, cr6, [r1, #-380]!	; 0xfffffe84
 150:	735f616d 	cmpvc	pc, #1073741851	; 0x4000001b
 154:	676e6769 	strbvs	r6, [lr, -r9, ror #14]!
 158:	5f006d61 	svcpl	0x00006d61
 15c:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
 160:	65725f00 	ldrbvs	r5, [r2, #-3840]!	; 0xfffff100
 164:	746c7573 	strbtvc	r7, [ip], #-1395	; 0xfffffa8d
 168:	5f006b5f 	svcpl	0x00006b5f
 16c:	006d745f 	rsbeq	r7, sp, pc, asr r4
 170:	63775f5f 	cmnvs	r7, #380	; 0x17c
 174:	5f006268 	svcpl	0x00006268
 178:	6f647473 	svcvs	0x00647473
 17c:	5f007475 	svcpl	0x00007475
 180:	6c747663 	ldclvs	6, cr7, [r4], #-396	; 0xfffffe74
 184:	5f006e65 	svcpl	0x00006e65
 188:	656c6966 	strbvs	r6, [ip, #-2406]!	; 0xfffff69a
 18c:	696e5f00 	stmdbvs	lr!, {r8, r9, sl, fp, ip, lr}^
 190:	0073626f 	rsbseq	r6, r3, pc, ror #4
 194:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
 198:	6e752074 	mrcvs	0, 3, r2, cr5, cr4, {3}
 19c:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
 1a0:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
 1a4:	5f00746e 	svcpl	0x0000746e
 1a8:	78657461 	stmdavc	r5!, {r0, r5, r6, sl, ip, sp, lr}^
 1ac:	00307469 	eorseq	r7, r0, r9, ror #8
 1b0:	67617461 	strbvs	r7, [r1, -r1, ror #8]!
 1b4:	735f0073 	cmpvc	pc, #115	; 0x73
 1b8:	616e6769 	cmnvs	lr, r9, ror #14
 1bc:	75625f6c 	strbvc	r5, [r2, #-3948]!	; 0xfffff094
 1c0:	615f0066 	cmpvs	pc, r6, rrx
 1c4:	69746373 	ldmdbvs	r4!, {r0, r1, r4, r5, r6, r8, r9, sp, lr}^
 1c8:	625f656d 	subsvs	r6, pc, #457179136	; 0x1b400000
 1cc:	5f006675 	svcpl	0x00006675
 1d0:	75736572 	ldrbvc	r6, [r3, #-1394]!	; 0xfffffa8e
 1d4:	5f00746c 	svcpl	0x0000746c
 1d8:	6863775f 	stmdavs	r3!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
 1dc:	4f4c5f00 	svcmi	0x004c5f00
 1e0:	545f4b43 	ldrbpl	r4, [pc], #-2883	; 1e8 <CPSR_IRQ_INHIBIT+0x168>
 1e4:	6e697700 	cdpvs	7, 6, cr7, cr9, cr0, {0}
 1e8:	00745f74 	rsbseq	r5, r4, r4, ror pc
 1ec:	616c665f 	cmnvs	ip, pc, asr r6
 1f0:	00327367 	eorseq	r7, r2, r7, ror #6
 1f4:	6972775f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, sp, lr}^
 1f8:	5f006574 	svcpl	0x00006574
 1fc:	5f6d745f 	svcpl	0x006d745f
 200:	72616579 	rsbvc	r6, r1, #507510784	; 0x1e400000
 204:	554e4700 	strbpl	r4, [lr, #-1792]	; 0xfffff900
 208:	31314320 	teqcc	r1, r0, lsr #6
 20c:	332e3720 			; <UNDEFINED> instruction: 0x332e3720
 210:	3220312e 	eorcc	r3, r0, #-2147483637	; 0x8000000b
 214:	30383130 	eorscc	r3, r8, r0, lsr r1
 218:	20323236 	eorscs	r3, r2, r6, lsr r2
 21c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
 220:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0xfffffe9b
 224:	415b2029 	cmpmi	fp, r9, lsr #32
 228:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff4de <_stack+0xfff7f4de>
 22c:	6465626d 	strbtvs	r6, [r5], #-621	; 0xfffffd93
 230:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
 234:	72622d37 	rsbvc	r2, r2, #3520	; 0xdc0
 238:	68636e61 	stmdavs	r3!, {r0, r5, r6, r9, sl, fp, sp, lr}^
 23c:	76657220 	strbtvc	r7, [r5], -r0, lsr #4
 240:	6f697369 	svcvs	0x00697369
 244:	3632206e 	ldrtcc	r2, [r2], -lr, rrx
 248:	37303931 			; <UNDEFINED> instruction: 0x37303931
 24c:	6d2d205d 	stcvs	0, cr2, [sp, #-372]!	; 0xfffffe8c
 250:	3d757066 	ldclcc	0, cr7, [r5, #-408]!	; 0xfffffe68
 254:	6e6f656e 	cdpvs	5, 6, cr6, cr15, cr14, {3}
 258:	7066762d 	rsbvc	r7, r6, sp, lsr #12
 25c:	2d203476 	cfstrscs	mvf3, [r0, #-472]!	; 0xfffffe28
 260:	6f6c666d 	svcvs	0x006c666d
 264:	612d7461 			; <UNDEFINED> instruction: 0x612d7461
 268:	683d6962 	ldmdavs	sp!, {r1, r5, r6, r8, fp, sp, lr}
 26c:	20647261 	rsbcs	r7, r4, r1, ror #4
 270:	72616d2d 	rsbvc	r6, r1, #2880	; 0xb40
 274:	613d6863 	teqvs	sp, r3, ror #16
 278:	37766d72 			; <UNDEFINED> instruction: 0x37766d72
 27c:	2d20612d 	stfcss	f6, [r0, #-180]!	; 0xffffff4c
 280:	6e75746d 	cdpvs	4, 7, cr7, cr5, cr13, {3}
 284:	6f633d65 	svcvs	0x00633d65
 288:	78657472 	stmdavc	r5!, {r1, r4, r5, r6, sl, ip, sp, lr}^
 28c:	2037612d 	eorscs	r6, r7, sp, lsr #2
 290:	70666d2d 	rsbvc	r6, r6, sp, lsr #26
 294:	656e3d75 	strbvs	r3, [lr, #-3445]!	; 0xfffff28b
 298:	762d6e6f 	strtvc	r6, [sp], -pc, ror #28
 29c:	34767066 	ldrbtcc	r7, [r6], #-102	; 0xffffff9a
 2a0:	666d2d20 	strbtvs	r2, [sp], -r0, lsr #26
 2a4:	74616f6c 	strbtvc	r6, [r1], #-3948	; 0xfffff094
 2a8:	6962612d 	stmdbvs	r2!, {r0, r2, r3, r5, r8, sp, lr}^
 2ac:	7261683d 	rsbvc	r6, r1, #3997696	; 0x3d0000
 2b0:	6d2d2064 	stcvs	0, cr2, [sp, #-400]!	; 0xfffffe70
 2b4:	68637261 	stmdavs	r3!, {r0, r5, r6, r9, ip, sp, lr}^
 2b8:	6d72613d 	ldfvse	f6, [r2, #-244]!	; 0xffffff0c
 2bc:	612d3776 			; <UNDEFINED> instruction: 0x612d3776
 2c0:	746d2d20 	strbtvc	r2, [sp], #-3360	; 0xfffff2e0
 2c4:	3d656e75 	stclcc	14, cr6, [r5, #-468]!	; 0xfffffe2c
 2c8:	74726f63 	ldrbtvc	r6, [r2], #-3939	; 0xfffff09d
 2cc:	612d7865 			; <UNDEFINED> instruction: 0x612d7865
 2d0:	672d2037 			; <UNDEFINED> instruction: 0x672d2037
 2d4:	304f2d20 	subcc	r2, pc, r0, lsr #26
 2d8:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
 2dc:	6f642067 	svcvs	0x00642067
 2e0:	656c6275 	strbvs	r6, [ip, #-629]!	; 0xfffffd8b
 2e4:	656e5f00 	strbvs	r5, [lr, #-3840]!	; 0xfffff100
 2e8:	00667478 	rsbeq	r7, r6, r8, ror r4
 2ec:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
 2f0:	6e6f6d5f 	mcrvs	13, 3, r6, cr15, cr15, {2}
 2f4:	74615f00 	strbtvc	r5, [r1], #-3840	; 0xfffff100
 2f8:	74697865 	strbtvc	r7, [r9], #-2149	; 0xfffff79b
 2fc:	62757300 	rsbsvs	r7, r5, #0, 6
 300:	6174706f 	cmnvs	r4, pc, rrx
 304:	5f006772 	svcpl	0x00006772
 308:	6964735f 	stmdbvs	r4!, {r0, r1, r2, r3, r4, r6, r8, r9, ip, sp, lr}^
 30c:	696e6964 	stmdbvs	lr!, {r2, r5, r6, r8, fp, sp, lr}^
 310:	6d2f0074 	stcvs	0, cr0, [pc, #-464]!	; 148 <CPSR_IRQ_INHIBIT+0xc8>
 314:	642f746e 	strtvs	r7, [pc], #-1134	; 31c <CPSR_IRQ_INHIBIT+0x29c>
 318:	696e752f 	stmdbvs	lr!, {r0, r1, r2, r3, r5, r8, sl, ip, sp, lr}^
 31c:	3130322f 	teqcc	r0, pc, lsr #4
 320:	30322d39 	eorscc	r2, r2, r9, lsr sp
 324:	432f3032 			; <UNDEFINED> instruction: 0x432f3032
 328:	442f4854 	strtmi	r4, [pc], #-2132	; 330 <CPSR_IRQ_INHIBIT+0x2b0>
 32c:	74696769 	strbtvc	r6, [r9], #-1897	; 0xfffff897
 330:	705f6c61 	subsvc	r6, pc, r1, ror #24
 334:	656a6f72 	strbvs	r6, [sl, #-3954]!	; 0xfffff08e
 338:	6c5f7463 	cfldrdvs	mvd7, [pc], {99}	; 0x63
 33c:	726f6261 	rsbvc	r6, pc, #268435462	; 0x10000006
 340:	726f7461 	rsbvc	r7, pc, #1627389952	; 0x61000000
 344:	636d2f79 	cmnvs	sp, #484	; 0x1e4
 348:	61702f75 	cmnvs	r0, r5, ror pc
 34c:	342d7472 	strtcc	r7, [sp], #-1138	; 0xfffffb8e
 350:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 354:	31302d63 	teqcc	r0, r3, ror #26
 358:	72612f33 	rsbvc	r2, r1, #51, 30	; 0xcc
 35c:	302d636d 	eorcc	r6, sp, sp, ror #6
 360:	632e3331 			; <UNDEFINED> instruction: 0x632e3331
 364:	63775f00 	cmnvs	r7, #0, 30
 368:	626d6f74 	rsbvs	r6, sp, #116, 30	; 0x1d0
 36c:	6174735f 	cmnvs	r4, pc, asr r3
 370:	5f006574 	svcpl	0x00006574
 374:	656c626d 	strbvs	r6, [ip, #-621]!	; 0xfffffd93
 378:	74735f6e 	ldrbtvc	r5, [r3], #-3950	; 0xfffff092
 37c:	00657461 	rsbeq	r7, r5, r1, ror #8
 380:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xfffff2d1
 384:	752f642f 	strvc	r6, [pc, #-1071]!	; ffffff5d <_stack+0xfff7ff5d>
 388:	322f696e 	eorcc	r6, pc, #1802240	; 0x1b8000
 38c:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
 390:	30323032 	eorscc	r3, r2, r2, lsr r0
 394:	4854432f 	ldmdami	r4, {r0, r1, r2, r3, r5, r8, r9, lr}^
 398:	6769442f 	strbvs	r4, [r9, -pc, lsr #8]!
 39c:	6c617469 	cfstrdvs	mvd7, [r1], #-420	; 0xfffffe5c
 3a0:	6f72705f 	svcvs	0x0072705f
 3a4:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
 3a8:	62616c5f 	rsbvs	r6, r1, #24320	; 0x5f00
 3ac:	7461726f 	strbtvc	r7, [r1], #-623	; 0xfffffd91
 3b0:	2f79726f 	svccs	0x0079726f
 3b4:	2f75636d 	svccs	0x0075636d
 3b8:	74726170 	ldrbtvc	r6, [r2], #-368	; 0xfffffe90
 3bc:	612f342d 			; <UNDEFINED> instruction: 0x612f342d
 3c0:	2d636d72 	stclcs	13, cr6, [r3, #-456]!	; 0xfffffe38
 3c4:	2f333130 	svccs	0x00333130
 3c8:	6c697562 	cfstr64vs	mvdx7, [r9], #-392	; 0xfffffe78
 3cc:	6e750064 	cdpvs	0, 7, cr0, cr5, cr4, {3}
 3d0:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
 3d4:	63206465 			; <UNDEFINED> instruction: 0x63206465
 3d8:	00726168 	rsbseq	r6, r2, r8, ror #2
 3dc:	77656e5f 			; <UNDEFINED> instruction: 0x77656e5f
 3e0:	5f685f00 	svcpl	0x00685f00
 3e4:	6e727265 	cdpvs	2, 7, cr7, cr2, cr5, {3}
 3e8:	6873006f 	ldmdavs	r3!, {r0, r1, r2, r3, r5, r6}^
 3ec:	2074726f 	rsbscs	r7, r4, pc, ror #4
 3f0:	00746e69 	rsbseq	r6, r4, r9, ror #28
 3f4:	6d745f5f 	ldclvs	15, cr5, [r4, #-380]!	; 0xfffffe84
 3f8:	6164795f 	cmnvs	r4, pc, asr r9
 3fc:	5f5f0079 	svcpl	0x005f0079
 400:	66756273 			; <UNDEFINED> instruction: 0x66756273
 404:	72665f00 	rsbvc	r5, r6, #0, 30
 408:	696c6565 	stmdbvs	ip!, {r0, r2, r5, r6, r8, sl, sp, lr}^
 40c:	5f007473 	svcpl	0x00007473
 410:	4c49465f 	mcrrmi	6, 5, r4, r9, cr15
 414:	6d5f0045 	ldclvs	0, cr0, [pc, #-276]	; 308 <CPSR_IRQ_INHIBIT+0x288>
 418:	61747362 	cmnvs	r4, r2, ror #6
 41c:	745f6574 	ldrbvc	r6, [pc], #-1396	; 424 <CPSR_IRQ_INHIBIT+0x3a4>
 420:	735f5f00 	cmpvc	pc, #0, 30
 424:	454c4946 	strbmi	r4, [ip, #-2374]	; 0xfffff6ba
 428:	626d5f00 	rsbvs	r5, sp, #0, 30
 42c:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 430:	725f0065 	subsvc	r0, pc, #101	; 0x65
 434:	5f646e61 	svcpl	0x00646e61
 438:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0xfffffa92
 43c:	6f695f00 	svcvs	0x00695f00
 440:	5f007362 	svcpl	0x00007362
 444:	00636e69 	rsbeq	r6, r3, r9, ror #28
 448:	646e695f 	strbtvs	r6, [lr], #-2399	; 0xfffff6a1
 44c:	6f6c5f00 	svcvs	0x006c5f00
 450:	656c6163 	strbvs	r6, [ip, #-355]!	; 0xfffffe9d
 454:	635f5f00 	cmpvs	pc, #0, 30
 458:	6e61656c 	cdpvs	5, 6, cr6, cr1, cr12, {3}
 45c:	5f007075 	svcpl	0x00007075
 460:	70736e75 	rsbsvc	r6, r3, r5, ror lr
 464:	66696365 	strbtvs	r6, [r9], -r5, ror #6
 468:	5f646569 	svcpl	0x00646569
 46c:	61636f6c 	cmnvs	r3, ip, ror #30
 470:	695f656c 	ldmdbvs	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 474:	006f666e 	rsbeq	r6, pc, lr, ror #12
 478:	78616d5f 	stmdavc	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
 47c:	00736477 	rsbseq	r6, r3, r7, ror r4
 480:	6565725f 	strbvs	r7, [r5, #-607]!	; 0xfffffda1
 484:	5f00746e 	svcpl	0x0000746e
 488:	64656573 	strbtvs	r6, [r5], #-1395	; 0xfffffa8d
 48c:	635f5f00 	cmpvs	pc, #0, 30
 490:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
 494:	6c5f5f00 	mrrcvs	15, 0, r5, pc, cr0	; <UNPREDICTABLE>
 498:	006b636f 	rsbeq	r6, fp, pc, ror #6
 49c:	61765f5f 	cmnvs	r6, pc, asr pc
 4a0:	0065756c 	rsbeq	r7, r5, ip, ror #10
 4a4:	6565735f 	strbvs	r7, [r5, #-863]!	; 0xfffffca1
 4a8:	665f006b 	ldrbvs	r0, [pc], -fp, rrx
 4ac:	5f736f70 	svcpl	0x00736f70
 4b0:	5f5f0074 	svcpl	0x005f0074
 4b4:	6d5f6d74 	ldclvs	13, cr6, [pc, #-464]	; 2ec <CPSR_IRQ_INHIBIT+0x26c>
 4b8:	5f006e69 	svcpl	0x00006e69
 4bc:	746c756d 	strbtvc	r7, [ip], #-1389	; 0xfffffa93
 4c0:	74735f00 	ldrbtvc	r5, [r3], #-3840	; 0xfffff100
 4c4:	6b6f7472 	blvs	1bdd694 <_stack+0x1b5d694>
 4c8:	73616c5f 	cmnvc	r1, #24320	; 0x5f00
 4cc:	665f0074 			; <UNDEFINED> instruction: 0x665f0074
 4d0:	7079746e 	rsbsvc	r7, r9, lr, ror #8
 4d4:	5f007365 	svcpl	0x00007365
 4d8:	00646461 	rsbeq	r6, r4, r1, ror #8
 4dc:	4c555f5f 	mrrcmi	15, 5, r5, r5, cr15	; <UNPREDICTABLE>
 4e0:	00676e6f 	rsbeq	r6, r7, pc, ror #28
 4e4:	7465675f 	strbtvc	r6, [r5], #-1887	; 0xfffff8a1
 4e8:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
 4ec:	7272655f 	rsbsvc	r6, r2, #398458880	; 0x17c00000
 4f0:	6c675f00 	stclvs	15, cr5, [r7], #-0
 4f4:	6c61626f 	sfmvs	f6, 2, [r1], #-444	; 0xfffffe44
 4f8:	706d695f 	rsbvc	r6, sp, pc, asr r9
 4fc:	5f657275 	svcpl	0x00657275
 500:	00727470 	rsbseq	r7, r2, r0, ror r4
 504:	756e755f 	strbvc	r7, [lr, #-1375]!	; 0xfffffaa1
 508:	5f646573 	svcpl	0x00646573
 50c:	646e6172 	strbtvs	r6, [lr], #-370	; 0xfffffe8e
 510:	64775f00 	ldrbtvs	r5, [r7], #-3840	; 0xfffff100
 514:	5f5f0073 	svcpl	0x005f0073
 518:	775f6d74 			; <UNDEFINED> instruction: 0x775f6d74
 51c:	00796164 	rsbseq	r6, r9, r4, ror #2
 520:	756c675f 	strbvc	r6, [ip, #-1887]!	; 0xfffff8a1
 524:	6e5f0065 	cdpvs	0, 5, cr0, cr15, cr5, {3}
 528:	6c6c616d 	stfvse	f6, [ip], #-436	; 0xfffffe4c
 52c:	5f00636f 	svcpl	0x0000636f
 530:	6134366c 	teqvs	r4, ip, ror #12
 534:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 538:	69735f00 	ldmdbvs	r3!, {r8, r9, sl, fp, ip, lr}^
 53c:	75665f67 	strbvc	r5, [r6, #-3943]!	; 0xfffff099
 540:	5f00636e 	svcpl	0x0000636e
 544:	6675626e 	ldrbtvs	r6, [r5], -lr, ror #4
 548:	6e755f00 	cdpvs	15, 7, cr5, cr5, cr0, {0}
 54c:	64657375 	strbtvs	r7, [r5], #-885	; 0xfffffc8b
 550:	745f5f00 	ldrbvc	r5, [pc], #-3840	; 558 <CPSR_IRQ_INHIBIT+0x4d8>
 554:	73695f6d 	cmnvc	r9, #436	; 0x1b4
 558:	00747364 	rsbseq	r7, r4, r4, ror #6
 55c:	636f6c5f 	cmnvs	pc, #24320	; 0x5f00
 560:	69746c61 	ldmdbvs	r4!, {r0, r5, r6, sl, fp, sp, lr}^
 564:	625f656d 	subsvs	r6, pc, #457179136	; 0x1b400000
 568:	5f006675 	svcpl	0x00006675
 56c:	736f6c63 	cmnvc	pc, #25344	; 0x6300
 570:	725f0065 	subsvc	r0, pc, #101	; 0x65
 574:	5f003834 	svcpl	0x00003834
 578:	6f74626d 	svcvs	0x0074626d
 57c:	735f6377 	cmpvc	pc, #-603979775	; 0xdc000001
 580:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
 584:	35705f00 	ldrbcc	r5, [r0, #-3840]!	; 0xfffff100
 588:	5f5f0073 	svcpl	0x005f0073
 58c:	6d5f6d74 	ldclvs	13, cr6, [pc, #-464]	; 3c4 <CPSR_IRQ_INHIBIT+0x344>
 590:	00796164 	rsbseq	r6, r9, r4, ror #2
 594:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xfffff2d1
 598:	752f642f 	strvc	r6, [pc, #-1071]!	; 171 <CPSR_IRQ_INHIBIT+0xf1>
 59c:	322f696e 	eorcc	r6, pc, #1802240	; 0x1b8000
 5a0:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
 5a4:	30323032 	eorscc	r3, r2, r2, lsr r0
 5a8:	4854432f 	ldmdami	r4, {r0, r1, r2, r3, r5, r8, r9, lr}^
 5ac:	6769442f 	strbvs	r4, [r9, -pc, lsr #8]!
 5b0:	6c617469 	cfstrdvs	mvd7, [r1], #-420	; 0xfffffe5c
 5b4:	6f72705f 	svcvs	0x0072705f
 5b8:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
 5bc:	62616c5f 	rsbvs	r6, r1, #24320	; 0x5f00
 5c0:	7461726f 	strbtvc	r7, [r1], #-623	; 0xfffffd91
 5c4:	2f79726f 	svccs	0x0079726f
 5c8:	2f75636d 	svccs	0x0075636d
 5cc:	74726170 	ldrbtvc	r6, [r2], #-368	; 0xfffffe90
 5d0:	612f342d 			; <UNDEFINED> instruction: 0x612f342d
 5d4:	2d636d72 	stclcs	13, cr6, [r3, #-456]!	; 0xfffffe38
 5d8:	2f333130 	svccs	0x00333130
 5dc:	636d7261 	cmnvs	sp, #268435462	; 0x10000006
 5e0:	3331302d 	teqcc	r1, #45	; 0x2d
 5e4:	7473632d 	ldrbtvc	r6, [r3], #-813	; 0xfffffcd3
 5e8:	75747261 	ldrbvc	r7, [r4, #-609]!	; 0xfffffd9f
 5ec:	00632e70 	rsbeq	r2, r3, r0, ror lr
 5f0:	7473635f 	ldrbtvc	r6, [r3], #-863	; 0xfffffca1
 5f4:	75747261 	ldrbvc	r7, [r4, #-609]!	; 0xfffffd9f
 5f8:	73620070 	cmnvc	r2, #112	; 0x70
 5fc:	6e655f73 	mcrvs	15, 3, r5, cr5, cr3, {3}
 600:	5f5f0064 	svcpl	0x005f0064
 604:	5f737362 	svcpl	0x00737362
 608:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
 60c:	005f5f74 	subseq	r5, pc, r4, ror pc	; <UNPREDICTABLE>
 610:	73625f5f 	cmnvc	r2, #380	; 0x17c
 614:	6e655f73 	mcrvs	15, 3, r5, cr5, cr3, {3}
 618:	005f5f64 	subseq	r5, pc, r4, ror #30
 61c:	666f5f5f 	uqsaxvs	r5, pc, pc	; <UNPREDICTABLE>
 620:	00745f66 	rsbseq	r5, r4, r6, ror #30
 624:	69675f5f 	stmdbvs	r7!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
 628:	00745f64 	rsbseq	r5, r4, r4, ror #30
 62c:	6e655f5f 	mcrvs	15, 3, r5, cr5, cr15, {2}
 630:	645f0076 	ldrbvs	r0, [pc], #-118	; 638 <CPSR_IRQ_INHIBIT+0x5b8>
 634:	696c7961 	stmdbvs	ip!, {r0, r5, r6, r8, fp, ip, sp, lr}^
 638:	00746867 	rsbseq	r6, r4, r7, ror #16
 63c:	645f7473 	ldrbvs	r7, [pc], #-1139	; 644 <CPSR_IRQ_INHIBIT+0x5c4>
 640:	73007665 	movwvc	r7, #1637	; 0x665
 644:	69675f74 	stmdbvs	r7!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 648:	74730064 	ldrbtvc	r0, [r3], #-100	; 0xffffff9c
 64c:	6f6c625f 	svcvs	0x006c625f
 650:	00736b63 	rsbseq	r6, r3, r3, ror #22
 654:	5f736d74 	svcpl	0x00736d74
 658:	69747563 	ldmdbvs	r4!, {r0, r1, r5, r6, r8, sl, ip, sp, lr}^
 65c:	5f00656d 	svcpl	0x0000656d
 660:	746e695f 	strbtvc	r6, [lr], #-2399	; 0xfffff6a1
 664:	61656c5f 	cmnvs	r5, pc, asr ip
 668:	34367473 	ldrtcc	r7, [r6], #-1139	; 0xfffffb8d
 66c:	5f00745f 	svcpl	0x0000745f
 670:	616e7a74 	smcvs	59300	; 0xe7a4
 674:	6600656d 	strvs	r6, [r0], -sp, ror #10
 678:	006b726f 	rsbeq	r7, fp, pc, ror #4
 67c:	6978655f 	ldmdbvs	r8!, {r0, r1, r2, r3, r4, r6, r8, sl, sp, lr}^
 680:	72700074 	rsbsvc	r0, r0, #116	; 0x74
 684:	685f7665 	ldmdavs	pc, {r0, r2, r5, r6, r9, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 688:	5f706165 	svcpl	0x00706165
 68c:	00646e65 	rsbeq	r6, r4, r5, ror #28
 690:	6f6d5f5f 	svcvs	0x006d5f5f
 694:	745f6564 	ldrbvc	r6, [pc], #-1380	; 69c <CPSR_IRQ_INHIBIT+0x61c>
 698:	625f5f00 	subsvs	r5, pc, #0, 30
 69c:	6e636b6c 	vnmulvs.f64	d22, d3, d28
 6a0:	00745f74 	rsbseq	r5, r4, r4, ror pc
 6a4:	6c6c696b 			; <UNDEFINED> instruction: 0x6c6c696b
 6a8:	5f747300 	svcpl	0x00747300
 6ac:	72617073 	rsbvc	r7, r1, #115	; 0x73
 6b0:	65003365 	strvs	r3, [r0, #-869]	; 0xfffffc9b
 6b4:	76636578 			; <UNDEFINED> instruction: 0x76636578
 6b8:	756f0065 	strbvc	r0, [pc, #-101]!	; 65b <CPSR_IRQ_INHIBIT+0x5db>
 6bc:	74796274 	ldrbtvc	r6, [r9], #-628	; 0xfffffd8c
 6c0:	735f0065 	cmpvc	pc, #101	; 0x65
 6c4:	655f7379 	ldrbvs	r7, [pc, #-889]	; 353 <CPSR_IRQ_INHIBIT+0x2d3>
 6c8:	696c7272 	stmdbvs	ip!, {r1, r4, r5, r6, r9, ip, sp, lr}^
 6cc:	5f007473 	svcpl	0x00007473
 6d0:	6e69755f 	mcrvs	5, 3, r7, cr9, cr15, {2}
 6d4:	5f323374 	svcpl	0x00323374
 6d8:	6c630074 	stclvs	0, cr0, [r3], #-464	; 0xfffffe30
 6dc:	5f6b636f 	svcpl	0x006b636f
 6e0:	5f5f0074 	svcpl	0x005f0074
 6e4:	5f766564 	svcpl	0x00766564
 6e8:	74730074 	ldrbtvc	r0, [r3], #-116	; 0xffffff8c
 6ec:	6170735f 	cmnvs	r0, pc, asr r3
 6f0:	00316572 	eorseq	r6, r1, r2, ror r5
 6f4:	735f7473 	cmpvc	pc, #1929379840	; 0x73000000
 6f8:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0xfffffe90
 6fc:	74730032 	ldrbtvc	r0, [r3], #-50	; 0xffffffce
 700:	6469755f 	strbtvs	r7, [r9], #-1375	; 0xfffffaa1
 704:	65736c00 	ldrbvs	r6, [r3, #-3072]!	; 0xfffff400
 708:	74006b65 	strvc	r6, [r0], #-2917	; 0xfffff49b
 70c:	735f736d 	cmpvc	pc, #-1275068415	; 0xb4000001
 710:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 714:	766e6500 	strbtvc	r6, [lr], -r0, lsl #10
 718:	6e6f7269 	cdpvs	2, 6, cr7, cr15, cr9, {3}
 71c:	5f747300 	svcpl	0x00747300
 720:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
 724:	6c6e7500 	cfstr64vs	mvdx7, [lr], #-0
 728:	006b6e69 	rsbeq	r6, fp, r9, ror #28
 72c:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xfffff2d1
 730:	752f642f 	strvc	r6, [pc, #-1071]!	; 309 <CPSR_IRQ_INHIBIT+0x289>
 734:	322f696e 	eorcc	r6, pc, #1802240	; 0x1b8000
 738:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
 73c:	30323032 	eorscc	r3, r2, r2, lsr r0
 740:	4854432f 	ldmdami	r4, {r0, r1, r2, r3, r5, r8, r9, lr}^
 744:	6769442f 	strbvs	r4, [r9, -pc, lsr #8]!
 748:	6c617469 	cfstrdvs	mvd7, [r1], #-420	; 0xfffffe5c
 74c:	6f72705f 	svcvs	0x0072705f
 750:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
 754:	62616c5f 	rsbvs	r6, r1, #24320	; 0x5f00
 758:	7461726f 	strbtvc	r7, [r1], #-623	; 0xfffffd91
 75c:	2f79726f 	svccs	0x0079726f
 760:	2f75636d 	svccs	0x0075636d
 764:	74726170 	ldrbtvc	r6, [r2], #-368	; 0xfffffe90
 768:	612f342d 			; <UNDEFINED> instruction: 0x612f342d
 76c:	2d636d72 	stclcs	13, cr6, [r3, #-456]!	; 0xfffffe38
 770:	2f333130 	svccs	0x00333130
 774:	636d7261 	cmnvs	sp, #268435462	; 0x10000006
 778:	3331302d 	teqcc	r1, #45	; 0x2d
 77c:	7473632d 	ldrbtvc	r6, [r3], #-813	; 0xfffffcd3
 780:	2e736275 	mrccs	2, 3, r6, cr3, cr5, {3}
 784:	706f0063 	rsbvc	r0, pc, r3, rrx
 788:	74006e65 	strvc	r6, [r0], #-3685	; 0xfffff19b
 78c:	006f646f 	rsbeq	r6, pc, pc, ror #8
 790:	6c625f5f 	stclvs	15, cr5, [r2], #-380	; 0xfffffe84
 794:	7a69736b 	bvc	1a5d548 <_stack+0x19dd548>
 798:	00745f65 	rsbseq	r5, r4, r5, ror #30
 79c:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 7a0:	7400745f 	strvc	r7, [r0], #-1119	; 0xfffffba1
 7a4:	755f736d 	ldrbvc	r7, [pc, #-877]	; 43f <CPSR_IRQ_INHIBIT+0x3bf>
 7a8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 7ac:	69745f00 	ldmdbvs	r4!, {r8, r9, sl, fp, ip, lr}^
 7b0:	6f7a656d 	svcvs	0x007a656d
 7b4:	7300656e 	movwvc	r6, #1390	; 0x56e
 7b8:	6e695f74 	mcrvs	15, 3, r5, cr9, cr4, {3}
 7bc:	7473006f 	ldrbtvc	r0, [r3], #-111	; 0xffffff91
 7c0:	6b6c625f 	blvs	1b19144 <_stack+0x1a99144>
 7c4:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
 7c8:	79735f00 	ldmdbvc	r3!, {r8, r9, sl, fp, ip, lr}^
 7cc:	656e5f73 	strbvs	r5, [lr, #-3955]!	; 0xfffff08d
 7d0:	73007272 	movwvc	r7, #626	; 0x272
 7d4:	74635f74 	strbtvc	r5, [r3], #-3956	; 0xfffff08c
 7d8:	00656d69 	rsbeq	r6, r5, r9, ror #26
 7dc:	6e695f5f 	mcrvs	15, 3, r5, cr9, cr15, {2}
 7e0:	00745f6f 	rsbseq	r5, r4, pc, ror #30
 7e4:	64646163 	strbtvs	r6, [r4], #-355	; 0xfffffe9d
 7e8:	00745f72 	rsbseq	r5, r4, r2, ror pc
 7ec:	615f7473 	cmpvs	pc, r3, ror r4	; <UNPREDICTABLE>
 7f0:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 7f4:	5f747300 	svcpl	0x00747300
 7f8:	72617073 	rsbvc	r7, r1, #115	; 0x73
 7fc:	77003465 	strvc	r3, [r0, -r5, ror #8]
 800:	00746961 	rsbseq	r6, r4, r1, ror #18
 804:	69755f5f 	ldmdbvs	r5!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
 808:	00745f64 	rsbseq	r5, r4, r4, ror #30
 80c:	6d5f7473 	cfldrdvs	mvd7, [pc, #-460]	; 648 <CPSR_IRQ_INHIBIT+0x5c8>
 810:	0065646f 	rsbeq	r6, r5, pc, ror #8
 814:	5f736d74 	svcpl	0x00736d74
 818:	69747363 	ldmdbvs	r4!, {r0, r1, r5, r6, r8, r9, ip, sp, lr}^
 81c:	7400656d 	strvc	r6, [r0], #-1389	; 0xfffffa93
 820:	73656d69 	cmnvc	r5, #6720	; 0x1a40
 824:	74736600 	ldrbtvc	r6, [r3], #-1536	; 0xfffffa00
 828:	73007461 	movwvc	r7, #1121	; 0x461
 82c:	6c6e5f74 	stclvs	15, cr5, [lr], #-464	; 0xfffffe30
 830:	006b6e69 	rsbeq	r6, fp, r9, ror #28
 834:	70746567 	rsbsvc	r6, r4, r7, ror #10
 838:	69006469 	stmdbvs	r0, {r0, r3, r5, r6, sl, sp, lr}
 83c:	74746173 	ldrbtvc	r6, [r4], #-371	; 0xfffffe8d
 840:	74730079 	ldrbtvc	r0, [r3], #-121	; 0xffffff87
 844:	6564725f 	strbvs	r7, [r4, #-607]!	; 0xfffffda1
 848:	72610076 	rsbvc	r0, r1, #118	; 0x76
 84c:	5f007667 	svcpl	0x00007667
 850:	696c6e5f 	stmdbvs	ip!, {r0, r1, r2, r3, r4, r6, r9, sl, fp, sp, lr}^
 854:	745f6b6e 	ldrbvc	r6, [pc], #-2926	; 85c <CPSR_IRQ_INHIBIT+0x7dc>
 858:	5f747300 	svcpl	0x00747300
 85c:	6d69746d 	cfstrdvs	mvd7, [r9, #-436]!	; 0xfffffe4c
 860:	6e690065 	cdpvs	0, 6, cr0, cr9, cr5, {3}
 864:	5f007263 	svcpl	0x00007263
 868:	6b726273 	blvs	1c9923c <_stack+0x1c1923c>
 86c:	616f4c00 	cmnvs	pc, r0, lsl #24
 870:	65520064 	ldrbvs	r0, [r2, #-100]	; 0xffffff9c
 874:	64616f6c 	strbtvs	r6, [r1], #-3948	; 0xfffff094
 878:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
 87c:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
 880:	546d7241 	strbtpl	r7, [sp], #-577	; 0xfffffdbf
 884:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 888:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 88c:	6d72615f 	ldfvse	f6, [r2, #-380]!	; 0xfffffe84
 890:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
 894:	745f7265 	ldrbvc	r7, [pc], #-613	; 89c <CPSR_IRQ_INHIBIT+0x81c>
 898:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 89c:	546d7241 	strbtpl	r7, [sp], #-577	; 0xfffffdbf
 8a0:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 8a4:	57415200 	strbpl	r5, [r1, -r0, lsl #4]
 8a8:	00515249 	subseq	r5, r1, r9, asr #4
 8ac:	6b73614d 	blvs	1cd8de8 <_stack+0x1c58de8>
 8b0:	52496465 	subpl	r6, r9, #1694498816	; 0x65000000
 8b4:	61560051 	cmpvs	r6, r1, asr r0
 8b8:	0065756c 	rsbeq	r7, r5, ip, ror #10
 8bc:	44657250 	strbtmi	r7, [r5], #-592	; 0xfffffdb0
 8c0:	64697669 	strbtvs	r7, [r9], #-1641	; 0xfffff997
 8c4:	46007265 	strmi	r7, [r0], -r5, ror #4
 8c8:	52656572 	rsbpl	r6, r5, #478150656	; 0x1c800000
 8cc:	696e6e75 	stmdbvs	lr!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 8d0:	6f43676e 	svcvs	0x0043676e
 8d4:	65746e75 	ldrbvs	r6, [r4, #-3701]!	; 0xfffff18b
 8d8:	6f430072 	svcvs	0x00430072
 8dc:	6f72746e 	svcvs	0x0072746e
 8e0:	5052006c 	subspl	r0, r2, ip, rrx
 8e4:	72415f49 	subvc	r5, r1, #292	; 0x124
 8e8:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
 8ec:	6e497265 	cdpvs	2, 4, cr7, cr9, cr5, {3}
 8f0:	2f007469 	svccs	0x00007469
 8f4:	2f746e6d 	svccs	0x00746e6d
 8f8:	6e752f64 	cdpvs	15, 7, cr2, cr5, cr4, {3}
 8fc:	30322f69 	eorscc	r2, r2, r9, ror #30
 900:	322d3931 	eorcc	r3, sp, #802816	; 0xc4000
 904:	2f303230 	svccs	0x00303230
 908:	2f485443 	svccs	0x00485443
 90c:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
 910:	5f6c6174 	svcpl	0x006c6174
 914:	6a6f7270 	bvs	1bdd2dc <_stack+0x1b5d2dc>
 918:	5f746365 	svcpl	0x00746365
 91c:	6f62616c 	svcvs	0x0062616c
 920:	6f746172 	svcvs	0x00746172
 924:	6d2f7972 			; <UNDEFINED> instruction: 0x6d2f7972
 928:	702f7563 	eorvc	r7, pc, r3, ror #10
 92c:	2d747261 	lfmcs	f7, 2, [r4, #-388]!	; 0xfffffe7c
 930:	72612f34 	rsbvc	r2, r1, #52, 30	; 0xd0
 934:	302d636d 	eorcc	r6, sp, sp, ror #6
 938:	722f3331 	eorvc	r3, pc, #-1006632960	; 0xc4000000
 93c:	612d6970 			; <UNDEFINED> instruction: 0x612d6970
 940:	69746d72 	ldmdbvs	r4!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}^
 944:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
 948:	52490063 	subpl	r0, r9, #99	; 0x63
 94c:	656c4351 	strbvs	r4, [ip, #-849]!	; 0xfffffcaf
 950:	47007261 	strmi	r7, [r0, -r1, ror #4]
 954:	54455350 	strbpl	r5, [r5], #-848	; 0xfffffcb0
 958:	50470030 	subpl	r0, r7, r0, lsr r0
 95c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 960:	50470030 	subpl	r0, r7, r0, lsr r0
 964:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 968:	50470031 	subpl	r0, r7, r1, lsr r0
 96c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 970:	50470032 	subpl	r0, r7, r2, lsr r0
 974:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 978:	50470033 	subpl	r0, r7, r3, lsr r0
 97c:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 980:	50470034 	subpl	r0, r7, r4, lsr r0
 984:	4c455346 	mcrrmi	3, 4, r5, r5, cr6
 988:	50470035 	subpl	r0, r7, r5, lsr r0
 98c:	314e4546 	cmpcc	lr, r6, asr #10
 990:	50504700 	subspl	r4, r0, r0, lsl #14
 994:	4c434455 	cfstrdmi	mvd4, [r3], {85}	; 0x55
 998:	5200304b 	andpl	r3, r0, #75	; 0x4b
 99c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
 9a0:	496f6970 	stmdbmi	pc!, {r4, r5, r6, r8, fp, sp, lr}^	; <UNPREDICTABLE>
 9a4:	0074696e 	rsbseq	r6, r4, lr, ror #18
 9a8:	45525047 	ldrbmi	r5, [r2, #-71]	; 0xffffffb9
 9ac:	4700304e 	strmi	r3, [r0, -lr, asr #32]
 9b0:	4e455250 	mcrmi	2, 2, r5, cr5, cr0, {2}
 9b4:	65520031 	ldrbvs	r0, [r2, #-49]	; 0xffffffcf
 9b8:	76726573 			; <UNDEFINED> instruction: 0x76726573
 9bc:	00306465 	eorseq	r6, r0, r5, ror #8
 9c0:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 9c4:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 9c8:	65520031 	ldrbvs	r0, [r2, #-49]	; 0xffffffcf
 9cc:	76726573 			; <UNDEFINED> instruction: 0x76726573
 9d0:	00326465 	eorseq	r6, r2, r5, ror #8
 9d4:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 9d8:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 9dc:	65520033 	ldrbvs	r0, [r2, #-51]	; 0xffffffcd
 9e0:	76726573 			; <UNDEFINED> instruction: 0x76726573
 9e4:	00346465 	eorseq	r6, r4, r5, ror #8
 9e8:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 9ec:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 9f0:	50470035 	subpl	r0, r7, r5, lsr r0
 9f4:	30534445 	subscc	r4, r3, r5, asr #8
 9f8:	45504700 	ldrbmi	r4, [r0, #-1792]	; 0xfffff900
 9fc:	00315344 	eorseq	r5, r1, r4, asr #6
 a00:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 a04:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 a08:	65520038 	ldrbvs	r0, [r2, #-56]	; 0xffffffc8
 a0c:	76726573 			; <UNDEFINED> instruction: 0x76726573
 a10:	00396465 	eorseq	r6, r9, r5, ror #8
 a14:	454c5047 	strbmi	r5, [ip, #-71]	; 0xffffffb9
 a18:	4700304e 	strmi	r3, [r0, -lr, asr #32]
 a1c:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
 a20:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
 a24:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
 a28:	6f697047 	svcvs	0x00697047
 a2c:	41504700 	cmpmi	r0, r0, lsl #14
 a30:	304e4546 	subcc	r4, lr, r6, asr #10
 a34:	41504700 	cmpmi	r0, r0, lsl #14
 a38:	314e4546 	cmpcc	lr, r6, asr #10
 a3c:	43504700 	cmpmi	r0, #0, 14
 a40:	0031524c 	eorseq	r5, r1, ip, asr #4
 a44:	5f697072 	svcpl	0x00697072
 a48:	5f676572 	svcpl	0x00676572
 a4c:	745f6f72 	ldrbvc	r6, [pc], #-3954	; a54 <CPSR_IRQ_INHIBIT+0x9d4>
 a50:	41504700 	cmpmi	r0, r0, lsl #14
 a54:	314e4552 	cmpcc	lr, r2, asr r5
 a58:	48504700 	ldmdami	r0, {r8, r9, sl, lr}^
 a5c:	00304e45 	eorseq	r4, r0, r5, asr #28
 a60:	45485047 	strbmi	r5, [r8, #-71]	; 0xffffffb9
 a64:	5200314e 	andpl	r3, r0, #-2147483629	; 0x80000013
 a68:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
 a6c:	31646576 	smccc	18006	; 0x4656
 a70:	65520030 	ldrbvs	r0, [r2, #-48]	; 0xffffffd0
 a74:	76726573 			; <UNDEFINED> instruction: 0x76726573
 a78:	31316465 	teqcc	r1, r5, ror #8
 a7c:	41504700 	cmpmi	r0, r0, lsl #14
 a80:	304e4552 	subcc	r4, lr, r2, asr r5
 a84:	4c504700 	mrrcmi	7, 0, r4, r0, cr0
 a88:	00314e45 	eorseq	r4, r1, r5, asr #28
 a8c:	5f697072 	svcpl	0x00697072
 a90:	5f676572 	svcpl	0x00676572
 a94:	745f7772 	ldrbvc	r7, [pc], #-1906	; a9c <CPSR_IRQ_INHIBIT+0xa1c>
 a98:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 a9c:	2f642f74 	svccs	0x00642f74
 aa0:	2f696e75 	svccs	0x00696e75
 aa4:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 aa8:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 aac:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 ab0:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 ab4:	61746967 	cmnvs	r4, r7, ror #18
 ab8:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 abc:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 ac0:	616c5f74 	smcvs	50676	; 0xc5f4
 ac4:	61726f62 	cmnvs	r2, r2, ror #30
 ac8:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 acc:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 ad0:	7261702f 	rsbvc	r7, r1, #47	; 0x2f
 ad4:	2f342d74 	svccs	0x00342d74
 ad8:	636d7261 	cmnvs	sp, #268435462	; 0x10000006
 adc:	3331302d 	teqcc	r1, #45	; 0x2d
 ae0:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
 ae4:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
 ae8:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 aec:	55505047 	ldrbpl	r5, [r0, #-71]	; 0xffffffb9
 af0:	4b4c4344 	blmi	1311808 <_stack+0x1291808>
 af4:	50470031 	subpl	r0, r7, r1, lsr r0
 af8:	3056454c 	subscc	r4, r6, ip, asr #10
 afc:	4c504700 	mrrcmi	7, 0, r4, r0, cr0
 b00:	00315645 	eorseq	r5, r1, r5, asr #12
 b04:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
 b08:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
 b0c:	65520036 	ldrbvs	r0, [r2, #-54]	; 0xffffffca
 b10:	76726573 			; <UNDEFINED> instruction: 0x76726573
 b14:	00376465 	eorseq	r6, r7, r5, ror #8
 b18:	47697072 			; <UNDEFINED> instruction: 0x47697072
 b1c:	006f6970 	rsbeq	r6, pc, r0, ror r9	; <UNPREDICTABLE>
 b20:	5f697072 	svcpl	0x00697072
 b24:	5f676572 	svcpl	0x00676572
 b28:	745f6f77 	ldrbvc	r6, [pc], #-3959	; b30 <CPSR_IRQ_INHIBIT+0xab0>
 b2c:	46504700 	ldrbmi	r4, [r0], -r0, lsl #14
 b30:	00304e45 	eorseq	r4, r0, r5, asr #28
 b34:	5f697072 	svcpl	0x00697072
 b38:	6f697067 	svcvs	0x00697067
 b3c:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
 b40:	54455350 	strbpl	r5, [r5], #-848	; 0xfffffcb0
 b44:	50470031 	subpl	r0, r7, r1, lsr r0
 b48:	30524c43 	subscc	r4, r2, r3, asr #24
 b4c:	65727000 	ldrbvs	r7, [r2, #-0]!
 b50:	63746566 	cmnvs	r4, #427819008	; 0x19800000
 b54:	62615f68 	rsbvs	r5, r1, #104, 30	; 0x1a0
 b58:	5f74726f 	svcpl	0x0074726f
 b5c:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
 b60:	4400726f 	strmi	r7, [r0], #-623	; 0xfffffd91
 b64:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
 b68:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 b6c:	5f735152 	svcpl	0x00735152
 b70:	49460032 	stmdbmi	r6, {r1, r4, r5}^
 b74:	6f635f51 	svcvs	0x00635f51
 b78:	6f72746e 	svcvs	0x0072746e
 b7c:	7072006c 	rsbsvc	r0, r2, ip, rrx
 b80:	51524969 	cmppl	r2, r9, ror #18
 b84:	746e6f43 	strbtvc	r6, [lr], #-3907	; 0xfffff0bd
 b88:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
 b8c:	73007265 	movwvc	r7, #613	; 0x265
 b90:	7774666f 	ldrbvc	r6, [r4, -pc, ror #12]!
 b94:	5f657261 	svcpl	0x00657261
 b98:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 b9c:	70757272 	rsbsvc	r7, r5, r2, ror r2
 ba0:	65765f74 	ldrbvs	r5, [r6, #-3956]!	; 0xfffff08c
 ba4:	726f7463 	rsbvc	r7, pc, #1660944384	; 0x63000000
 ba8:	646e7500 	strbtvs	r7, [lr], #-1280	; 0xfffffb00
 bac:	6e696665 	cdpvs	6, 6, cr6, cr9, cr5, {3}
 bb0:	695f6465 	ldmdbvs	pc, {r0, r2, r5, r6, sl, sp, lr}^	; <UNPREDICTABLE>
 bb4:	7274736e 	rsbsvc	r7, r4, #-1207959551	; 0xb8000001
 bb8:	69746375 	ldmdbvs	r4!, {r0, r2, r4, r5, r6, r8, r9, sp, lr}^
 bbc:	765f6e6f 	ldrbvc	r6, [pc], -pc, ror #28
 bc0:	6f746365 	svcvs	0x00746365
 bc4:	61660072 	smcvs	24578	; 0x6002
 bc8:	695f7473 	ldmdbvs	pc, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 bcc:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 bd0:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
 bd4:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
 bd8:	00726f74 	rsbseq	r6, r2, r4, ror pc
 bdc:	746e6d2f 	strbtvc	r6, [lr], #-3375	; 0xfffff2d1
 be0:	752f642f 	strvc	r6, [pc, #-1071]!	; 7b9 <CPSR_IRQ_INHIBIT+0x739>
 be4:	322f696e 	eorcc	r6, pc, #1802240	; 0x1b8000
 be8:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
 bec:	30323032 	eorscc	r3, r2, r2, lsr r0
 bf0:	4854432f 	ldmdami	r4, {r0, r1, r2, r3, r5, r8, r9, lr}^
 bf4:	6769442f 	strbvs	r4, [r9, -pc, lsr #8]!
 bf8:	6c617469 	cfstrdvs	mvd7, [r1], #-420	; 0xfffffe5c
 bfc:	6f72705f 	svcvs	0x0072705f
 c00:	7463656a 	strbtvc	r6, [r3], #-1386	; 0xfffffa96
 c04:	62616c5f 	rsbvs	r6, r1, #24320	; 0x5f00
 c08:	7461726f 	strbtvc	r7, [r1], #-623	; 0xfffffd91
 c0c:	2f79726f 	svccs	0x0079726f
 c10:	2f75636d 	svccs	0x0075636d
 c14:	74726170 	ldrbtvc	r6, [r2], #-368	; 0xfffffe90
 c18:	612f342d 			; <UNDEFINED> instruction: 0x612f342d
 c1c:	2d636d72 	stclcs	13, cr6, [r3, #-456]!	; 0xfffffe38
 c20:	2f333130 	svccs	0x00333130
 c24:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
 c28:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
 c2c:	70757272 	rsbsvc	r7, r5, r2, ror r2
 c30:	632e7374 			; <UNDEFINED> instruction: 0x632e7374
 c34:	616e4500 	cmnvs	lr, r0, lsl #10
 c38:	5f656c62 	svcpl	0x00656c62
 c3c:	73515249 	cmpvc	r1, #-1879048188	; 0x90000004
 c40:	4500315f 	strmi	r3, [r0, #-351]	; 0xfffffea1
 c44:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
 c48:	52495f65 	subpl	r5, r9, #404	; 0x194
 c4c:	325f7351 	subscc	r7, pc, #1140850689	; 0x44000001
 c50:	73694400 	cmnvc	r9, #0, 8
 c54:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
 c58:	7361425f 	cmnvc	r1, #-268435451	; 0xf0000005
 c5c:	495f6369 	ldmdbmi	pc, {r0, r3, r5, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 c60:	00735152 	rsbseq	r5, r3, r2, asr r1
 c64:	65736572 	ldrbvs	r6, [r3, #-1394]!	; 0xfffffa8e
 c68:	65765f74 	ldrbvs	r5, [r6, #-3956]!	; 0xfffff08c
 c6c:	726f7463 	rsbvc	r7, pc, #1660944384	; 0x63000000
 c70:	51524900 	cmppl	r2, r0, lsl #18
 c74:	6e65705f 	mcrvs	0, 3, r7, cr5, cr15, {2}
 c78:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
 c7c:	4400325f 	strmi	r3, [r0], #-607	; 0xfffffda1
 c80:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
 c84:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 c88:	5f735152 	svcpl	0x00735152
 c8c:	6e450031 	mcrvs	0, 2, r0, cr5, cr1, {1}
 c90:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
 c94:	7361425f 	cmnvc	r1, #-268435451	; 0xf0000005
 c98:	495f6369 	ldmdbmi	pc, {r0, r3, r5, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
 c9c:	00735152 	rsbseq	r5, r3, r2, asr r1
 ca0:	5f697072 	svcpl	0x00697072
 ca4:	5f717269 	svcpl	0x00717269
 ca8:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xfffff09d
 cac:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
 cb0:	745f7265 	ldrbvc	r7, [pc], #-613	; cb8 <CPSR_IRQ_INHIBIT+0xc38>
 cb4:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
 cb8:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
 cbc:	43717249 	cmnmi	r1, #-1879048188	; 0x90000004
 cc0:	72746e6f 	rsbsvc	r6, r4, #1776	; 0x6f0
 cc4:	656c6c6f 	strbvs	r6, [ip, #-3183]!	; 0xfffff391
 cc8:	61640072 	smcvs	16386	; 0x4002
 ccc:	615f6174 	cmpvs	pc, r4, ror r1	; <UNPREDICTABLE>
 cd0:	74726f62 	ldrbtvc	r6, [r2], #-3938	; 0xfffff09e
 cd4:	6365765f 	cmnvs	r5, #99614720	; 0x5f00000
 cd8:	00726f74 	rsbseq	r6, r2, r4, ror pc
 cdc:	5f515249 	svcpl	0x00515249
 ce0:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
 ce4:	5f676e69 	svcpl	0x00676e69
 ce8:	52490031 	subpl	r0, r9, #49	; 0x31
 cec:	61625f51 	cmnvs	r2, r1, asr pc
 cf0:	5f636973 	svcpl	0x00636973
 cf4:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
 cf8:	00676e69 	rsbeq	r6, r7, r9, ror #28
 cfc:	706d6f63 	rsbvc	r6, sp, r3, ror #30
 d00:	30657261 	rsbcc	r7, r5, r1, ror #4
 d04:	6d6f6300 	stclvs	3, cr6, [pc, #-0]	; d0c <CPSR_IRQ_INHIBIT+0xc8c>
 d08:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0xfffffe90
 d0c:	6f630031 	svcvs	0x00630031
 d10:	7261706d 	rsbvc	r7, r1, #109	; 0x6d
 d14:	63003265 	movwvs	r3, #613	; 0x265
 d18:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
 d1c:	685f7265 	ldmdavs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 d20:	6f630069 	svcvs	0x00630069
 d24:	6f72746e 	svcvs	0x0072746e
 d28:	74735f6c 	ldrbtvc	r5, [r3], #-3948	; 0xfffff094
 d2c:	73757461 	cmnvc	r5, #1627389952	; 0x61000000
 d30:	756f6300 	strbvc	r6, [pc, #-768]!	; a38 <CPSR_IRQ_INHIBIT+0x9b8>
 d34:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
 d38:	006f6c5f 	rsbeq	r6, pc, pc, asr ip	; <UNPREDICTABLE>
 d3c:	5f495052 	svcpl	0x00495052
 d40:	53746547 	cmnpl	r4, #297795584	; 0x11c00000
 d44:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
 d48:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
 d4c:	63007265 	movwvs	r7, #613	; 0x265
 d50:	61706d6f 	cmnvs	r0, pc, ror #26
 d54:	00336572 	eorseq	r6, r3, r2, ror r5
 d58:	5f495052 	svcpl	0x00495052
 d5c:	74696157 	strbtvc	r6, [r9], #-343	; 0xfffffea9
 d60:	7263694d 	rsbvc	r6, r3, #1261568	; 0x134000
 d64:	6365536f 	cmnvs	r5, #-1140850687	; 0xbc000001
 d68:	73646e6f 	cmnvc	r4, #1776	; 0x6f0
 d6c:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
 d70:	7379735f 	cmnvc	r9, #2080374785	; 0x7c000001
 d74:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
 d78:	745f7265 	ldrbvc	r7, [pc], #-613	; d80 <CPSR_IRQ_INHIBIT+0xd00>
 d7c:	6e6d2f00 	cdpvs	15, 6, cr2, cr13, cr0, {0}
 d80:	2f642f74 	svccs	0x00642f74
 d84:	2f696e75 	svccs	0x00696e75
 d88:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
 d8c:	3230322d 	eorscc	r3, r0, #-805306366	; 0xd0000002
 d90:	54432f30 	strbpl	r2, [r3], #-3888	; 0xfffff0d0
 d94:	69442f48 	stmdbvs	r4, {r3, r6, r8, r9, sl, fp, sp}^
 d98:	61746967 	cmnvs	r4, r7, ror #18
 d9c:	72705f6c 	rsbsvc	r5, r0, #108, 30	; 0x1b0
 da0:	63656a6f 	cmnvs	r5, #454656	; 0x6f000
 da4:	616c5f74 	smcvs	50676	; 0xc5f4
 da8:	61726f62 	cmnvs	r2, r2, ror #30
 dac:	79726f74 	ldmdbvc	r2!, {r2, r4, r5, r6, r8, r9, sl, fp, sp, lr}^
 db0:	75636d2f 	strbvc	r6, [r3, #-3375]!	; 0xfffff2d1
 db4:	7261702f 	rsbvc	r7, r1, #47	; 0x2f
 db8:	2f342d74 	svccs	0x00342d74
 dbc:	636d7261 	cmnvs	sp, #268435462	; 0x10000006
 dc0:	3331302d 	teqcc	r1, #45	; 0x2d
 dc4:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
 dc8:	7379732d 	cmnvc	r9, #-1275068416	; 0xb4000000
 dcc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 dd0:	00632e72 	rsbeq	r2, r3, r2, ror lr
 dd4:	53697072 	cmnpl	r9, #114	; 0x72
 dd8:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
 ddc:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
 de0:	Address 0x0000000000000de0 is out of bounds.


Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003241 	andeq	r3, r0, r1, asr #4
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000028 	andeq	r0, r0, r8, lsr #32
  10:	412d3705 			; <UNDEFINED> instruction: 0x412d3705
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	0c050a02 			; <UNDEFINED> instruction: 0x0c050a02
  20:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  24:	17011501 	strne	r1, [r1, -r1, lsl #10]
  28:	1a011803 	bne	4603c <__bss_end__+0x2c6dc>
  2c:	1e011c01 	cdpne	12, 0, cr1, cr1, cr1, {0}
  30:	Address 0x0000000000000030 is out of bounds.

