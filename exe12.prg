Set Color to m/w*
Set Confirm On
Set Date British
Set Cursor Off
clear

do While .t.

   nMaiorValor := 0
   nNumero1    := 0
   nNumero2    := 0
   nNumero3    := 0
   dDataAtual  := Date()

   @ 01,01 to 08,79 Double
   @ 06,02 to 06,78

   @ 03,03 say 'Digite o Primeiro Numero:'
   @ 04,03 say 'Digite o Segundo  Numero:'
   @ 05,03 say 'Digite o Terceiro Numero:'
   @ 04,65 say +DToC(dDataAtual)
   @ 07,03 say 'O Maior Valor digitado ‚:'

   @ 03,28 get nNumero1 picture '999,999.99' valid nNumero1>0
   @ 04,28 get nNumero2 picture '999,999.99' valid nNumero2>0
   @ 05,28 get nNumero3 picture '999,999.99' valid nNumero3>0
   read

   If ( nNumero1 >= nNumero2 .and. nNumero1 >= nNumero3 )
      nMaiorValor := nNumero1

   Elseif ( nNumero2 >= nNumero1 .and. nNumero2 >= nNumero3 )
      nMaiorValor := nNumero2

   Elseif ( nNumero3 >= nNumero1 .and. nNumero3 >= nNumero2 )
      nMaiorValor := nNumero3

   Endif

   @ 07,28 say +AllTrim(Str(nMaiorValor))

   If ( nNumero1 = nNumero2 .and. nNumero2 = nNumero3)
      @ 07,28 say 'TODOS OS NUMEROS SAO IGUAIS!'
   Endif

   InKey(0)
   clear

Enddo
