/*
 * This file exists only to compile example.pasm into a C program so that 
 * the binary version of the example user-defined assembly language functions
 * can be extracted from the resulting listing. 
 *
 * To compile this program use the build_example script, specifying the 
 * platform and memory model, such as:
 *
 *   build_example C3
 * or
 *   build_example C3 LARGE
 * or
 *   build_example P2_EDGE
 * or
 *   build_example P2_EDGE COMPACT
 *
 * The default if no options are specified is to build it for a P1 in TINY 
 * mode. Then examine the listing (example.lst) and extract the binary code 
 * of the compiled function for inclusion in a basic program.
 *
 * See the file example.pasm for more details.
 *
 */
void main() {
}
