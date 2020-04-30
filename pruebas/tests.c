#include <stdio.h>

int suma(int a, int b);
int restar(int a, int b);
void ft_write(int fd, char c, int buff);
int main()
{
	int x = restar(5, 3);
	printf("%d\n", x);
	printf("%d\n", suma(x, 1));
	ft_write(1, 'c', 2);
	return(0);
	
}
