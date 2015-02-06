int f(void);

int main(void) __attribute__((noreturn));
int main(void)
{
	int ret = f();
	__asm__ volatile ("      movq $60, %%rax          # exit \n\
                   movq %0, %%rdi \n\
                   syscall"
    : : "r"((long) ret) : "%rax", "%rdi" );
}
