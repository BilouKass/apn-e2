%{
#include <stdio.h>
#include "table_symboles.h"
#include "math_op.h"
extern char *yytext;
extern int yylineno;
int yyparse();
int yylex();
int yyerror(char *s);
%}

%union {
  long nval;
  char *sval;
}

%token ENTIER VAR PLUS MINUS MULT DIV EXPON SEMICOLON LB RB ASSIGN UNDERSCORE COMBI

%type<nval> Prog Line Expr Fin ENTIER
%type<sval> VAR

%right ASSIGN
%left PLUS MINUS
%left MULT DIV
%right EXPON

%%

Source: Prog { print_symbols(); }

Prog: Line SEMICOLON Prog {}
    | {}

Line: VAR ASSIGN Line {
        set_value($1, $3);
        $$ = $3;
      }
    | Expr { $$ = $1; }

Expr: Expr PLUS Expr { $$ = $1 + $3; }
    | Expr MINUS Expr { $$ = $1 - $3; }
    | Expr MULT Expr { $$ = $1 * $3; }
    | Expr DIV Expr { $$ = $1 / $3; }
    | Expr EXPON Expr { $$ = powe($1, $3); }
    | COMBI EXPON Fin UNDERSCORE Fin { $$ = combi($5, $3); }
    | COMBI UNDERSCORE Fin EXPON Fin { $$ = combi($3, $5); }
    | Fin { $$ = $1; }

Fin: VAR { $$ = get_value($1); }
    | ENTIER { $$ = $1; }
    | LB Line RB { $$ = $2; }

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