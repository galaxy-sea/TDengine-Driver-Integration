package plus.wcj.jetbrains.plugins.tdengine.sql.lexer;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.TokenType;
import com.intellij.psi.tree.IElementType;
import plus.wcj.jetbrains.plugins.tdengine.sql.TdengineLexerUtil;
import plus.wcj.jetbrains.plugins.tdengine.sql.TdengineTokenTypes;
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineTypes;

%%

%public
%class _TdengineLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType

WHITE_SPACE=\s+
DIGIT=[0-9]
IDENT_START=[A-Za-z_]
IDENT_PART=[A-Za-z0-9_]
IDENT={IDENT_START}{IDENT_PART}*
INTEGER={DIGIT}+
FLOAT=(({DIGIT}+"."{DIGIT}*)|({DIGIT}*"."{DIGIT}+))([eE][+-]?{DIGIT}+)?|({DIGIT}+[eE][+-]?{DIGIT}+)
SINGLE_QUOTED=\'([^\'\r\n]|\'\')*\'
DOUBLE_QUOTED=\"([^\"\r\n]|\"\")*\"
BACKTICK_QUOTED=\`([^`\r\n]|``)*\`
LINE_COMMENT=("--"|"#")[^\r\n]*
BLOCK_HINT=\/\*\+([^*]|\*+[^*/])*\*+\/
STRING_NONE=\'([nN][oO][nN][eE])\'
STRING_LAST_ROW=\'([lL][aA][sS][tT]_[rR][oO][wW])\'
STRING_LAST_VALUE=\'([lL][aA][sS][tT]_[vV][aA][lL][uU][eE])\'
STRING_BOTH=\'([bB][oO][tT][hH])\'
STRING_MS=\'([mM][sS])\'
STRING_US=\'([uU][sS])\'
STRING_NS=\'([nN][sS])\'
STRING_SIMPLE8B=\'([sS][iI][mM][pP][lL][eE]8[bB])\'
STRING_BIT_PACKING=\'([bB][iI][tT]-[pP][aA][cC][kK][iI][nN][gG])\'
STRING_DELTA_I=\'([dD][eE][lL][tT][aA]-[iI])\'
STRING_DELTA_D=\'([dD][eE][lL][tT][aA]-[dD])\'
STRING_DISABLED=\'([dD][iI][sS][aA][bB][lL][eE][dD])\'
STRING_BSS=\'([bB][sS][sS])\'
STRING_LZ4=\'([lL][zZ]4)\'
STRING_ZLIB=\'([zZ][lL][iI][bB])\'
STRING_ZSTD=\'([zZ][sS][tT][dD])\'
STRING_TSZ=\'([tT][sS][zZ])\'
STRING_XZ=\'([xX][zZ])\'
STRING_HIGH=\'([hH][iI][gG][hH])\'
STRING_MEDIUM=\'([mM][eE][dD][iI][uU][mM])\'
STRING_LOW=\'([lL][oO][wW])\'
STRING_H=\'([hH])\'
STRING_M=\'([mM])\'
STRING_L=\'([lL])\'

%%

{WHITE_SPACE}       { return TokenType.WHITE_SPACE; }
{LINE_COMMENT}      { return TdengineTokenTypes.LINE_COMMENT; }
{BLOCK_HINT}       { return TdengineTypes.BLOCK_HINT; }
{STRING_NONE}       { return TdengineTypes.STRING_LITERAL_NONE; }
{STRING_LAST_ROW}   { return TdengineTypes.STRING_LITERAL_LAST_ROW; }
{STRING_LAST_VALUE} { return TdengineTypes.STRING_LITERAL_LAST_VALUE; }
{STRING_BOTH}       { return TdengineTypes.STRING_LITERAL_BOTH; }
{STRING_MS}         { return TdengineTypes.STRING_LITERAL_MS; }
{STRING_US}         { return TdengineTypes.STRING_LITERAL_US; }
{STRING_NS}         { return TdengineTypes.STRING_LITERAL_NS; }
{STRING_SIMPLE8B}   { return TdengineTypes.STRING_LITERAL_SIMPLE8B; }
{STRING_BIT_PACKING} { return TdengineTypes.STRING_LITERAL_BIT_PACKING; }
{STRING_DELTA_I}    { return TdengineTypes.STRING_LITERAL_DELTA_I; }
{STRING_DELTA_D}    { return TdengineTypes.STRING_LITERAL_DELTA_D; }
{STRING_DISABLED}   { return TdengineTypes.STRING_LITERAL_DISABLED; }
{STRING_BSS}        { return TdengineTypes.STRING_LITERAL_BSS; }
{STRING_LZ4}        { return TdengineTypes.STRING_LITERAL_LZ4; }
{STRING_ZLIB}       { return TdengineTypes.STRING_LITERAL_ZLIB; }
{STRING_ZSTD}       { return TdengineTypes.STRING_LITERAL_ZSTD; }
{STRING_TSZ}        { return TdengineTypes.STRING_LITERAL_TSZ; }
{STRING_XZ}         { return TdengineTypes.STRING_LITERAL_XZ; }
{STRING_HIGH}       { return TdengineTypes.STRING_LITERAL_HIGH; }
{STRING_MEDIUM}     { return TdengineTypes.STRING_LITERAL_MEDIUM; }
{STRING_LOW}        { return TdengineTypes.STRING_LITERAL_LOW; }
{STRING_H}          { return TdengineTypes.STRING_LITERAL_H; }
{STRING_M}          { return TdengineTypes.STRING_LITERAL_M; }
{STRING_L}          { return TdengineTypes.STRING_LITERAL_L; }
{SINGLE_QUOTED}     { return TdengineTypes.STRING_LITERAL; }
{DOUBLE_QUOTED}     { return TdengineTypes.STRING_LITERAL; }
{BACKTICK_QUOTED}   { return TdengineTypes.IDENTIFIER; }
"0"                 { return TdengineTypes.ZERO_LITERAL; }
"1"                 { return TdengineTypes.ONE_LITERAL; }
"2"                 { return TdengineTypes.TWO_LITERAL; }
{FLOAT}             { return TdengineTypes.NUMBER_LITERAL; }
{INTEGER}           { return TdengineTypes.NUMBER_LITERAL; }

"*"                 { return TdengineTypes.ASTERISK; }
","                 { return TdengineTypes.COMMA_SIGN; }
"<>"                { return TdengineTypes.NEQ_ANGLE; }
"!="                { return TdengineTypes.NEQ_BANG; }
">="                { return TdengineTypes.GE_SIGN; }
"<="                { return TdengineTypes.LE_SIGN; }
"="                 { return TdengineTypes.EQ_SIGN; }
">"                 { return TdengineTypes.GT_SIGN; }
"<"                 { return TdengineTypes.LT_SIGN; }
"("                 { return TdengineTypes.LPAREN; }
")"                 { return TdengineTypes.RPAREN; }
";"                 { return TdengineTypes.SEMICOLON; }
"."                 { return TdengineTypes.DOT_SIGN; }
":"                 { return TdengineTypes.COLON_SIGN; }
"+"                 { return TdengineTypes.PLUS_SIGN; }
"-"                 { return TdengineTypes.MINUS_SIGN; }
"/"                 { return TdengineTypes.SLASH_SIGN; }
"?"                 { return TdengineTypes.QUESTION_SIGN; }
">>"                { return TdengineTypes.EXPORT_TO; }

{IDENT}             { return TdengineLexerUtil.lookupKeyword(yytext(), TdengineTypes.IDENTIFIER); }

[^]                 { return TokenType.BAD_CHARACTER; }
