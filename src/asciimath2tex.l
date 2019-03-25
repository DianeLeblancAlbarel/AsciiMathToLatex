%{
#include <stdio.h>
int yylex();
%}
%option noyywrap
%%
[a-z]+|[A-Z]+|[0-9]+|alpha|beta|gamma|delta|epsilon|varepsilon|zeta|lim|sum|int		{ printf("constant: %s\n", yytext); }
(sqrt|abs|norm|hat|vec|bar|ul|dot|ddot|cancel|obrace|ubrace)		{ printf("unary: %s\n", yytext); }
(root|frac)	{ printf("binary: %s\n", yytext); }
\(|\[|\{|<<|\{:	{ printf("left delimiter: %s\n", yytext); }
\)|\]|\}|>>|:\}	{ printf("right delimiter: %s\n", yytext); }
.		{printf("unrecognized sequence: %s\n", yytext); }
%%
int main() {
	while (yylex());
}
