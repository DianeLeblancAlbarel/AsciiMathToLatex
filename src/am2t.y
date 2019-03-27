%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
int yyparse();
FILE *yyin;
void yyerror(const char *s);
%}

%define parse.lac full
%define parse.error verbose

%union {
    char *str;
}

%token <str> CONST
%left  <str> LEFT RIGHT UNARY BINARY
%left  SUB SUPER OVER

%type  <str> S E

%%

S   : CONST {
        printf("Const\t%s\n", $1);
        free($1);
    }
    | LEFT E RIGHT {
        printf("Delimiters\t%s%s%s\n", $1, $2, $3);
        free($1); free($3);
    }
    | UNARY S {
        printf("Unary\t%s%s\n", $1, $2);
        free($1);
    }
    | BINARY S S {
        printf("Binary\t%s%s%s\n", $1, $2, $3);
        free($1);
    }
    ;

E   : S E {
        printf("IE\t\t%s %s\n", $1, $2);
    }
    | S OVER S {
        printf("Over\t%s/%s\n", $1, $3);
    }
    | S SUB S {
        printf("Subscript\t%s_%s\n", $1, $3);
    }
    | S SUPER S {
        printf("Superscript\t%s^%s\n", $1, $3);
    }
    | S SUB S SUPER S {
        printf("Fully_grown\t%s_%s^%s\n", $1, $3, $5);
    }
    | S {
        printf("Simple\t%s\n", $1);
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
    fprintf(stderr,"%s\n", s);
    exit(EXIT_FAILURE);
}