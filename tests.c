#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);

int		main()
{
/*
 * ft_write
*/
//	char c = 'A';
//	char *s = "";
//
//	int l =	ft_write(1, s, 4);
//	int x = write(1, s, 4);
//
//	printf("%d, %d", l, x);

/*
 * ft_read
*/ 	
	char *buff;
	int fd = open("./teoria/compilar.txt", O_RDONLY);
	int l =	ft_read(fd, buff, 10);
	//	int x = read(fd, buff, 2);
	//	printf("FT: %d\nORI: %d\n", l, x);
	printf("%s\n", buff);
	close(fd);

/*
 * ft_strlen
*/

	return(0);
	
}