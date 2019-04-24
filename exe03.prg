set color to m / w*

clear

nNumero1 := 2
nNumero2 := 3
nProduto := (nNumero1*nNumero2)

@ 01,01 to 13,50 Double   //01,01= linha e coluna inicial
                          //10,50= linha e coluna final
@ 04,09 say '    O produto entre 2 e 3 ‚:'+AllTrim(Str(nProduto,1))

nNumero  := 1000
nDivisor := 3
nDivisao := (nNumero/nDivisor)

@ 07,02 say ''
@ 08,04 say 'A divisao de 1000 por 3 dar  como resultado:'
@ 09,04 say 'Resultado ‚:'+AllTrim(Str(nDivisao))
@ 14,01 say ''

InKey(0)
clear

