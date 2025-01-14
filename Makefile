#* ************************************************************************** *#
#*                                                                            *#
#*                                                        :::      ::::::::   *#
#*   Makefile                                           :+:      :+:    :+:   *#
#*                                                    +:+ +:+         +:+     *#
#*   By: victor <vcollazo@student.42madrid.com>     +#+  +:+       +#+        *#
#*                                                +#+#+#+#+#+   +#+           *#
#*                                                     #+#    #+#             *#
#*                                                    ###   ########.fr       *#
#*                                                                            *#
#* ************************************************************************** *#

################################################################################
#		VARIABLE DECLARATION
################################################################################

SRC_DIR = src
INC_DIR = inc
OBJ_DIR = obj
BIN_DIR = bin

SRCS = ft_printf.c\
       ft_printf_str.c\
       ft_printf_nbr.c\

OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

NAME = libftprintf.a

CC = gcc

CFLAGS = -Wall -Werror -Wextra  

RM = rm -rf

################################################################################
#		IMPLICIT RULES
################################################################################

all:	$(NAME)

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.c | $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

main:	$(NAME)
	@$(CC) $(CFLAGS) $(NAME) $(addprefix $(SRC_DIR)/, main.c)

$(NAME):	$(OBJS)
	@ar rcs $(NAME) $(OBJS)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

#clean implicit rules
#	clean:		remove object files (.o)
#	fclean:		remove object files and the binary (.o, .a)
#	re:		remove object files and the binary (.a, .a). Remake the binary 

clean:	
	@$(RM) $(OBJS)

fclean:	clean
	@$(RM) $(NAME) $(OBJ_DIR)

re:	fclean all

# .PHONY prerequisitest always run independently if name exists or modification time
.PHONY: all bonus clean fclean r 
