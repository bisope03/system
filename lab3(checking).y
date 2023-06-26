%{ 
#include <stdio.h> 
int yylex(); 
void yyerror(); 
%} 
%token NOUN PRONOUN ADJECTIVE VERB ADVERB CONJUNCTION PREPOSITION 
%% 


sentence: compound {printf("COMPOND SENTENCE\n");} 
 | 
 simple {printf("SIMPLE SENTENCE\n");} 
 ; 
simple: subject VERB object; 
compound:simple CONJUNCTION simple;
subject: NOUN|PRONOUN; 
object: NOUN|ADJECTIVE NOUN|VERB NOUN|ADVERB NOUN|PREPOSITION NOUN|ADJECTIVE PREPOSITION NOUN;
%% 
void yyerror() 
{ 
  
} 
int main() 
{
yyparse(); 
return 0; 
}