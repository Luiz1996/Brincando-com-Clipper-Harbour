Set Color to m/w*
clear

do while .t.

   nCodCli := 0
   @ 12,10 say 'Informe o c¢digo do cliente:'

   @ 12,40 get nCodCli picture '999,999'
   read

   If lastKey() == 27
      exit
   Endif


Enddo

InKey(0)
clear
