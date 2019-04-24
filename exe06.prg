Set Color to m/w*
clear

nNumero1    := 0
nNumero2    := 0
nNumero3    := 0
nMedia      := 0
cNomeUsuario:= space(30)
dDataAtual  := Date()

@ 01,01 to 10,60 Double

@ 03,03 say 'Digite seu nome:'
@ 04,03 say 'Digite o primeiro valor:'
@ 05,03 say 'Digite o segundo valor.:'
@ 06,03 say 'Digite o terceiro valor:'

@ 03,20 get cNomeUsuario picture '@!'     valid !Empty(cNomeUsuario)
@ 04,28 get nNumero1     picture '999.99' valid nNumero1 > 0
@ 05,28 get nNumero2     picture '999.99' valid nNumero2 > 0
@ 06,28 get nNumero3     picture '999.99' valid nNumero3 > 0
read

nMedia := ((nNumero1+nNumero2+nNumero3)/3)
clear

@ 01,01 to 04,55 Double

@ 02,26 say DToC(dDataAtual)
@ 03,03 say '' +AllTrim(cNomeUsuario)
@ 03,34 say ',sua m‚dia ‚:'

Set Color to b/w*

@ 03,48 say +AllTrim(Str(nMedia))
@ 11,01 say ''

InKey(0)
clear
