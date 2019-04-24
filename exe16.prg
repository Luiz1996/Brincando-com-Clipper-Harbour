Set Color to w+/m
Set Cursor Off
clear

cNome       := Space(40)
nCor        := 0
nContador   := 1
nLinha      := 1
nRepeteNome := 0


@ 01,01 say 'Nome:'
@ 02,01 say 'Quantas vezes devo imprimir seu Nome?'

@ 01,07 get cNome       picture '@!'  valid !Empty(cNome)
@ 02,40 get nRepeteNome picture '999' valid nRepeteNome > 0
read

clear

do While  nContador <= nRepeteNome

//Alternando cores da fonte.
   If ( nCor = 1 )
      Set Color to gr+/m
   Elseif ( nCor = 2 )
      Set Color to b+++/m
   Elseif ( nCor = 3 )
      Set Color to w+/m
   Elseif ( nCor = 4 )
      Set Color to rb+/m
   Elseif ( nCor = 5 )
      Set Color to g+/m
   Elseif ( nCor = 6 )
      Set Color to bg+/m
   Elseif ( nCor = 7 )
      Set Color to gr/m
   Elseif ( nCor = 8 )
      Set Color to w+/m
   Elseif ( nCor = 9 )
      Set Color to r+/m
   Elseif ( nCor = 10 )
      Set Color to b/m
    Elseif ( nCor = 11 )
      Set Color to b+++/m
   Elseif ( nCor = 12 )
      Set Color to w+/m
   Elseif ( nCor = 13 )
      Set Color to rb+/m
   Elseif ( nCor = 14 )
      Set Color to g+/m
   Elseif ( nCor = 15 )
      Set Color to bg+/m
   Elseif ( nCor = 16 )
      Set Color to gr/m
   Elseif ( nCor = 17 )
      Set Color to w+/m
   Elseif ( nCor = 18 )
      Set Color to r+/m
   Elseif ( nCor = 19 )
      Set Color to b+++/m
   Elseif ( nCor = 20 )
      Set Color to w+/m
   Elseif ( nCor = 21 )
      Set Color to br+/m
   Elseif ( nCor = 22 )
      Set Color to g+/m
   Elseif ( nCor = 23 )
      Set Color to bg+/m
   Endif


//limpa tela quando ela estiver impressa por completo.
   If ( nLinha > 23 )
      Inkey(1)
      @ 1,0 clear to 23,54
      nLinha := 1
      nCor   := 1
   Endif
//Tabela, impress∆o do nome e quantidade de vezes que est† repetindo.
   @ 00,00 to 24,55 Double
   @ nLinha ,3 say +AllTrim(cNome) + ' ' +AllTrim(Str(nContador)) + 'Vez(es)'
   Inkey(0.1)

   If LastKey() == 27
      exit
   Endif

//Incremento dos valores para manuntená∆o do while.
   nContador ++
   nCor      ++
   nLinha    ++

Enddo

InKey(0)
clear
