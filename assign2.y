%{
#include <stdio.h>
#include "table_symboles.h"
int yyparse();
int yylex();
int yyerror(char *s);
%}

%union {
  long nval;
  char *sval;
}

// Cette ligne doit être modifiée pour donner à bison la bonne priorité/associativité des opérateurs.
%token ENTIER VAR PLUS MINUS MULT DIV EXPON SEMICOLON LB RB MODULO ASSIGN INTERO COLON

%%

// A FAIRE
Source:                 { print_symbols(); }

%%

int yyerror(char *s) {
    fprintf(stderr, "Erreur: %s\n", s);
    fprintf(stdout, "!!! ERREUR !!!\n");
    return 0;
}

int main(void) {
    yyparse();
    return 0;
}