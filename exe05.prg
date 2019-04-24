
Set Color to m/w*
clear

@ 01,01 to 07,28 Double

nNumero1  := 0
nNumero2  := 0
nAuxiliar := 0

@ 02,02 say 'Digite o A valor: '
@ 03,02 say 'Digite o B valor: '

@ 02,19 get nNumero1 picture '999.99' valid nNumero1 > 0
@ 03,19 get nNumero2 picture '999.99' valid nNumero2 > 0
read

nAuxiliar := nNumero2
nNumero2  := nNumero1
nNumero1  := nAuxiliar

@ 05,02 say 'O novo valor de A ‚:'+AllTrim(Str(nNumero1))
@ 06,02 say 'O novo valor de B ‚:'+Alltrim(Str(nNumero2))
@ 08,02 say ''

InKey(0)
clear
