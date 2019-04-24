nSet Color to w+/m
Set Cursor Off
clear

cNome     := Space(40)
nContador := 10
nLinha    := 3

@ 01,01 say 'Nome:'

@ 01,07 get cNome picture '@!' valid !Empty(cNome)
read

do While  nContador > 0

   If ( nContador = 1 )
      Set Color to gr+/m
   Elseif ( nContador = 2 )
      Set Color to b+++/m
   Elseif ( nContador = 3 )
      Set Color to w+/m
   Elseif ( nContador = 4 )
      Set Color to rb+/m
   Elseif ( nContador = 5 )
      Set Color to g+/m
   Elseif ( nContador = 6 )
      Set Color to bg+/m
   Elseif ( nContador = 7 )
      Set Color to gr/m
   Elseif ( nContador = 8 )
      Set Color to w+/m
   Elseif ( nContador = 9 )
      Set Color to r+/m
   Elseif ( nContador = 10 )
      Set Color to b/m
   Endif

   @ 02,01 to 13,44 Double
   @ nLinha ,3 say +AllTrim(cNome)
   Inkey(0.2)

   If LastKey() == 27
      exit
   Endif

   nContador --
   nLinha    ++
Enddo

InKey(0)
clear
