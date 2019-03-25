run: lex.yy.o
	gcc -o run lex.yy.o asciimath2tex.tab.o

lex.yy.o: asciimath2tex.l
	flex asciimath2tex.l
	gcc -c lex.yy.c

asciimath2tex.tab.o: asciimath2tex.y
	bison -d asciimath2tex.y
	gcc -c asciimath2tex.tab.c

clean:
	rm -f scan *.o asciimath2tex.output *.tab.c lex.yy.c
