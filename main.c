#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include "main.h"

int main(int argc, char *argv[])
{
	char *merp = ft_strdup("");
	merp = ft_strdup("ABC");
	char *notmerp = strdup("ABC");
	printf("%s\n%x\n%d\n", merp, merp[3], strcmp(merp, notmerp));
	return 0;
}
