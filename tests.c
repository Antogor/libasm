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

int	test_read()
{
	char	*s1 = (char *)malloc(sizeof(char) * 100);
	int		fd;
	char	*s2;
	int		buff;
	int		l;
	int		x;
	char	*s_error;

	printf("%19s", "===READ===\n");
//	fd = 42; //bad fd
	fd = open("./txt/1.txt", O_RDONLY);
	printf("Insert bytes to read: ");
	scanf("%s", s1);
	buff = atoi(s1);
	l = ft_read(fd, s2, buff);
	x = read(fd, s2, buff);
//	l = ft_read(fd, s_error, buff);
//	x = read(fd, s_error, buff);
	printf("FT: %d\nORIGINAL: %d\n\n", l, x);
	free(s1);
	return (0);
}

int	test_write()
{
	char	*s1 = (char *)malloc(sizeof(char) * 100);
	int		fd;
	char	*s2 = (char *)malloc(sizeof(char) * 100);
	char	*s3 = (char *)malloc(sizeof(char) * 100);
	int		buff;
	int		l;
	int		x;
	char	*s_error;

	printf("%19s", "===WRITE===\nInsert fd: ");
	scanf("%s", s1);
	fd = atoi(s1);
	printf("Insert string: ");
	scanf("%s", s2);
	printf("Insert buff: ");
	scanf("%s", s3);
	buff = atoi(s3);
	l = ft_write(fd, s2, buff);
	x = write(fd, s2, buff);
	//l = ft_write(fd, s_error, buff);
	//x = write(fd, s_error, buff);
	printf("FT: %d\nORIGINAL: %d\n\n", l, x);
	free(s1);
	free(s2);
	free(s3);
	return (0);
}

int	test_cpy()
{
	char	*s1 = (char *)malloc(sizeof(char) * 100);
	char	*test_ft = (char *)malloc(sizeof(char) * 100);
	char	*test_ori = (char *)malloc(sizeof(char) * 100);

	printf("%19s", "===STRCPY===\nInsert s1: ");
	scanf("%s", s1);
	//s1 = ""; //s1 empty
	printf("FT: %s\nORIGINAL: %s\n\n", ft_strcpy(test_ft, s1), strcpy(test_ori, s1));
	free(s1);
	free(test_ft);
	free(test_ori);
	return (0);
}

int	test_dup()
{
	char	*s1 = (char *)malloc(sizeof(char) * 100);

	printf("%19s", "===STRDUP===\nInsert s1: ");
	scanf("%s", s1);
	//s1 = ""; //s1 empty
	printf("FT: %s\nORIGINAL: %s\n\n", ft_strdup(s1), strdup(s1));
	return (0);
}

int	test_len()
{
	int		l;
	int		x;
	char	*s1 = (char *)malloc(sizeof(char) * 100);

	printf("%19s", "===STRLEN===\nInsert s1: ");
	scanf("%s", s1);
	//s1 = ""; //s1 empty
	l = ft_strlen(s1);
	x = strlen(s1);
	printf("FT: %d\nORIGINAL: %d\n\n", l, x);
	free(s1);
	return (0);
}

int	test_cmp()
{
	int		l;
	int		x;
	char	*s1 = (char *)malloc(sizeof(char) * 100);
	char	*s2 = (char *)malloc(sizeof(char) * 100);

	printf("%19s", "===STRCMP===\nInsert s1: ");
	scanf("%s", s1);
	//s1 = ""; //s1 empty
	printf("Insert s2: ");
	scanf("%s", s2);
	//s2 = ""; //s2 empty
	l = ft_strcmp(s1, s2);
	x = strcmp(s1, s2);
	x = x < 0 ? -1 : x >  0 ? 1 : 0;	
	printf("FT: %d\nORIGINAL: %d\n\n", l, x);
	free(s1);
	free(s2);
	return (0);
}

int		main(int argc, char **argv)
{

	if (argc != 2)
	{
		printf("Invalid argument\n");
		return (0);
	}
	else
	{
		if (strcmp(argv[1], "cmp") == 0)
			test_cmp();
		else if (strcmp(argv[1], "len") == 0)
			test_len();
		else if (strcmp(argv[1], "cpy") == 0)
			test_cpy();
		else if (strcmp(argv[1], "dup") == 0)
			test_dup();
		else if (strcmp(argv[1], "w") == 0)
			test_write();
		else if (strcmp(argv[1], "r") == 0)
			test_read();
		else
			printf("Invalid test\n");
	}
	return (0);
}
