//Luiz Fl vio Pereira

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

//Bloco de Vari veis.
nQuantidadeEmpregados        := 0
nResposta                    := 0
nSexoMasculino               := 0
nSexoFeminino                := 0
nHomens80anos                := 0
nMulheresAntes2003           := 0
nPercentualM                 := 0
nPercentualF                 := 0
nTotalRemuneracao            := 0
nHomens80anos                := 0
nTotalGeralPessoas           := 0
nTotalRemuneracaoF           := 0
nTotalRemuneracaoF           := 0
nAnoEmQueTrabalhou           := 0
nMulheresPagamIRFF           := 0
nHomensComTicket             := 0
nPercentualMulheresPagamIRRF := 0
nPercentualHomensComTicket   := 0
nQuantidadeJose              := 0
nPercentualJose              := 0
nNomeMaximo20Caracter        := 0
nPercentual20Caracter        := 0
nQuantidadeSantos            := 0
nPercentualSantos            := 0

dDataAtual                   := Date()
dAnoAtual                    := Year(dDataAtual)
dMesAtual                    := Month(dDataAtual)
dDiaAtual                    := Day(dDataAtual)

lTempoAposentaM              := .f.
lTempoAposentaF              := .f.
lMostraResultado             := .f.
lIdadeAposentaM              := .f.
lIdadeAposentaF              := .f.

