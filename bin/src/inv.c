// invert stdin
#include <stdio.h>

#define BUFLEN 1024

int main(int argc, char **argv)
{
	char b[BUFLEN], o[BUFLEN];
	int c;

	while ((c = getchar()) != EOF) {
		if (c >= 65 && c <= 90)
			putchar(155 - c);
		else if (c >= 97 && c <= 122)
			putchar(219 - c);
		else
			putchar(c);
	}

	return 0;
}
