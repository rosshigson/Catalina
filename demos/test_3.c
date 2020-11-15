#include <catalina_cog.h>

int main(void) {
	unsigned count;
   unsigned mask   = 0x01000000; // bit 24
	unsigned on_off = 0x01000000;

	_dira(mask, mask);
	_outa(mask, on_off);
	count = _cnt();

	while (1) {
		_outa(mask, on_off);
		count += 100000000;
		_waitcnt(count);
		on_off ^= mask;
	}

   return 0;
}
