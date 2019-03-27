am2t: lex.yy.c am2t.tab.c am2t.tab.h
	gcc am2t.tab.c lex.yy.c -o am2t -lm

lex.yy.c: am2t.l am2t.tab.h
	flex am2t.l

am2t.tab.c am2t.tab.h: am2t.y
	bison -d am2t.y

clean:
	rm -f am2t *.o am2t.output *.tab.c *.tab.h lex.yy.c
