%{
#include <stdio.h>
int posint = 0, negint = 0, posfrac = 0, negfrac = 0, i = 0 ;
%}

%%

[+]?[0-9]+ {posint++;}
[-][0-9]+ {negint++;}
[+]?[0-9]*[\.][0-9]* {posfrac++;}
[-][0-9]*[\.][0-9]* {negfrac++;}
([+]?[0-9]+)[\/]([+]?[0-9]+) {posfrac++;}
([-][0-9]+)[\/]([-][0-9]+) {posfrac++;}
([+]?[0-9]+)[\/]([-][0-9]+) {negfrac++;}
([-][0-9]+)[\/]([+]?[0-9]+) {negfrac++;}
[\n] {return 0;}
[.] {i++;}



%%

int yywrap(){}

void main() {
	printf("Enter numbers");
	yylex();
	printf("Positive integers: %d\n", posint);
	printf("Negative integers: %d\n", negint);
	printf("Positive fractions: %d\n", posfrac);
	printf("Negative fractions: %d\n", negfrac);
	
	if(i)
	{
		printf("INVALID\n");
		return;
	}
}
