int f_1(void)
{
	return 41;
}
int f_2(void)
{
	return 43;
}

#include <sys/syscall.h>

#define SYSCALL_CLOBBER_LIST \
        "%rdi", "%rsi", "%rax", "%rcx", "%rdx", "%r8", "%r9", "%r10", "%r11", \
        "%xmm0", "%xmm1", "%xmm2", "%xmm3", "%xmm4", "%xmm5", "%xmm6", "%xmm7", "%xmm8", \
        "%xmm9", "%xmm10", "%xmm11", "%xmm12", "%xmm13", "%xmm14", "%xmm15", \
        "cc" /*, "memory" */
#define FIX_STACK_ALIGNMENT \
        "movq %%rsp, %%rax\n\
         andq $0xf, %%rax    # now we have either 8 or 0 in rax \n\
         subq %%rax, %%rsp   # fix the stack pointer \n\
         movq %%rax, %%r12   # save the amount we fixed it up by in r12 \n\
         "
#define UNFIX_STACK_ALIGNMENT \
        "addq %%r12, %%rsp\n"


typedef void *(*func_ptr_t)();

/* We want the return value to depend on the environment 
 * in some way that we can observe from here
 * and easily change, or at least observe, from the calling shell.
 * Hmm. Use the pid-parity perhaps. */
func_ptr_t ifunc(void)
{
   long int ret;
   long int op = SYS_getpid;

    /* We have to do it all in one big asm statement, since the compiler
     * can change what's in registers in between asm statements. */
    __asm__ volatile (FIX_STACK_ALIGNMENT " \n\
                       movq %1, %%rax      # \n\
                       syscall           # do the syscall \n\
                      "UNFIX_STACK_ALIGNMENT " \n\
                       movq %%rax, %0\n"
      : "=r"(ret) : "rm"(op) : "r12", SYSCALL_CLOBBER_LIST);
	if (ret % 2) return f_1;
	else return f_2;
}
__asm__(".type ifunc,%gnu_indirect_function");
