/* GCC builtin compatibility for Catalina target libraries. */

int __builtin_popcount(unsigned int value)
{
    int count = 0;

    while (value != 0) {
        count += (int)(value & 1u);
        value >>= 1;
    }
    return count;
}

int __builtin_ffs(int value)
{
    unsigned int mask = (unsigned int)value;
    int bit = 1;

    if (mask == 0u) {
        return 0;
    }
    while ((mask & 1u) == 0u) {
        mask >>= 1;
        ++bit;
    }
    return bit;
}
