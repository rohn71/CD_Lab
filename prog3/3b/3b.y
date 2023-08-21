%{
    #include <stdio.h>
    #include <stdlib.h>
    
    extern int yylex();
    int yyerror(char*);
    
    int count = 0;
%}

%token IDEN NUM FOR

%%
S : I
  ;
  
I : FOR A B	{count++;}
  ;
  
A : '('E';'E';'E')'
  ;

B : B B 
  | '{' B '}'
  | I
  | IDEN '=' E ';' B
  | IDEN '=' E ';'
  |
  ;

E : IDEN Z IDEN
  | IDEN Z NUM
  | IDEN U
  | IDEN
  | NUM
  ;

Z : '>''='
  | '<''='
  | '!''='
  | '=''='
  | '>'
  | '<'
  | '='
  ;
  
U : '+''+'
  | '-''-'
  ;
%%

int yyerror(char* mesg)
{
    printf("Invalid\n");
    exit(0);
}

int main()
{
    printf("Enter code snippet\n");
    yyparse();
    printf("Valid\n");
    printf("Count of for loops  = %d\n", count);
    return 0;
}
    