do While .t.


   //In¡cio do programa.
   @ 01,01 say 'Quantos empregados serao analisados?'
   @ 01,37 get nQuantidadeEmpregados picture '999' valid nQuantidadeEmpregados > 0
   read

   //Caso o usu rio deseje sair ou processar.
   If LastKey() == 27
      nResposta := Alert('O Que deseja Fazer?',{'Cancelar','Retornar','Processar Dados'},'w+/b*')

      If nResposta == 1
         exit
      Elseif nResposta == 2
         loop
      Elseif nResposta == 3
         If nTotalGeralPessoas = 0
            @ 03,01 say 'NENHUM DADO A SER PROCESSADO!' Color 'r+/w*'
            lMostraResultado := .f.
            InKey(2)
            exit
         Else
            lMostraResultado := .t.
            exit
         Endif
      Endif

   Endif

   Clear

   do While nQuantidadeEmpregados != 0

      //mais variaveis para o loop.
      nAdicionalNoturno       := 0
      nAdicionalInsalubridade := 0
      nSalarioBase            := 0
      nValorNoturno           := 0
      nValorInsalubridade     := 0
      nAdicional2005e2006     := 0
      nReducao2009e2010       := 0
      nValorIRFF              := 0
      nTicketAlimentacao      := 0
      nReducao20Ticket        := 0
      nReducao11IRRF          := 0
      nAdicionalTicket        := 0

      cNomeSantos             := ''
      cNomeColaborador        := Space(50)
      cSexo                   := Space(1)

      dDataNascimento         := CToD('')
      dDataAdmissao           := CToD('')

      @ 00,00 to 10,79 Double
      @ 01,01 say 'Nome Colaborador........:                              '+DToC(dDataAtual)
      @ 02,01 say 'Sexo....................: (M/F)'
      @ 03,01 say 'Data Nascimento.........:'
      @ 04,01 say 'Data Admissao...........:'
      @ 05,01 say 'Salario Base............:'
      @ 06,01 say 'Adicional Noturno.......:    %'
      @ 07,01 say 'Adicional Insalubridade.:    %'
      @ 08,01 say 'Valor Limite IRRF.......:'
      @ 09,01 say 'Valor Ticket Alimentacao:'

      @ 01,26 get cNomeColaborador        picture '@!'        valid !Empty(cNomeColaborador)
      @ 02,26 get cSexo                   picture '@!'        valid cSexo == 'M' .or. cSexo == 'F'
      @ 03,26 get dDataNascimento                             valid !Empty(dDataNascimento)
      @ 04,26 get dDataAdmissao                               valid ( !Empty(dDataAdmissao) .and. dDataAdmissao > dDataNascimento )
      @ 05,26 get nSalarioBase            picture '99,999.99' valid nSalarioBase > 0
      @ 06,26 get nAdicionalNoturno       picture '999'       valid nAdicionalNoturno >= 0 .and. nAdicionalNoturno <= 100
      @ 07,26 get nAdicionalInsalubridade picture '999'       valid nAdicionalInsalubridade >= 0 .and. nAdicionalInsalubridade <= 100
      @ 08,26 get nValorIRFF              picture '99,999.00' valid nValorIRFF >= 0
      @ 09,26 get nTicketAlimentacao      picture '999.99'    valid nTicketAlimentacao >= 0
      read

      //Caso o usu rio deseje sair ou processar.
      If LastKey() == 27
         nResposta := Alert('O Que deseja Fazer?',{'Cancelar','Retornar','Processar Dados'},'w+/b*')

         If nResposta == 1
            exit
         Elseif nResposta == 2
            loop
         Elseif nResposta == 3
            If nTotalGeralPessoas = 0
               @ 11,01 say 'NENHUM DADO A SER PROCESSADO!' Color 'r+/w*'
               lMostraResultado := .f.
               InKey(2)
               exit
            Else
               lMostraResultado := .t.
               exit
            Endif
         Endif

      Endif

      //Fazendo calculos para chegar no resultado final de remuneracao total acumulada.
      If nTicketAlimentacao > 0
         nReducao20Ticket := ( nSalarioBase * 0,20 )
      Endif

      If nValorIRFF > 0
         nReducao11IRRF := ( nSalarioBase * 0,11 )
      Endif


      //Identificando os nomes digitados e os tamanhos dos nomes para imprimir os percentuais no fim.
      If ( Left(cNomeColaborador,4) == 'JOSE' .and. cSexo == 'M' )
         nQuantidadeJose += 1
      Endif

      cNomeSantos := AllTrim(cNomeColaborador)
      If Right(cNomeSantos,6) == 'SANTOS' .and. cSexo == 'F'
         nQuantidadeSantos += 1
      Endif

      If Len(AllTrim(cNomeColaborador)) <= 20
         nNomeMaximo20Caracter += 1
      Endif

      //Extraindo datas.
      dAnoAdmissao       := Year(dDataAdmissao)
      dMesAdmissao       := Month(dDataAdmissao)
      dDiaAdmissao       := Day(dDataAdmissao)
      dAnoNascimento     := Year(dDataNascimento)
      dMesNascimento     := Month(dDataNascimento)
      dDiaNascimento     := Day(dDataNascimento)

      nIdade             := ( dAnoAtual - dAnoNascimento )
      nTempoServico      := ( dAnoAtual - dAnoAdmissao )
      dAnoEmQueTrabalhou := ( dAnoAdmissao + 25 )//peguei a data de trabalho das mulheres, pois se satisfazer pra elas com certeza ir  satisfazer pros homens.

      //calculando os adicionais e reducoes conforme o perioso em que trabalhou.ITEM 5 DA PROVA.
      If dAnoEmQueTrabalhou >= 2005
         nAdicional2005e2006 := ( nSalarioBase * 0,08 )
      Endif

      If dAnoEmQueTrabalhou >= 2009
         nReducao2009e2010   := ( nSalarioBase * 0,03 )
      Endif



      //Fazendo calculos para chegar no resultado final de remuneracao total acumulada.
      nValorNoturno      := ( nSalarioBase * ( nAdicionalNoturno       / 100 ) )
      nValorInsalubridade:= ( nSalarioBase * ( nAdicionalInsalubridade / 100 ) )

      nValorGeral        := (nSalarioBase+nValorInsalubridade+nValorNoturno+nAdicional2005e2006-nReducao2009e2010+nTicketAlimentacao-nReducao20Ticket-nReducao11IRRF)

      //Caso o colaborador seja homem.
      If cSexo == 'M'

         //Descobrindo a Idade do Homem.
         If nIdade < 65
            lIdadeAposentaM := .f.
         Endif

         If nIdade == 65

            If dMesAtual < dMesNascimento
               lIdadeAposentaM := .t.
            Elseif dMesAtual = dMesNascimento
               If dDiaAtual >= dDiaNascimento
                  lIdadeAposentaM := .t.
               Else
                  lIdadeAposentaM := .f.
               Endif
            Endif

         Elseif nIdade >= 80
            lIdadeAposentaM := .t.
            nHomens80anos += 1
         Elseif nIdade > 65
            lIdadeAposentaM := .t.
         Endif


         //Tempo de trabalho do Homem.
         If nTempoServico < 30
            lTempoAposentaM := .f.
         Endif

         If nTempoServico == 30

            If dMesAtual < dMesAdmissao
               lTempoAposentaM := .t.
            Elseif dMesAtual = dMesAdmissao
               If dDiaAtual >= dDiaAdmissao
                  lTempoAposentaM := .f.
               Else
                  lTempoAposentaM := .f.
               Endif
            Endif

         Elseif nTempoServico > 30
            lTempoAposentaM := .t.
         Endif

         //Pegando a quantidade de homens que podem se aposentar.
         If lTempoAposentaM .and. lIdadeAposentaM
            nSexoMasculino += 1
         Endif


      //Caso o colaborador seja Mulher.
      Elseif cSexo == 'F'


         If dAnoAdmissao <= 2003
            nMulheresAntes2003 += 1
         Endif

         If nIdade < 60
            lIdadeAposentaF := .f.
         Endif

         If nIdade == 60

            If dMesAtual < dMesNascimento
               lIdadeAposentaF := .t.
            Elseif dMesAtual = dMesNascimento
               If dDiaAtual >= dDiaNascimento
                  lIdadeAposentaF := .t.
               Else
                  lIdadeAposentaF := .f.
               Endif
            Endif

         Elseif nIdade > 60
            lIdadeAposentaF := .t.
         Endif


         //Descobrindo o tempo de trabalho do mulher.
         If nTempoServico < 25
            lTempoAposentaF := .f.
         Endif

         If nTempoServico == 25

            If dMesAtual < dMesAdmissao
               lTempoAposentaF := .t.
            Elseif dMesAtual = dMesAdmissao
               If dDiaAtual >= dDiaAdmissao
                  lTempoAposentaF := .f.
               Else
                  lTempoAposentaF := .f.
               Endif
            Endif

         Elseif nTempoServico > 25
            lTempoAposentaF := .t.
         Endif

         //Pegando a quantidade de mulheres que podem se aposentar.
         If lTempoAposentaF .and. lIdadeAposentaF
            nSexoFeminino += 1
         Endif

      Endif

       If (  lTempoAposentaF .and. lIdadeAposentaF  .or.  lTempoAposentaM .and. lIdadeAposentaM  )
          nTotalRemuneracao  := ( nTotalRemuneracao + nValorGeral )

          If ( cSexo == 'F' .and. nValorIRFF > 0 )
             nMulheresPagamIRFF += 1
          Endif

          If ( cSexo == 'M' .and. nTicketAlimentacao > 0 )
             nHomensComTicket += 1
          Endif

      Endif

      //Decrementando nQuantidadeEmpregados para manutencao do while.
      nQuantidadeEmpregados --
      nTotalGeralPessoas    += 1

   Enddo

   exit
