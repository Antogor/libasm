NAME = tests.a

FUN = suma.s resta.s ft_write.s

OBJ = suma.o resta.o ft_write.o

%.o: %.s
	@nasm -f macho64 $<

all: $(NAME)

$(NAME): $(OBJ)
	@ar rcs $(NAME) $(OBJ)
	@gcc tests.c $(NAME) -o test

#test: $(NAME)
#	@gcc tests.c $(NAME) -o test

clean:
	@rm -f $(OBJ)

fclean: clean
	@rm -f $(NAME)

re: fclean all


