// wolframに投げてみたけど解いてくれない
// solve 0x8D5051562B = M(M + 0xFFEEE) mod B8AE199365
// Solve[{0x8D5051562B == x(x + 0xFFEEE)}, {x}, Modulus -> 0xB8AE199365]
// Reduce[{0x8D5051562B == x (x + 0xFFEEE)}, {x}, Modulus -> 0xB8AE199365]
// solve M(M + 0xFFEEE) mod 0xB8AE199365 = 0x8D5051562B
// Solve[{0x8D5051562B == x(x + 0xFFEEE)}, {x}, Modulus -> 0xB8AE199365]

// ので総当たり。がヒットせず
#include "stdio.h"

typedef long long int u64;

void solve(u64 n, u64 b, u64 c)
{
	// u64 m = 0x2121212121;
	char str[9] = "!!!!!!\0\0";

	while(1)
	{
		u64 m = *(u64*)str;
		// printf("m: %llx\n", m);

		if(c == m*(m+b) % n)
		{
			printf("found! %llx\n", m);
			return;
		}

		if(str[0] == 0x7f)
		{
			for (int i = 0; i < 5; ++i)
			{
				if(str[i] == 0x7f)
				{
					str[i+1]++;
					str[i] = '!';

					if(i==3)
						printf("m: %llx\n", m);
				}
				else
					break;
			}
		}
		else
			str[0]++;
	}
}


int main(int argc, char const *argv[])
{
	solve(0xB8AE199365UL, 0xFFEEEUL, 0x8D5051562BUL);

	return 0;
}