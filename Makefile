# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: tjans <tjans@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/05 13:37:00 by tjans         #+#    #+#                  #
#    Created: 2020/06/05 13:37:00 by tjans         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME		= libasm.a
T_NAME		= test_asm

ASM_OBJS	= ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o ft_strdup.o

TARGET		:= $(shell uname -s)
ifeq ($(TARGET), Linux)
	NASM_FLAGS	= -g -f elf64
else
	NASM_FLAGS = -f macho64
endif

%.o : %.s
	nasm $(NASM_FLAGS) -o $@ $<

all: $(NAME) test

$(NAME) : $(ASM_OBJS)
	$(AR) rcs $@ $^

$(T_NAME) : main.c $(ASM_OBJS)
	$(CC) -Wall -Wextra -Werror -fsanitize=address -g -o $@ $^

test: $(T_NAME)

clean:
	$(RM) $(ASM_OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all
