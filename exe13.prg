Set Color to m/w*
Set Confirm On
Set Date British
Set Cursor Off
clear

dDataAtual     := Date()
nCodigo        := 0
cClassificacao := Space(45)

@ 01,01 to 05,79 Double
@ 03,02 to 03,78

@ 02,03 say 'C¢digo do Produto:'
@ 04,03 say 'Classificacao:'

do while nCodigo == 0

@ 02,22 get nCodigo picture '99' valid nCodigo>=0
read


   If ( nCodigo = 1 )
      cClassificacao := 'Alimento Nao-Perec¡vel'

   Elseif ( nCodigo >= 2 .and. nCodigo <=4 )
      cClassificacao := 'Alimento Perec¡vel'

   Elseif ( nCodigo >= 5 .and. nCodigo <= 6 )
      cClassificacao := 'Vestu rio'

   Elseif ( nCodigo == 7 )
      cClassificacao := 'Higiene Pessoal'

   Elseif ( nCodigo >=8 .and. nCodigo <=15 )
      cClassificacao := 'Limpeza e Utens¡lios Dom‚sticos'

   Else
        nCodigo := 0
        Alert ('C¢digo Inv lido!',,'m/r*')
   Endif

@ 04,18 say +AllTrim(cClassificacao)

enddo

InKey(0)
clear
