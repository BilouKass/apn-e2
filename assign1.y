%{
#include <stdio.h>
#include "table_symboles.h"
#include "math_op.h"
int yyparse();
int yylex();
int yyerror(char *s);
%}

%union {
  int nval;
  char *sval;
}

%token ENTIER VAR PLUS MINUS MULT DIV EXPON SEMICOLON LB RB MODULO ASSIGN INTERO COLON UNDERSCORE COMBI

%type<nval> Prog  Line Expr Term Pow Bin Fin ENTIER
%type<sval> VAR

%%

Source: Prog { print_symbols(); }

Prog: Line SEMICOLON Prog {printf("%d\n", $1);}
    | {}

Line: VAR ASSIGN Line {
  set_value($1, $3);
  $$ = $3;
}
    | Expr {$$ = $1;}

Expr: Expr PLUS Term { $$ = $1 + $3; }
    | Expr MINUS Term {$$ = $1 + $3; }
    | Term {$$ = $1; }

Term: Term MULT Pow {$$ = $1 * $3;}
    | Term DIV Pow {$$ = $1 / $3;}
    | Pow {$$ = $1;}

Pow: Bin EXPON Pow {$$ = powe($1, $3);}
   | Bin {$$ = $1;}

Bin: COMBI EXPON Bin UNDERSCORE Fin {$$ = combi($3, $5);}
   | COMBI UNDERSCORE Bin EXPON Fin {$$ = combi($3, $5);}
   | Fin {$$ = $1;}

Fin: VAR {$$ = get_value($1);}
   | ENTIER {$$=$1;}
   | LB Line RB {$$ = $2;} 

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