/*
 * assign.lex : Scanner pour analyse des expressions.
 */

%{
#include "assign2.h"
#include <errno.h>

#define YY_SKIP_YYWRAP 1

int yywrap() {
    return 1;
}

%}
%option yylineno
%%

[0-9]+          { yylval.nval = atol(yytext); return(ENTIER); }
"C"         return(COMBI);
[a-zA-Z]+       { yylval.sval = strdup(yytext); return(VAR); }

"+"        return(PLUS);
"-"        return(MINUS);
"*"        return(MULT);
"/"        return(DIV);
"^"        return(EXPON);
"("        return(LB);
")"        return(RB);
"="        return(ASSIGN);
";"         return(SEMICOLON);
"_"         return(UNDERSCORE);

[\n\t ]*     /* throw away whitespace */
.          { // Traiter chaque caractère inconnu comme un point virgule...
             return(SEMICOLON);
           }
<<EOF>>  { return(EOF); }
%%



