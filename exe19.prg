Set Color to m/w*
Set ScoreBoard Off
Set Cursor Off
clear

nTabIncrementa := 0
nControle      := 0
nCalculo       := 0
nNumDigitado   := 0
nLInha         := 1

@ 01,01 say 'Tabuada do:    ( 0 = TODAS )'
@ 01,13 get nNumDigitado picture '99' valid nNumDigitado >= 0 .and. nNumDigitado <= 10
read
clear

//Aqui mostrar  o resultado se o nNumDigitado nÆo for zero.
If ( nNumDigitado > 0 .and. nNumDigitado <= 10 )

   @ 00,00 to 11,16 Double
   do While nLinha <= 10
      nCalculo += nNumDigitado
      InKey(0.05)
      @ nLinha,02 say +AllTrim(Str(nNumDigitado))+ ' * ' +AllTrim(StrZero(nLinha ,2 ))+ ' = ' +AllTrim(Str(nCalculo))
      nLinha ++
   Enddo

Endif

//Aqui mostrar  todas as tabuadas de 1 at‚ 10, pois o nNumDigitado = 0 .
If Empty(nNumDigitado)

   do While nControle >= 0 .and. nControle < 10
      InKey(0.05)
      @ nLinha,02 say +AllTrim(Str(nTabIncrementa))+ ' * ' +AllTrim(StrZero(nLinha ,2 ))+ ' = ' +AllTrim(Str(nCalculo))
      nLinha ++
      nControle := nControle + 1
   Enddo















Endif

InKey(0)
clear
