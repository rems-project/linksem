extern __fini_array_start;
extern __fini_array_end;

int _start(void) __attribute__((noreturn));
int _start(void)
{
	__asm__ volatile ("movq %0, %%rdi \n\
                   movq $60, %%rax          # exit \n\
                   syscall"
    : : "r"((char*) &__fini_array_end - (char*) &__fini_array_start) : "%rax", "%rdi" );
	__builtin_unreachable();
}
