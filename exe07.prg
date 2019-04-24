Set Color to m/w*
Set Date British
clear

nNumero1       := 0
nNumero2       := 0
nSoma          := 0
nSubtracao     := 0
nDivisao       := 0
nMultiplicacao := 0
cNomeUsuario   := Space(40)
dDataAtual     := Date()

@ 01,01 to 07,60 Double

@ 03,03 say 'Digite seu Nome:'
@ 04,03 say 'Digite o primeiro valor:'
@ 05,03 say 'Digite o segundo valor.:'

@ 03,19 get cNomeUsuario picture '@!'    valid !Empty(cNomeUsuario)
@ 04,28 get nNumero1     picture '999.99'valid nNumero1 > 0
@ 05,28 get nNumero2     picture '999.99'valid nNumero2 > 0
read

nSoma          := (nNumero1 + nNumero2)
nSubtracao     := (nNumero1 - nNumero2)
nMultiplicacao := (nNumero1 * nNumero2)
nDivisao       := (nNumero1 / nNumero2)

clear

@ 01,01 to 03,67 Double
@ 04,01 to 06,34
@ 04,35 to 06,67
@ 07,01 to 09,34
@ 07,35 to 09,67


@ 02,03 say 'Nome:'+AllTrim(cNomeUsuario)
@ 02,56 say DToC(dDataAtual)
@ 05,02 say 'Soma:'+AllTrim(Str(nSoma))
@ 05,36 say 'Subtracao:'+AllTrim(Str(nSubtracao))
@ 08,02 say 'Multiplicacao:'+AllTrim(Str(nMultiplicacao))
@ 08,36 say 'Divisao:'+AllTrim(Str(nDivisao))
@ 10,01 say ''

InKey(0)
clear