Enddo

//imprimindo resultado final na tela.
If lMostraResultado .or. nQuantidadeEmpregados <= 0

   //Achando percentuais.
   nPercentualM                := ( ( nSexoMasculino * 100 ) / nTotalGeralPessoas )
   nPercentualF                := ( ( nSexoFeminino  * 100 ) / nTotalGeralPessoas )
   nPercentualMuheresPagamIRRF := ( nMulheresPagamIRFF / nSexoFeminino ) * 100
   nPercentualHomensComTicket  := ( nHomensComTicket / nSexoMasculino )  * 100
   nPercentualJose             := ( ( nQuantidadeJose * 100 ) / nTotalGeralPessoas )
   nPercentual20Caracter       := ( ( nNomeMaximo20Caracter * 100 ) / nTotalGeralPessoas )
   nPercentualSantos           := ( ( nQuantidadeSantos * 100 ) / nTotalGeralPessoas )

   Clear
   @ 00,00 to 11,79 Double
   @ 01,01 say 'Percentual de Homens Aposentados ‚.......: '     +AllTrim(Str(nPercentualM))+ ' %'
   @ 02,01 say 'Percentual de Mulheres Aposentadas ‚.....: '     +AllTrim(Str(nPercentualF))+ ' %'
   @ 03,01 say 'Quant.de Homens acima de 80 anos foi.....: '     +AllTrim(Str(nHomens80anos))
   @ 04,01 say 'Quant.de Mulheres admitidas antes de 2003: '     +AllTrim(Str(nMulheresAntes2003))
   @ 05,01 say 'Total GERAL de remuneracao...............: '     +AllTrim(Str(nTotalRemuneracao,15 ,2 ))
   @ 06,01 say 'Percentual de Mulheres que PAGAM IRFF....: '     +AllTrim(Str(nPercentualMuheresPagamIRRF))+ ' %'
   @ 07,01 say 'Percentual de Homens que pegam TICKET AL.: '     +AllTrim(Str(nPercentualHomensComTicket))+  ' %'
   @ 08,01 say 'Percentual de Homens com Nome=JOSE.......: '     +AllTrim(Str(nPercentualJose))+ ' %'
   @ 09,01 say 'Percentual de Mulheres com final SANTOS..: '     +AllTrim(Str(nPercentualSantos))+ ' %'
   @ 10,01 say 'Percentual de Nomes com menos de 20CARAC.: '     +AllTrim(Str(nPercentual20Caracter))+ ' %'
   InKey(0)

Endif

InKey(1)
Clear
