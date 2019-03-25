%{
#include <stdio.h>
#include <ctype.h>
%}

// tokens

%%

// parse

%%

int main() {
	yyparse();
	return 0;
}
