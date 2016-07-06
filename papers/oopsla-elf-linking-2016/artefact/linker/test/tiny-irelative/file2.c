#include <elf.h>

int ifunc(void);

/* We have to write our own libc-like initialization code,
 * and also invoke it ourselves before we do anything else. */
extern Elf64_Rela __rela_iplt_start;
extern Elf64_Rela __rela_iplt_end;
static void init(void)
{
	Elf64_Rela *p_r;
	for (p_r = &__rela_iplt_start; p_r != &__rela_iplt_end; ++p_r)
	{
		if (ELF64_R_TYPE(p_r->r_info) == R_X86_64_IRELATIVE)
		{
			void **site = (void**) p_r->r_offset;
			void *(*resolver)(void) = (void*) p_r->r_addend;
			*site = resolver();
		}
	}
}

int _start(void) __attribute__((noreturn));
int _start(void)
{
	__asm__ volatile ("callq init\n\
                   callq ifunc\n\
                   movq %%rax, %%rdi \n\
                   movq $60, %%rax          # exit \n\
                   syscall"
    : : : "%rax", "%rdi" );
	__builtin_unreachable();
}
