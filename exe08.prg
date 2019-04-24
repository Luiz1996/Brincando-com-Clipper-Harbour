Set Date British
Set Cursor Off
Set Color to m/w*
clear

do While .t.

   cNomeComprador := Space(50)
   cNomeProd1     := Space(26)
   cNomeProd2     := Space(26)
   cNomeProd3     := Space(26)
   nQuantProd1    := 0
   nQuantProd2    := 0
   nQuantProd3    := 0
   nPrecoProd1    := 0
   nPrecoProd2    := 0
   nPrecoProd3    := 0
   nValUnit1      := 0
   nValUnit2      := 0
   nValUnit3      := 0
   nTotalCompra   := 0
   dDataCompra    := Date()


   @ 01,01 to 13,78 Double
   @ 03,02 to 03,77 Double
   @ 05,03 to 05,76
   @ 07,03 to 07,76
   @ 09,03 to 09,76
   @ 11,03 to 11,76
   @ 04,30 to 10,30
   @ 04,43 to 10,43
   @ 04,58 to 10,58



   @ 02,03 say 'Nome Comprador:'
   @ 04,11 say 'Descricao:'
   @ 04,33 say ' Quant.:'
   @ 04,47 say ' Preco:'
   @ 04,63 say ' Val.Unit:'
   @ 02,69 say DToC(dDataCompra)

   @ 02,18 get cNomeComprador picture '@!'         valid !Empty(cNomeComprador)
   @ 06,03 get cNomeProd1     picture '@!'         valid !Empty(cNomeProd1)
   @ 06,37 get nQuantProd1    picture '999999'     valid nQuantProd1 > 0
   @ 06,48 get nPrecoProd1    picture '999,999.99' valid nPrecoProd1 > 0
   read

   nValUnit1 := (nQuantProd1 * nPrecoProd1)
   @ 06,62 say ''+AllTrim(Str(nValUnit1))
   nTotalCompra:=(nValUnit1 + nValUnit2 + nValUnit3)
   @ 12,42 say ' Total da Compra:  '+AllTrim(Str(nTotalCompra))

   @ 08,03 get cNomeProd2     picture '@!'         valid !Empty(cNomeProd2)
   @ 08,37 get nQuantProd2    picture '999999'     valid nQuantProd2 > 0
   @ 08,48 get nPrecoProd2    picture '999,999.99' valid nPrecoProd2 > 0
   read

   nValUnit2 := (nQuantProd2 * nPrecoProd2)
   @ 08,62 say ''+AllTrim(Str(nValUnit2))
   nTotalCompra:=(nValUnit1 + nValUnit2 + nValUnit3)
   @ 12,42 say ' Total da Compra:  '+AllTrim(Str(nTotalCompra))

   @ 10,03 get cNomeProd3     picture '@!'         valid !Empty(cNomeProd3)
   @ 10,37 get nQuantProd3    picture '999999'     valid nQuantProd3 > 0
   @ 10,48 get nPrecoProd3    picture '999,999.99' valid nPrecoProd3 > 0
   read

   nValUnit3 := (nQuantProd3 * nPrecoProd3)
   @ 10,62 say ''+AllTrim(Str(nValUnit3))
   nTotalCompra:=(nValUnit1 + nValUnit2 + nValUnit3)
   @ 12,42 say ' Total da Compra:  '+AllTrim(Str(nTotalCompra))
   @ 14,01 say ''

   InKey(0)
   clear

Enddo
