%{
  int nchar = 0, nword=0, nline = 0, ntab=0, nspace=0;
%}
%%
\n		{nline++; nchar++;}
[^ \t\n]+	{nword++; nchar += yyleng;}
[ ]		{nspace++; nchar++;}
[\t]	    {ntab++; nchar++;}
.		{nchar++;}
%%
int main(void){
yylex();

printf("Number of words are: %d\n", nword);
printf("Number of lines are: %d\n", nline);
printf("Number of spaces are: %d\n", nspace);
printf("Number of tab are: %d\n", ntab);
printf("Number of characters are: %d\n", nchar);
return 0;
}
int yywrap(void)
{
return 1;
}