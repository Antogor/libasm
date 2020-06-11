#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>

ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);
size_t	ft_strlen(const char *s);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(char *dest, const char *src);
char	*ft_strdup(const char *s1);

int	test_cmp(const char *s1, const char *s2)
{
	int	l;
	int	x;

	l = ft_strcmp(s1, s2);
	x = strcmp(s1, s2);	
	printf("FT: %d\nORIGINAL: %d\n\n", l, x);
	return (0);
}

int		main(int argc, char **argv)
{
	char *s1 = (char *)malloc(sizeof(char) * 20);
	char *s2 = (char *)malloc(sizeof(char) * 20);

	if (argc != 2)
	{
		printf("Invalid argument\n");
		return (0);
	}
	else
	{
		if (strcmp(argv[1], "cmp") == 0)
		{
			printf("%19s", "===STRCMP===\nInsert s1: ");
			scanf("%s", s1);
			printf("Insert s2: ");
			scanf("%s", s2);
			test_cmp(s1, s2);
		}
	}
	return (0);
/*
 * ft_write
*/
//	char c = 'A';
//	char *s = "";
//
//	int l =	ft_write(42, &c, 1);
//	int x = write(1, s, 4);
//
//	printf("%d, %d", l, x);

/*
 * ft_read
*/ 	
//	char *buff;
//	int fd = open("./teoria/compilar.txt", O_RDONLY);
//	int l =	ft_read(fd, buff, 10);
//	//	int x = read(fd, buff, 2);
//	//	printf("FT: %d\nORI: %d\n", l, x);
//	printf("%s\n", buff);
//	close(fd);

/*
 * ft_strlen
*/
//	int l = ft_strlen("esto es una prueba de prueba");
//	int x = strlen("esto es una prueba de prueba");
//	printf("%d\n%d\n", l, x);

/*
 * ft_strcmp
*/
//	int	l;
//	int	x;
//
//	printf("%19s", "===STRCMP===\n\n");
//	printf("%17s", "===BASIC===\n");
//	l = ft_strcmp("abc", "abc");
//	x = strcmp("abc", "abc");	
//	printf("TEST: s1 = abc, s2 = abc\n");
//	printf("%-14sFT: %d\nORIGINAL: %d\n\n", "Zero case", l, x);
//	l = ft_strcmp("abc", "a");
//	x = strcmp("abc", "a");	
//	printf("TEST: s1 = abc, s2 = a\n");
//	printf("%-14sFT: %d\nORIGINAL: %d\n\n", "Greater case", l, x);
//	l = ft_strcmp("a", "abc");
//	x = strcmp("a", "abc");	
//	printf("TEST: s1 = a, s2 = abc\n");
//	printf("%-14sFT: %d\nORIGINAL: %d\n\n", "Lower case", l, x);
//	
//	l = ft_strcmp("\xff\xff", "\xff");
//	x = strcmp("\xff\xff", "\xff");	
//	printf("MIO: %d\nORIGINAL: %d\n", l, x);
//	printf("\xff\xff");

/*
 * ft_strcpy
*/
//	char *s;
//	s = malloc(sizeof(char) * 11);
//	char *c;
//	c = malloc(sizeof(char) * 11);
//	strcpy(s, "");
//	int l = strlen(s);
//	char *r = ft_strcpy(c, "");
//	ft_strcpy(c, "");
//	int x = strlen(c);
//	printf("%s - %d\n%s - %d\n", s, l, c, x);
//	printf("ORI: %s\nMIO: %s\n", s, c);

/*
 * ft_strdup
*/
//	char *s;
//
//	s = ft_strdup("");
//	printf("%s\n", s);
}
