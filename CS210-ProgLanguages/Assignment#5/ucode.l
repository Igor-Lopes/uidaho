%{

// Igor Lopes - CS210 - HW#4

#include <stdio.h>
#include "ucode.tab.h"

%}

%option noyywrap
%option yylineno
%%

[\t \n]+		{ 	      }
\#[^\n]+		{	      }
U[0-9]+\.[0-9]+\.00	{ return VERSIONSTAMP; }
[a-zA-Z0-9\-\\\/\,\;\_]+\.u1\-[0-9\-]+	{ return UCODESTAMP; }
0[0-7]{2,}		{ return OCTCONST; }
[-+]?[0-9]+			{ return DECCONST; }
[0-9]+r[0-9a-fA-F]+    { return DECCONST; }
[0-9]+\.[0-9]+\e-[0-9]  { return DECCONST; }
[0-9]+\,[0-9]+\,[0-9]\e-[0-9]+ { return DECCONST; }
[0-9]+\,[0-9]+\,[0-9]+\E-[0-9]+ { return DECCONST; }
","			{ return COMMA; }
\f			{ return CONTROL_L; }
[-+]?[0-9]*\.?[0-9]+		{ return REALCONST; }
[a-zA-Z0-9\-\\\/\,\;\_]+\.[a-zA-Z]+ { return FILENAME; }
L[0-9]+			{ return LABEL; }
"any"			{ return ANY; }
"uid"                           { return Op_Uid; }
"con"                      	{ return Op_Con; }
"impl" 				{ return Op_Impl;}
"bscan"	                        { return Op_Bscan; }
"ccase"	                        { return Op_Ccase; }
"chfail"	                { return Op_Chfail; }
"coact"                         { return Op_Coact; }
"cofail"	                { return Op_Cofail; }
"coret" 	                { return Op_Coret; }
"create"	                { return Op_Create; }
"cset"  	                { return Op_Cset; }
"dup"   	                { return Op_Dup; }
"efail" 	                { return Op_Efail; }
"einit" 	                { return Op_EInit; }
"eret"  	                { return Op_Eret; }
"escan" 	                { return Op_Escan; }
"esusp" 	                { return Op_Esusp; }
"field"                         { return Op_Field; }
"goto"                          { return Op_Goto; }
"init"                          { return Op_Init; }
"int"                           { return Op_Int; }
"invoke"                        { return Op_Invoke; }
"keywd"                         { return Op_Keywd; }
"limit"                         { return Op_Limit; }
"line"                          { return Op_Line; }
"llist"                         { return Op_Llist; }
"lsusp"                         { return Op_Lsusp; }
"mark"                          { return Op_Mark; }
"pfail"                         { return Op_Pfail; }
"pnull"                         { return Op_Pnull; }
"pop"                           { return Op_Pop; }
"pret"                          { return Op_Pret; }
"psusp"                         { return Op_Psusp; }
"push1"                         { return Op_Push1; }
"pushn1"                        { return Op_Pushn1; }
"real"                          { return Op_Real; }
"sdup"                          { return Op_Sdup; }
"str"                           { return Op_Str; }
"unmark"                        { return Op_Unmark; }
"var"                           { return Op_Var; }
"arg"                           { return Op_Arg; }
"static"                        { return Op_Static; }
"local"                         { return Op_Local; }
"global"                        { return Op_Global; }
"mark0"                         { return Op_Mark0; }
"quit"                          { return Op_Quit; }
"fquit"                         { return Op_FQuit; }
"tally"                         { return Op_Tally; }
"apply"                         { return Op_Apply; }
"asgn"                          { return Op_Asgn; }
"bang"                          { return Op_Bang; }
"cat"                           { return Op_Cat; }
"compl"                         { return Op_Compl; }
"diff"                          { return Op_Diff; }
"div"                           { return Op_Div; }
"eqv"                           { return Op_Eqv; }
"inter"                         { return Op_Inter; }
"lconcat"                       { return Op_Lconcat; }
"lexeq"                         { return Op_Lexeq; }
"lexge"                         { return Op_Lexge; }
"lexgt"                         { return Op_Lexgt; }
"lexle"                         { return Op_Lexle; }
"lexlt"                         { return Op_Lexlt; }
"lexne"                         { return Op_Lexne; }
"minus"                         { return Op_Minus; }
"mod"                           { return Op_Mod; }
"mult"                          { return Op_Mult; }
"neg"                           { return Op_Neg; }
"neqv"                          { return Op_Neqv; }
"nonnull"                       { return Op_Nonnull; }
"null"                          { return Op_Null; }
"number"                        { return Op_Number; }
"numeq"                         { return Op_Numeq; }
"numge"                         { return Op_Numge; }
"numgt"                         { return Op_Numgt; }
"numle"                         { return Op_Numle; }
"numlt"                         { return Op_Numlt; }
"numne"                         { return Op_Numne; }
"plus"                          { return Op_Plus; }
"power"                         { return Op_Power; }
"random"                        { return Op_Random; }
"rasgn"                         { return Op_Rasgn; }
"rcv"                           { return Op_Rcv; }
"rcvBk"                         { return Op_RcvBk; }
"refresh"                       { return Op_Refresh; }
"rswap"                         { return Op_Rswap; }
"sect"                          { return Op_Sect; }
"snd"                           { return Op_Snd; }
"sndBk"                         { return Op_SndBk; }
"size"                          { return Op_Size; }
"subsc"                         { return Op_Subsc; }
"swap"                          { return Op_Swap; }
"tabmat"                        { return Op_Tabmat; }
"toby"                          { return Op_Toby; }
"unions"                        { return Op_Unions; }
"value"                         { return Op_Value; }
"acset"                         { return Op_Acset; }
"areal"                         { return Op_Areal; }
"astr"                          { return Op_Astr; }
"aglobal"                       { return Op_Aglobal; }
"astatic"                       { return Op_Astatic; }
"agoto"                         { return Op_Agoto; }
"amark"                         { return Op_Amark; }
"noop"                          { return Op_Noop; }
"colm"                          { return Op_Colm; }
"proc"                          { return Op_Proc; }
"declend"                       { return Op_Declend; }
"end"                           { return Op_End; }
"link"                          { return Op_Link; }
"version"                       { return Op_Version; }
"filen"                         { return Op_Filen; }
"record"                        { return Op_Record; }
"error"                         { return Op_Filen; }
"trace"                         { return Op_Colm; }
"lab"                           { return Op_Lab; }
"invocable"                     { return Op_Invocable; }
"copyd"                         { return Op_Copyd; }
"trapret"                       { return Op_Trapret; }
"trapfail"                      { return Op_Trapfail; }
"synt"                          { return Op_Synt; }

[a-zA-Z0-9\_]+		{ return IDENTIFIER; }

%%
