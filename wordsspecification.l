%{
#include <stdio.h>
extern FILE *yyin;
int no_of_words = 0;
int total_size = 0;
%}

/* Definitions */
word    [a-zA-Z][a-zA-Z0-9_]*
notword [0-9]+[a-zA-Z0-9_]*

%%
{notword}       { /* Ignore tokens starting with a digit */ }
"abc"           { 
                    printf("ABC");
                    no_of_words++;
                    total_size += yyleng;
                }
{word}          { 
                    printf("%s", yytext);
                    no_of_words++;
                    total_size += yyleng;
                }
[ \t\n]+        { /* Skip whitespace characters */ }
.               { /* Ignore any other character */ }
%%

/* Define yywrap so that the linker finds it */
int yywrap(void) {
    return 1;
}

int main(int argc, char *argv[]){
    if (argc != 2){
        fprintf(stderr, "Usage: %s <input-file>\n", argv[0]);
        return 1;
    }
    yyin = fopen(argv[1], "r");
    if (!yyin){
        perror("Error opening file");
        return 1;
    }
    yylex();
    fclose(yyin);
    
    printf("\nNumber of words: %d\n", no_of_words);
    printf("Total size of words: %d characters\n", total_size);
    return 0;
}