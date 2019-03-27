%{
#include <stdio.h>
#include <math.h>
#include "am2t.tab.h"
%}
%option noyywrap

NUMBER		    [0-9]+(.[0-9]*)?
LATIN_LETTER    [a-z]|[A-Z]
GREEK_LETTER    alpha|beta|gamma|Gamma|delta|Delta|epsilon|varepsilon|zeta|eta|theta|Theta|vartheta|iota|kappa|lambda|Lambda|mu|nu|xi|Xi|pi|Pi|rho|sigma|Sigma|tau|upsilon|phi|Phi|varphi|chi|psi|Psi|omega|Omega
RELATION_SYM    "!="|"<"|"<="|">"|">="|"-<"|"-<="|">-"|"<-="|in|"!in"|sub|sup|sube|supe|"-="|"~="|"~~"|"prop"
ARROW           uarr|darr|rarr|"->"|">->"|"->>"|">->>"|"|->"|larr|harr|rArr|lArr|hArr|"=>"|"<=>"
LOGICAL         and|or|not|if|AA|EE|"_|_"|TT|"|--"|"|=="
OP_SYM          "*"|"**"|"***"|"//"|\\\\|xx|"-:"|"|><"|"><|"|"@"|"o+"|"ox"|"o."|"^^"|"^^^"|vv|vvv|nn|uu|oo|"O/"|"+-"|del|grad|aleph|"/_"|frown|\/_\\|diamond|square
DOTS            ":."|":'"|"..."|cdots|vdots|ddots
LARGE_OP        sum|prod|int|oint|nnn|uuu
NUM_SET         CC|RR|QQ|ZZ|NN
SINGLE_DLM      "|__"|"|~~"|"__|"|"~|"
SPACE           "\ "|quad
STANDARD_FUNC   sin|cos|tan|sec|csc|cot|arcsin|arccos|arctan|sinh|cosh|tanh|sech|csch|coth|exp|log|ln|det|dim|mod|gcd|lcm|lub|glb|min|max|f|g

UNARY_OP	    sqrt|abs|floor|ceil|norm|vec|hat|bar|ul|dot|ddot|cancel|ubrace|obrace
BINARY_OP	    root|overset|underset|frac|stackrel
WHITESPACE	    [ \t\n]
LEFT_DLM	    "("|"["|"{:"|"{"|"(:"|"<<"
RIGHT_DLM	    ")"|"]"|":}"|"}"|":)"|">>"

%%

{NUMBER}|{LATIN_LETTER}|{GREEK_LETTER}|{RELATION_SYM}|{ARROW}|{LOGICAL}|{OP_SYM}|{DOTS}|{LARGE_OP}|{NUM_SET}|{SINGLE_DLM}|{SPACE}|{STANDARD_FUNC} {
    yylval.str = strdup(yytext);
    return CONST;
}

{UNARY_OP}			{yylval.str = strdup(yytext); return UNARY;}
{BINARY_OP}			{yylval.str = strdup(yytext); return BINARY;}
{LEFT_DLM}			{yylval.str = strdup(yytext); return LEFT;}
{RIGHT_DLM}			{yylval.str = strdup(yytext); return RIGHT;}
{WHITESPACE}+		;
.					printf("Unrecognized sequence: %s\n", yytext);

%%
