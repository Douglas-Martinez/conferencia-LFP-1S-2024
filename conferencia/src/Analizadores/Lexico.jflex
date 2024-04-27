package Analizadores;

import java_cup.runtime.Symbol;

%%
%class Lexico
%public
%cupsym sym
%line
%column
%cup
%unicode
%8bit
%full

BLANCOS=[ \r\t\n]+

ENTERO = [0-9]+
DOBLE = [0-9]+"."[0-9]+

%state COM, COMSL
%%


<YYINITIAL> {
    "OPERAR" {return new Symbol(sym.Res_Operar,(yyline+1),(yycolumn+1),yytext());}

    ";" {return new Symbol(sym.Sim_PyC,(yyline+1),(yycolumn+1),yytext());}

    "(" {return new Symbol(sym.Sim_ParA,(yyline+1),(yycolumn+1),yytext());}
    ")" {return new Symbol(sym.Sim_ParC,(yyline+1),(yycolumn+1),yytext());}
    "+" {return new Symbol(sym.Sim_Mas,(yyline+1),(yycolumn+1),yytext());}
    "-" {return new Symbol(sym.Sim_Menos,(yyline+1),(yycolumn+1),yytext());}
    "*" {return new Symbol(sym.Sim_Por,(yyline+1),(yycolumn+1),yytext());}
    "/" {return new Symbol(sym.Sim_Div,(yyline+1),(yycolumn+1),yytext());}
        
    {BLANCOS} {}
    {ENTERO} {return new Symbol(sym.TK_Entero,(yyline+1),(yycolumn+1),yytext());}
    {DOBLE} {return new Symbol(sym.TK_Doble,(yyline+1),(yycolumn+1),yytext());}
    "/*" {yybegin(COM);}
    "//" {yybegin(COMSL);}
    . {
        System.err.println("Error Lexico. " + yytext() + " - Fila: " + (yyline+1) + " - Columna: " + (yycolumn+1));
    }
}

<COM> {
    "*/" {yybegin(YYINITIAL);}
    . {}
    {BLANCOS} {}
}

<COMSL> {
    [\n] {yybegin(YYINITIAL);}
    [BLANCOS] {}
    . {}
}