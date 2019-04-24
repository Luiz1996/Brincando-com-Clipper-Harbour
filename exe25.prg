Function Main
SetMode(25,80)
Set Color to m/w*
Set ScoreBoard Off
Set Cursor Off
Set Date British
Set Epoch to 1920
Clear

//Tabela(Layout).
@ 00,00 to 24,79 Double

dDataAtual               := Date()
dAnoAtual                := Year(dDataAtual)
dMesAtual                := Month(dDataAtual)
dDiaAtual                := Day(dDataAtual)

nQuantidade              := 0
nQuantidadeEntrevistados := 0
nQuantidade18anos        := 0
nQuantidade30e50Anos     := 0
nQuantidade2000          := 0
nQuantidade500a980       := 0
nMulheresMais5000        := 0
nQuantidadeGostaram      := 0
nQuantidadeNaoGostaram   := 0
nQuantidadeHomens        := 0
nQuantidadeMulheres      := 0
nPercentualHomens        := 0
nPercentualMulheres      := 0

@ 01,01 say 'Deseja entrevistar quantas pessoas?'

@ 01,37 get nQuantidade picture '999' valid nQuantidade > 0
read

do While nQuantidade > 0

   nIdade               := 0
   nRendaMensal         := 0

   cNomeEntrevistado := Space(45)
   dDataNascimento   := CToD('')
   cOpiniaoProduto   := Space(01)
   cSexo             := Space(01)

   @ 01,01 say 'Nome.............:'
   @ 02,01 say 'Data Nascimento..:'
   @ 03,01 say 'Gostou do Produto?  [S]im/[N]ao'
   @ 04,01 say 'Sexo.............:  (M/F)'
   @ 05,01 say 'Renda mensal.....:'

   @ 01,19 get cNomeEntrevistado picture '@!'         valid !Empty(cNomeEntrevistado)
   @ 02,19 get dDataNascimento                        valid !Empty(dDataNascimento)
   @ 03,19 get cOpiniaoProduto   picture '@!'         valid cOpiniaoProduto == 'S' .or. cOpiniaoProduto == 'N'
   @ 04,19 get cSexo             picture '@!'         valid cSexo == 'M' .or. cSexo == 'F'
   @ 05,19 get nRendaMensal      picture '999,999.99' valid nRendaMensal > 0
   read

   dAnoNascimento  := Year(dDataNascimento)
   dMesNascimento  := Month(dDataNascimento)
   dDiaNascimento  := Day(dDataNascimento)

   nIdade          := ( dAnoAtual - dAnoNascimento )

   //Vendo se possui idade entre 30  e 50 anos.
   If nIdade = 30

      If dMesAtual < dMesNascimento
         lMaiorIdade          := .t.
         nQuantidade30e50Anos ++

      Elseif dMesAtual = dMesNascimento

         If dDiaAtual >= dDiaNascimento
            lMaiorIdade          := .t.
            nQuantidade30e50Anos ++
         Else
            lMaiorIdade := .f.
         Endif

      Endif

   Elseif nIdade > 30 .and. nIdade <= 50
      lMaiorIdade          := .t.
      nQuantidade30e50Anos ++

   Endif

   //Descobrindo se possui 18 anos ou mais, porÇm menor de 30 anos.
   If nIdade = 18

      If dMesAtual < dMesNascimento
         lMaiorIdade       := .t.
         nQuantidade18anos ++

      Elseif dMesAtual = dMesNascimento

         If dDiaAtual >= dDiaNascimento
            lMaiorIdade       := .t.
            nQuantidade18anos ++

         Else
            lMaiorIdade := .f.

         Endif

      Endif

   Elseif nIdade > 18 .and. nIdade < 30
      lMaiorIdade       := .t.
      nQuantidade18anos ++
   Endif

   //Contando quantos ganham mais de 2000reais mensais.
   If nRendaMensal >= 2000
      nQuantidade2000 ++
   Endif

   //Contando quantos ganham entre 500 a 980 reais mensais.
   If nRendaMensal >= 500 .and. nRendaMensal <= 980
      nQuantidade500a980 ++
   Endif

   //Contando mulheres que ganham mais de 5000 reais.
   If cSexo == 'F' .and. nRendaMensal >= 5000
      nMulheresMais5000 ++
   Endif

   If cOpiniaoProduto == 'S'
      nQuantidadeGostaram ++
   Endif

   If cOpiniaoProduto == 'N' .and. cSexo == 'F'
      nQuantidadeNaoGostaram ++
   Endif

   If cSexo == 'M'
      nQuantidadeHomens ++
   Endif

   If cSexo == 'F'
      nQuantidadeMulheres ++
   Endif

   nQuantidadeEntrevistados += 1
   nQuantidade --

Enddo

//IMPRIMINDO RELAT‡RIO FINAL!

//Achando Percentuais:
nPercentualHomens   := ( nQuantidadeHomens  / nQuantidadeEntrevistados  ) * 100
nPercentualMulheres := ( nQuantidadeMulheres / nQuantidadeEntrevistados ) * 100

Clear
@ 00,00 to 10,79 Double

@ 01,01 say 'Quantidade de Pessoas acima de 18 Anos..:' +Alltrim(Str(nQuantidade18anos))
@ 02,01 say 'Quantidade de Pessoas entre 30 e 50 Anos:' +Alltrim(Str(nQuantidade30e50Anos))
@ 03,01 say 'Pessoas com Renda Acima de 2000 reais...:' +Alltrim(Str(nQuantidade2000))
@ 04,01 say 'Pessoas com Renda entre 500 e 980 reais.:' +Alltrim(Str(nQuantidade500a980))
@ 05,01 say 'Mulheres que Ganham Acima de 5000 reais.:' +Alltrim(Str(nMulheresMais5000))
@ 06,01 say 'Quantidade de Pessoas que Gostaram......:' +Alltrim(Str(nQuantidadeGostaram))
@ 07,01 say 'Quantidade de Pessoas que Nao Gostaram..:' +Alltrim(Str(nQuantidadeNaoGostaram))
@ 08,01 say 'Percentual de Homens Entrevistados......:' +Alltrim(Str(nPercentualHomens))+ ' %'
@ 09,01 say 'Percentual de Mulheres Entrevistados....:' +Alltrim(Str(nPercentualMulheres))+ ' %'

InKey(0)
Clear
