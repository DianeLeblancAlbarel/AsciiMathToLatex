%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
int yyparse();
FILE *yyin;
void yyerror(const char *s);

%}

%union {
    char *str;
}

%token <str> CONST UNARY BINARY LEFT RIGHT
%left LEFT RIGHT UNARY BINARY

%type  <str> S I E

%%

S   : CONST {
        free($1);
    }
    | LEFT E RIGHT {
        free($1); free($3);
    }
    | UNARY S {
        free($1);
    }
    | BINARY S S {
        free($1);
    }
    ;

I   : S "_" S {
        // do something
    }
    | S "^" S {
        // do something
    }
    | S "_" S "^" S {
        // do something
    }
    | S {
        // do something
    }
    ;

E   : I E {
        // do something
    }
    | I "/" I {
        // do something
    }
    ;

%%

int main() {
    FILE *input_file = fopen("example.input", "r");
    if (!input_file) {
        puts("I can't open your stupid file.");
        return EXIT_FAILURE;
    }

    yyin = input_file;
    yyparse();
}

void yyerror(const char *s) {
    printf("Parse error: %s\n", s);
    exit(EXIT_FAILURE);
}