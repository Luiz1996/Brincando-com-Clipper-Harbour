Set Color to m/w*
clear
Set Cursor Off

nContador1 := 1
nContador2 := 10
nLinha1    := 2
nLinha2    := 2

@ 00,00 to 13,11 Double

do While nContador1 <= 10

   //Mudando de cor na hora de imprimir o n£mero.
   If ( nContador1 = 1 )
      Set Color to m/w*
   Elseif ( nContador1 = 2 )
      Set Color to b+++/w*
   Elseif ( nContador1 = 3 )
      Set Color to gr+/w*
   Elseif ( nContador1 = 4 )
      Set Color to rb+/w*
   Elseif ( nContador1 = 5 )
      Set Color to g+/w*
   Elseif ( nContador1 = 6 )
      Set Color to m/w*
   Elseif ( nContador1 = 7 )
      Set Color to gr/w*
   Elseif ( nContador1 = 8 )
      Set Color to bg+/w*
   Elseif ( nContador1 = 9 )
      Set Color to r+/w*
   Elseif ( nContador1 = 10 )
      Set Color to b/w*
   Endif

   //imprime o n£mero e incrementa o nContador1 e nLinha1 para manuten‡Æo do while.
   @ nLinha1,03 say +AllTrim(Str(nContador1))
   nContador1 ++
   nLinha1    ++

   InKey(0.2)

   If LastKey() == 27
      exit
   Endif
Enddo

do While  nContador2 > 0

   //Mudando de cor na hora de imprimir o n£mero.
   If ( nContador2 = 10 )
      Set Color to m/w*
   Elseif ( nContador2 = 9 )
      Set Color to b+++/w*
   Elseif ( nContador2 = 8 )
      Set Color to gr+/w*
   Elseif ( nContador2 = 7 )
      Set Color to rb+/w*
   Elseif ( nContador2 = 6 )
      Set Color to g+/w*
   Elseif ( nContador2 = 5 )
      Set Color to m/w*
   Elseif ( nContador2 = 4 )
      Set Color to gr/w*
   Elseif ( nContador2 = 3 )
      Set Color to bg+/w*
   Elseif ( nContador2 = 2 )
      Set Color to r+/w*
   Elseif ( nContador2 = 1 )
      Set Color to b/w*
   Endif

   //imprime o n£mero, decrementa o nContador2 e incrementa o nLinha2 para manuten‡Æo do while.
   @ nLinha2,07 say +AllTrim(Str(nContador2))
   nContador2 --
   nLinha2    ++

   InKey(0.2)

   If LastKey() == 27
      exit
   Endif
Enddo

InKey(0)
clear
