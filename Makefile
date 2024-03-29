.PHONY: all clean fclean re create_dir

NAME	= libbdlst.a
CC		= gcc

CFLAGS	= -Wall -Wextra -Werror
INCLUDE = -I./
	
OBJ_DIR = obj
SRC_DIR = src

SRCS	=	bd_utils.c \
			bd_lstcmp.c \
			bd_lstmap.c \
			bd_lstmin.c \
			bd_lstmax.c \
			bd_lstnew.c \
			bd_lstdup.c \
			bd_lstcopy.c \
			bd_lstiter.c \
			bd_lstlast.c \
			bd_lstfind.c \
			bd_lstsize.c \
			bd_lstsort.c \
			bd_lstswap.c \
			bd_lstclear.c \
			bd_lstmerge.c \
			bd_lstparse.c \
			bd_lstprint.c \
			bd_lstremove.c \
			bd_lst_maxlen.c \
			bd_lstadd_back.c \
			bd_lstadd_front.c \
			bd_lstpush_sort.c \
			bd_lstsort_merge.c \

HEADER = bidirectional_list.h

OBJS	= $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

all: create_dir $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(HEADER)
	@$(CC) $(CFLAGS) -c $< $(INCLUDE) -o $@

$(NAME): $(OBJS) $(HEADER)
	@ar rcs $@ $?
	@echo "${NAME} created."

create_dir:
	@mkdir -p ${OBJ_DIR}

clean: 
	@rm -rf ${OBJS}

fclean: clean
	@rm -rf ${NAME}

re: fclean all 

.PHONY: all clean fclean re
