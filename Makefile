# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pdamoune <pdamoune@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/10/18 18:23:59 by pdamoune          #+#    #+#              #
#    Updated: 2018/02/06 18:26:46 by pdamoune         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
NAME	=	ft_ls
SOURCES	=	main.c

CFLAGS	=	-Wall -Wextra -Werror
DEBUG	=	-g3

CC		=	gcc

PATHLIB	=	libft
PATHSRC =	srcs
PATHINC	=	includes
PATHOBJ	=	objs

LIB		=	$(PATHLIB)/libft.a
INCLUDE =	-I $(PATHLIB)/$(PATHINC) -I $(PATHINC)

OBJETS	=	$(patsubst %.c,$(PATHOBJ)/%.o,$(SOURCES))

all:
		@make -C $(PATHLIB)
		@make -j $(NAME)

$(PATHOBJ) :
		@mkdir -p $(PATHOBJ)
		@mkdir -p $(dir $(OBJETS))

$(PATHOBJ)/%.o: $(PATHSRC)/%.c Makefile | $(PATHOBJ)
		@printf "\r\033[1;32m. Compiling .\033[0m\033[K \033[1;31m$<"
		@$(CC) $(CFLAGS) $(DEBUG) $(INCLUDE) -MMD -c $< -o $@

$(NAME): $(LIB) $(OBJETS) $(PATHOBJ)
		@$(CC) -o $(NAME) $(OBJETS) $(LIB)
		@printf "\r\033[2K\033[1;36m[${NAME}]\033[1;32m Done\033[0m\n"

lib:
		@rm -rf libft
		@ln -s ~/Documents/42/projets_42/library libft

clean:
		@rm -rf $(PATHOBJ)
		@make clean -C $(PATHLIB)

fclean: clean
		@rm -f $(NAME)
		@make fclean -C $(PATHLIB)

re: fclean all

-include $(OBJETS:.o=.d)

.PHONY: clean, fclean, re, all
