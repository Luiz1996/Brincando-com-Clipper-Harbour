Set Color to m/w*
Set Cursor Off
Set ScoreBoard Off
clear

@ 00,00 to 00,79 double

do While .t.



   cInvertida := ''
   cPalavra   := Space(36)
   nContador  := 0


   @ 01,01 say 'Digite uma Palavra:'
   @ 01,20 get cPalavra picture '@!' valid !Empty(cPalavra)
   read

   If LastKey() == 27
      exit
   Endif

   nContador := Len(AllTrim(cPalavra))

   do While nContador > 0

      cInvertida += SubStr( cPalavra, nContador , 1 )

      nContador --

   Enddo


   //Imprimindo resultado invertido em Min£sculo e em Mai£sculo.
   cInvertida:= Lower(cInvertida)
   @ 02,20 say AllTrim(cInvertida)
   @ 03,20 say 'Ou'
   cInvertida:= Upper(cInvertida)
   @ 04,20 say AllTrim(cInvertida)
   InKey(0)
   clear
Enddo

InKey(0)
clear
