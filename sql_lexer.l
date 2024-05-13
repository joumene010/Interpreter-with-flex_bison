%{
#include "sql_parser.tab.h"
#undef yywrap
int yywrap(void);


extern int yylineno;

int yylex(void);
void yyerror(const char*);

%}

%option noyywrap
%option case-insensitive


%%
"DELETE"    	{ printf("%s ----> *** DELETE Lexeme ***\n", yytext); return DELETE; } 
"SELECT"    	{ printf("%s ----> *** SELECT Lexeme ***\n", yytext); return SELECT; }
"UPDATE"    	{ printf("%s ----> *** UPDATE Lexeme ***\n", yytext); return UPDATE; }
"CREATE"    	{ printf("%s ----> *** CREATE Lexeme ***\n", yytext); return CREATE; }
"TABLE"     	{ printf("%s ----> *** TABLE Lexeme ***\n", yytext);  return TABLE; }
"LIMIT"     	{ printf("%s ----> *** LIMIT Lexeme ***\n", yytext);  return LIMIT; }
"FROM"     	    { printf("%s ----> *** FROM Lexeme ***\n", yytext);  return FROM; }
"SET"     	    { printf("%s ----> *** SET Lexeme ***\n", yytext);  return SET; } 
"WHERE"     	{ printf("%s ----> *** WHERE Lexeme ***\n", yytext);  return WHERE; }
"ORDER BY"     	{ printf("%s ----> *** ORDER-BY Lexeme ***\n", yytext);  return ORDER_BY; }
"GROUP BY"     	{ printf("%s ----> *** GROUP-BY Lexeme ***\n", yytext);  return GROUP_BY; }
"AVG"     	    { printf("%s ----> *** AVG Lexeme ***\n", yytext);  return AVG; }
"COUNT"     	{ printf("%s ----> *** COUNT Lexeme ***\n", yytext);  return COUNT; }
"FIRST"     	{ printf("%s ----> *** FIRST Lexeme ***\n", yytext);  return FIRST; }
"LAST"      	{ printf("%s ----> *** LAST Lexeme ***\n", yytext);  return LAST; }
"MAX"       	{ printf("%s ----> *** MAX Lexeme ***\n", yytext);  return MAX; }
"MIN"     	    { printf("%s ----> *** MIN Lexeme ***\n", yytext);  return MIN; }
"SUM"     	    { printf("%s ----> *** SUM Lexeme ***\n", yytext);  return SUM; }
"UNIQUE"     	{ printf("%s ----> *** UNIQUE Lexeme ***\n", yytext);  return UNIQUE; }
"FOREIGN KEY"   { printf("%s ----> *** FOREIGN KEY Lexeme ***\n", yytext);  return FOREIGN_KEY; }
"REFERENCES"    { printf("%s ----> *** REFERENCES Lexeme ***\n", yytext);  return REFERENCES; }
"ON DELETE"     { printf("%s ----> *** ON DELETE Lexeme ***\n", yytext);  return ON_DELETE; }
"ON UPDATE"     { printf("%s ----> *** ON UPDATE Lexeme ***\n", yytext);  return ON_UPDATE; }
"CASCADE"     	{ printf("%s ----> *** CASCADE Lexeme ***\n", yytext);  return CASCADE; }
"SET NULL"     	{ printf("%s ----> *** SET NULL Lexeme ***\n", yytext);  return SET_NULL; }
"SET DEFAULT"   { printf("%s ----> *** SET DEFAULT Lexeme ***\n", yytext);  return SET_DEFAULT; }
"ASC"     	    { printf("%s ----> *** ASC Lexeme ***\n", yytext);  return ASC; }
"DESC"     	    { printf("%s ----> *** DESC Lexeme ***\n", yytext);  return DESC; }
"PRIMARY KEY" 	{ printf("%s ----> *** PRIMARY_KEY Lexeme ***\n", yytext); return PRIMARY_KEY; }
"VARCHAR"		{ printf("%s ----> *** DATATYPE Lexeme ***\n", yytext); return DATATYPE; }
"DECIMAL"		{ printf("%s ----> *** DECIMAL Lexeme ***\n", yytext); return DECIMAL; }
"INTEGER"		{ printf("%s ----> *** DATATYPE Lexeme ***\n", yytext); return DATATYPE; }
"DATE"			{ printf("%s ----> *** DATATYPE Lexeme ***\n", yytext); return DATATYPE; }
"INT"			{ printf("%s ----> *** DATATYPE Lexeme ***\n", yytext); return DATATYPE; }
"AND"           { printf("%s ----> *** AND Lexeme ***\n", yytext); return AND; }
"NOT"           { printf("%s ----> *** NOT Lexeme ***\n", yytext); return NOT; }
"OR"            { printf("%s ----> *** OR Lexeme ***\n", yytext); return OR; }
"AS"            { printf("%s ----> *** AS Lexeme ***\n", yytext); return AS; }
"="             { printf("%s ----> *** EQ Lexeme ***\n", yytext); return EQ; }
"!="            { printf("%s ----> *** NE Lexeme ***\n", yytext); return NE; }
"<"             { printf("%s ----> *** LT Lexeme ***\n", yytext); return LT; }
"<="            { printf("%s ----> *** LE Lexeme ***\n", yytext); return LE; }
">"             { printf("%s ----> *** GT Lexeme ***\n", yytext); return GT; }
">="            { printf("%s ----> *** GE Lexeme ***\n", yytext); return GE; }
"LIKE"          { printf("%s ----> *** LIKE Lexeme ***\n", yytext); return LIKE; }
"IN"            { printf("%s ----> *** IN Lexeme ***\n", yytext); return IN; }
"BETWEEN"       { printf("%s ----> *** BETWEEN Lexeme ***\n", yytext); return BETWEEN; }
","      		{ printf("%s ----> *** COMMA Lexeme ***\n", yytext); return COMMA; }
"*"      		{ printf("%s ----> *** STAR Lexeme ***\n", yytext); return STAR; }
"("      		{ printf("%s ----> *** LPAREN Lexeme ***\n", yytext); return LPAREN; }
")"      		{ printf("%s ----> *** RPAREN Lexeme ***\n", yytext); return RPAREN; }
[0-9]+      	{ printf("%s ----> *** NUMBER Lexeme ***\n", yytext); return NUMBER; }
\"[^\"]*\"      { printf("%s ----> *** STRING Lexeme ***\n", yytext); yylval.strval = strdup(yytext); return STRING_VALUE; }
\'[^\']*\'      { printf("%s ----> *** STRING Lexeme ***\n", yytext); yylval.strval = strdup(yytext); return STRING_VALUE; }
[A-Za-z_][A-Za-z0-9_]* 	{ yylval.strval = strdup(yytext); printf("%s ----> *** IDENTIFIER Lexeme ***\n", yytext); return IDENTIFIER; }
\n        { yylineno++; }
[ \t\n]     	{ /* ignore whitespace */ }
.           	{ printf("%s %s\n", yytext, yytext); }
%%


int yywrap() { return 1; }

