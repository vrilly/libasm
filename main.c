#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include "libasm.h"

void teststr(char *a, char *b)
{
	int cmp = strcmp(a, b);
	int cmp_b = ft_strcmp(a,b);
	if (cmp != cmp_b)
	{
		printf("STRCMP Mismatch, sys: %d, ft: %d, a: %s, b: %s\n", cmp, cmp_b, a, b);
		return;
	}
	if (cmp != 0)
	{
		printf("Mismatch, sys: %s ft: %s\n", a, b);
		return;
	}
	printf("[OK] %s\n", a);
}

void testint(int a, int b)
{
	if (a != b)
		printf("return/len mismatch sys: %d ft: %d\n", a, b);
	else
		printf("[OK] Returned %d\n", a);
}

void testsize(ssize_t a, ssize_t b)
{
	if (a != b)
		printf("ret/len mismatch sys: %lu ft: %lu\n", a, b);
	else
		printf("[OK] Returned %lu\n", a);
}

void testptr(void *a, void *b)
{
	if (a != b)
		printf("ptr mismatch sys: %p ft: %p\n", a, b);
	else
		printf("[OK] Returned %p\n", a);
}

int main(int argc, char *argv[])
{
	char *empty = "";
	char *test = "Hello friends! This is a horrible \xff strin\ng!";
	char testcpy[strlen(test)];
	char testcpyft[strlen(test)];
	char *ptr;
	void *pb;
	int ra, rb;

	setbuf(stdout, NULL);

	//strlen
	testint(strlen(empty), ft_strlen(empty));
	testint(strlen(test), ft_strlen(test));

	//strcpy
	strcpy(testcpy, test);
	pb = ft_strcpy(testcpyft, test);
	testptr(testcpyft, pb);
	teststr(testcpy, testcpyft);

	strcpy(testcpy, empty);
	pb = ft_strcpy(testcpyft, empty);
	testptr(testcpyft, pb);
	teststr(testcpy, testcpyft);

	//strcmp
	ra = strcmp(test, empty);
	rb = ft_strcmp(test, empty);
	testint((ra > 0), (rb > 0));
	
	ra = strcmp(test, test);
	rb = ft_strcmp(test, test);
	testint(ra, rb);
	
	// RW
	char buf[512];
	printf("Please input something: ");
	ssize_t sa = ft_read(0, buf, 512);
	printf("len: %lu\nstrlen: %lu\nbuf:%s\nwriting buf through write:\n", sa, ft_strlen(buf), buf);
	sa = ft_write(1, buf, ft_strlen(buf));
	printf("\nret: %lu\n", sa);
	if (read(-1, buf, 10) != ft_read(-1, buf, 10))
		printf("[FAIL] ERRNO mismatch\n");
	else
		printf("[OK] PASS ERRNO Test\n");

	// strdup
	ptr = ft_strdup(empty);
	teststr(empty, ptr);
	ptr = ft_strdup(test);
	teststr(test, ptr);
	return 0;
}
