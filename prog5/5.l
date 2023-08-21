%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
%}

%%
"int"|"float"|"double"|"bool"|"void" {return KEY;}
[a-zA-Z][a-zA-Z0-9]* {printf("Identifier is %s\n", yytext); return IDEN;}
[0-9]+ {return NUM;}
[ \n\t] ;
# {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
    return 1;
}
