#include <stdlib.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
	// ecrypt1.binのタイムスタンプが2014-11-22 23:46:30 -> unix time
	srand(1416667590);

	FILE* fp = fopen("ecrypt1.bin", "rb");
	FILE* fpo = fopen("ecrypt1.bin.dec", "wb");
	char buf = 0;

	int read = 0;
	while(1)
	{
		read = fread(&buf, 1, 1, fp);
		if(read == 0) break;

		int k = rand();
		k &= 0xff;

		buf ^= k;

		fwrite(&buf, 1, 1, fpo);
	}

	return 0;
}


