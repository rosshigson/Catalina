#pragma safety enable



void free(void* /*_Owner*/ /*_Opt*/ ptr);
void* /*_Owner*/ /*_Opt*/ malloc(int size);

void f(int c)
{
    int* /*_Owner*/ /*_Opt*/ p = malloc(sizeof(int));
    if (c) {
        free(p);
    }
}

#pragma cake diagnostic check "-Wmissing-destructor"
