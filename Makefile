GREEN =		\033[0;32m
RED =		\033[0;31m
YELLOW =	\033[0;33m
RESET =		\033[0m

NAME =		test

SRCS =		main.cpp 

HEADERS = 

OBJDIR =	obj
OBJS =		$(addprefix $(OBJDIR)/, $(SRCS:.cpp=.o))

CXX =		c++

CXXFLAGS =	-g #-std=c++98 -Wall -Werror -Wextra -pedantic

RM =		rm -fr

all: $(NAME)

$(NAME):		$(OBJS) $(HEADERS)
					@$(CXX) $(OBJS) $(CXXFLAGS) -o $(NAME)
					@echo "$(GREEN)Compilation successful.$(RESET) Executable name: ./$(NAME)"

$(OBJDIR)/%.o:	%.cpp $(HEADERS)
					@mkdir -p $(OBJDIR)
					@$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
					@$(RM) $(OBJS)
					@$(RM) $(OBJDIR)

fclean:			clean
					@$(RM) $(NAME)

re:				fclean all

valgrind:		
					valgrind --track-fds=yes --leak-check=full --show-leak-kinds=all ./$(NAME)

.PHONY:			all clean fclean re valgrind
