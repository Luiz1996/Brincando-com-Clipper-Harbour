Function Main
SetMode(25,80)
Set Color to m/w*
Set ScoreBoard Off
Set Cursor Off
Set Date British
Set Epoch to 1940
Clear

//Tabela(Layout).
@ 00,00 to 24,79 Double
@ 02,01 to 02,78
@ 04,01 to 04,78
@ 22,01 to 22,78

//Bloco de vari†veis.
dDataAtual      := Date()
dDataNascimento := CToD('')

cNome           := Space(40)

nDespesas       := 0
nValorTotal     := 0
nIdade          := 0
nMesada         := 0
nLinha          := 5
nAnoAtual       := Year(dDataAtual)
nMesAtual       := Month(dDataAtual)
nDiaAtual       := Day(dDataAtual)

lMaiorIdade     := .f.

//Inicio do programa.
@ 01,01 say 'Nome:                                         Data Nasc:         Mesada:'

@ 01,06 get cNome           picture '@!'     valid !Empty(cNome)
@ 01,57 get dDataNascimento                  valid !Empty(dDataNascimento)
@ 01,73 get nMesada         picture '999.99' valid nMesada > 0
read

nAnoNascimento  := Year(dDataNascimento)
nMesNascimento  := Month(dDataNascimento)
nDiaNascimento  := Day(dDataNascimento)

nIdade          := ( nAnoAtual - nAnoNascimento )

//Descobrindo se Ç de maior ou n∆o.
do While .t.

   If nIdade < 18
      lMaiorIdade := .f.
   Endif

   If nIdade = 18

      If nMesAtual < nMesNascimento
         lMaiorIdade := .t.
      Elseif nMesAtual = nMesNascimento
         If nDiaAtual >= nDiaNascimento
            lMaiorIdade := .t.
         Else
            lMaiorIdade := .f.
         Endif
      Endif

   Elseif nIdade > 18
      lMaiorIdade := .t.
   Endif

   //Ap¢s descobrir se Ç de maior ou n∆o, sair do while e iniciar digitaá∆o de despesas.
   exit
Enddo

@ 03,01 say '       Descricao:        |    Quant.    |    Val.Unit.    |    Val.Tot/Prod.'

do While lMaiorIdade

   @ 05,26 to 21,26
   @ 05,41 to 21,41
   @ 05,59 to 21,59

   cDescricao      := Space(25)
   nQuantidade     := 0
   nValorUnitario  := 0

   @ nLinha,01 get cDescricao     picture '@!'         valid !Empty(cDescricao)
   @ nLinha,32 get nQuantidade    picture '999'        valid nQuantidade    > 0
   @ nLinha,46 get nValorUnitario picture '999,999.99' valid nValorUnitario > 0
   read

   //Calculando valores totais, da despesa e atualizando valor de mesada.
   nValorTotal := ( nQuantidade * nValorUnitario )
   @ nLinha,64 say +AllTrim(Str(nValorTotal))
   nDespesas += nValorTotal
   nMesada   -= nValorTotal

   //para incrementar a linha abaixo.
   nLinha ++
   @ nLinha,01 to nLinha,78

   //para incrementar a impress∆o dos pr¢ximos gets.
   nLinha ++

   //Fazendo controle por linhas, para limpesa da tela quando a mesma for preenchida atÇ o fim.
   If nLinha > 21
      nLinha := 5
      @ 05,01 clear to 21,78
   Endif

   //Imprimindo valor de mesada e total em despesas.
   If nMesada >= 0
      @ 23,01 say 'Ainda restam de Mesada: ' +AllTrim(Str(nMesada))+ ' reais.   Total de Despesas: ' +AllTrim(Str(nDespesas))+ ' reais.' Color 'b+/w*'
   Else
      @ 23,01 clear to 23,78
      @ 23,01 say 'Saldo negativo em: '      +AllTrim(Str(nMesada))+ ' reais.   Total de Despesas: ' +AllTrim(Str(nDespesas))+ ' reais.' Color 'r+/w*'
   Endif

   //Caso deseje sair.
   If LastKey() == 27
      nResposta := Alert('O que deseja fazer?',{'Finalizar','Continuar'},'w/b*')

      If nResposta == 1
         Alert('Saldo Final da Mesada: ' +AllTrim(Str(nMesada))+ ' de mesada.',,'w/b*')
         exit
      Elseif nResposta == 2
         loop
      Endif

   Endif

Enddo

do While !lMaiorIdade

   @ 05,26 to 21,26
   @ 05,41 to 21,41
   @ 05,59 to 21,59

   cDescricao      := Space(25)
   nQuantidade     := 0
   nValorUnitario  := 0

   @ nLinha,01 get cDescricao     picture '@!'         valid !Empty(cDescricao)
   @ nLinha,32 get nQuantidade    picture '999'        valid nQuantidade    > 0
   @ nLinha,46 get nValorUnitario picture '999,999.99' valid nValorUnitario > 0
   read

   //Calculando valores totais, da despesa e atualizando valor de mesada.
   nValorTotal := ( nQuantidade * nValorUnitario )
   @ nLinha,64 say +AllTrim(Str(nValorTotal))
   nDespesas += nValorTotal
   nMesada   -= nValorTotal

   //para incrementar a linha abaixo.
   nLinha ++
   @ nLinha,01 to nLinha,78

   //para incrementar a impressao dos gets que vir∆o.
   nLinha ++

    //Fazendo controle por linhas, para limpesa da tela quando a mesma for preenchida atÇ o fim.
   If nLinha > 21
      nLinha := 5
      @ 05,01 clear to 21,78
   Endif

   //Condicoes para imprimir mesada e total da despesa, e tambÇm para encerrar o programa caso ultrapasse o valor da mesada.
   If nMesada > 0
      @ 23,01 say 'Ainda restam de Mesada: ' +AllTrim(Str(nMesada))+ ' reais.   Total de Despesas: ' +AllTrim(Str(nDespesas))+ ' reais.' Color 'b+/w*'
   Endif

   //Caso deseje sair.
   If LastKey() == 27 .or. nMesada <= 0

      If nMesada < 0
         Alert('Seu saldo estourou e nao poder† levar o produto: '+AllTrim(cDescricao),,'w+/r*' )
      Endif

      nResposta := Alert('O que deseja fazer?',{'Finalizar','Continuar'},'w/b*')

      If nResposta == 1
         Alert('Saldo Final da Mesada:' +AllTrim(Str(nMesada))+ ' de mesada.',,'w/b*')
         exit
      Elseif nResposta == 2
         loop
      Endif

   Endif

Enddo

InKey(1)
Clear
