#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include "main.h"

int main(int argc, char *argv[])
{
	char *src = "Hello world!";
	char *dst;
	char *merp;

	dst = calloc(1, 32);
	merp = ft_strcpy(dst, src);
	setbuf(stdout, NULL);
	printf("strcpy\n%p: %s\n%p: %s\n", dst, src, merp, dst);
	printf("strlen\n%p: %ld\n", dst, ft_strlen(dst));
	printf("strcmp:\n%p v %p: %d\n", src, dst, ft_strcmp(src, dst));
	printf("strcmp:\n%p v %p: %d\n", src, dst, strcmp(src, dst));
	dst[6] = 'B';
	printf("strcmp:\n%p v %p: %d\n", src, dst, ft_strcmp(src, dst));
	printf("strcmp:\n%p v %p: %d\n", src, dst, strcmp(src, dst));
	ft_write(1, src, ft_strlen(src));
	merp = ft_strdup(src);
	printf("strdup:\n%p -> %p: %s\n", src, merp, merp);
	return 0;
}
