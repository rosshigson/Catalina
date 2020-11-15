/* 
 * define a function to simplify inititaing a Spin program in a new cog,
 * similar to _coginit_Spin, but using a custom Spin interpreter:
 */
int coginit_PNut(void *code, void *data, void *stack, int start, int offs);

