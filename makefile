all:
	flex -o sql_lexer.c --header=sql_lexer.h sql_lexer.l
	bison -d sql_parser.y
	gcc sql_parser.tab.c sql_lexer.c -o sql_interpreter.exe
	./sql_interpreter.exe input.txt

clean:
	rm *.o *.c *.h *.exe