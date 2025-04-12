%{
#include <stdio.h>
%}

%%
is|am|are|were|was|be|being|been    { printf("VERB: %s\n", yytext); }
do|does|did|will                     { printf("VERB: %s\n", yytext); }
would|should|can|could               { printf("VERB: %s\n", yytext); }
has|have|had|go                      { printf("VERB: %s\n", yytext); }
[ \t\n]+                             ;  // Ignore whitespace
.                                    ;  // Ignore other characters

%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
