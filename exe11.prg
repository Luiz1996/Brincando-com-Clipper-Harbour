Set Color to m/w*
Set Cursor Off
Set Date British
clear

cCategoria   := Space(25)
cNomeNadador := Space(40)
nIdade       := 0
dDataAtual   := Date()

@ 01,01 to 08,79 Double

@ 03,03 say 'Digite seu Nome:'
@ 04,03 say 'Informe sua Idade:'
@ 04,65 say +DToC(dDataAtual)

@ 03,19 get cNomeNadador picture '@!'   valid !Empty(cNomeNadador)
@ 04,21 get nIdade       picture '999'  valid nIdade>0
read

If ( nIdade < 5 )
   cCategoria := 'IDADE INSUFICIENTE'
Elseif ( nIdade >= 5 .and. nIdade <= 7 )
   cCategoria := 'INFANTIL A'
Elseif ( nIdade > 7 .and. nIdade <= 10 )
   cCategoria := 'INFANTIL B'
Elseif ( nIdade > 10 .and. nIdade <= 13 )
   cCategoria := 'JUVENIL A'
Elseif ( nIdade > 13 .and. nIdade <= 17 )
   cCategoria := 'JUVENIL B'
Else
   cCategoria := 'SENIOR!'
Endif

clear

@ 01,01 to 06,79 Double
@ 04,02 to 04,78

@ 02,03 say 'Nadador..: '  +AllTrim(cNomeNadador)
@ 03,03 say 'Idade....: '  +AllTrim(Str(nIdade))+ ' Anos.'
@ 02,65 say                +DToC(dDataAtual)
@ 05,03 say 'Categoria: '
@ 05,14 say  +AllTrim(cCategoria) Color ('b+/w*')
@ 07,01 say ''

InKey(0)
clear
