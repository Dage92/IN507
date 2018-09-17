#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char **argv)
{
	FILE *f = fopen("nombre.data", "a");
	int a, i;
	srand(getpid());
	
	for (i = 0; i < 10000; i++)
	{
		a = rand()%1000;
		fprintf(f, "%d\n", a);
	}
	return 0;
}

