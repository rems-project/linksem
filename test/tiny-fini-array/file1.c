static void my_fini(void)
{
}

typedef void fini(void);

fini *my_finis[] __attribute__((section(".fini_array"))) = { &my_fini };
