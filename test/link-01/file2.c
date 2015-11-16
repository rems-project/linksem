int f(void);

int _start(void) __attribute__((noreturn));
int _start(void)
{
	int ret = f();
	__asm__ volatile ("      movq $60, %%rax          # exit \n\
                   movq %0, %%rdi \n\
                   syscall"
    : : "r"((long) ret) : "%rax", "%rdi" );
}
