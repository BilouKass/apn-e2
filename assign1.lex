/*
 * assign.lex : Scanner pour analyse des expressions.
 */

%{
#include "assign1.h"
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
"%"        return(MODULO);
"("        return(LB);
")"        return(RB);
"="        return(ASSIGN);
";"         return(SEMICOLON);
"?"         return(INTERO);
":"         return(COLON);
"_"         return(UNDERSCORE);

[\n\t ]*     /* throw away whitespace */
.          { // Traiter chaque caractère inconnu comme un point virgule...
             return(SEMICOLON);
           }
<<EOF>>  { return(EOF); }
%%



