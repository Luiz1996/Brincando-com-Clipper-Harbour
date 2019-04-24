//Luiz Fl vio Pereira

Function Main
SetMode(25,80)
Set Color to m/w*
Set ScoreBoard Off
Set Cursor Off
Set Date British
Set Epoch to 1920
Clear

nOpcao     := 0
lSair      := .f.
lResultado := .f.

do While .t.

   //Tabela(Layout).
   @ 00,00 to 24,79 Double
   @ 02,01 to 02,78
   @ 06,01 to 06,78

   @ 01,01 say PadC('GNRE: Guia Nacional de Recolhimento de Tributos Estaduais',78)
   @ 07,01 say 'ESCOLHA UMA OPCAO:'
   @ 03,01 say ' 1) REALIZAR CALCULO DE GNRE.'
   @ 04,01 say ' 2) DUVIDAS.'
   @ 05,01 say ' 3) SAIR DO PROGRAMA.'
   @ 23,01 say '                                                          Luiz Fl vio Pereira.'

   @ 07,19 get nOpcao picture '9' valid nOpcao > 0 .and. nOpcao <=3
   read

   If LastKey() == 27
      loop
   Endif

   @ 01,01 clear to 22,78

   do While .t.

      If nOpcao == 1

         cProduto1           := Space(31)
         cProduto2           := Space(31)
         cProduto3           := Space(31)
         cProduto4           := Space(31)
         cProduto5           := Space(31)

         nQuantidadeProduto1 := 0
         nQuantidadeProduto2 := 0
         nQuantidadeProduto3 := 0
         nQuantidadeProduto4 := 0
         nQuantidadeProduto5 := 0
         nValorTotalProduto1 := 0
         nValorTotalProduto2 := 0
         nValorTotalProduto3 := 0
         nValorTotalProduto4 := 0
         nValorTotalProduto5 := 0
         nMVA                := 0
         nAliquotaICMSST     := 0
         nValorICMSProprio   := 0
         nICMSST             := 0
         nCustoProdutoNFe    := 0
         nNovoCustoSistema   := 0

         @ 01,01 clear to 22,78
         @ 07,01 say '           DESCRICAO           |       QTDE.      |    VAL.TOTAL PRODUTO'

         @ 02,01 to 02,78 Double
         @ 04,01 to 04,78 Double
         @ 05,32 to 17,32
         @ 05,51 to 17,51
         @ 06,01 to 06,78 Double
         @ 08,01 to 08,78 Double
         @ 10,01 to 10,78
         @ 12,01 to 12,78
         @ 14,01 to 14,78
         @ 16,01 to 16,78
         @ 18,01 to 18,78

         @ 01,01 say PadC('CALCULO DA GNRE',78) Color 'b+/w*'
         @ 03,01 say PadC('DADOS NECESSARIOS:',78) Color 'r+/w*'
         @ 05,01 say 'M.V.A..:'
         @ 05,33 say 'ALIQ.ST:'
         @ 05,52 say 'VL.ICMS:'

         //Lendo al¡quotas e valor icms.
         @ 05,09 get nMVA                picture '99.99'         valid nMVA               > 0
         @ 05,42 get nAliquotaICMSST     picture '99'         valid nAliquotaICMSST    <= 30
         @ 05,60 get nValorICMSProprio   picture '99,999.99'     valid nValorICMSProprio  > 0
         read
         //Dados produto 1.
         @ 09,01 get cProduto1           picture '@!'
         @ 09,39 get nQuantidadeProduto1 picture '999999'        valid nQuantidadeProduto1 >= 0
         @ 09,60 get nValorTotalProduto1 picture '99,999.99'     valid nValorTotalProduto1 >= 0
         //Dados produto 2.
         @ 11,01 get cProduto2           picture '@!'            valid cProduto2 != cProduto1
         @ 11,39 get nQuantidadeProduto2 picture '999999'        valid nQuantidadeProduto2 >= 0
         @ 11,60 get nValorTotalProduto2 picture '99,999.99'     valid nValorTotalProduto2 >= 0
         //Dados produto 3.
         @ 13,01 get cProduto3           picture '@!'            valid cProduto3 != cProduto2 .and. cProduto3 != cProduto1
         @ 13,39 get nQuantidadeProduto3 picture '999999'        valid nQuantidadeProduto3 >= 0
         @ 13,60 get nValorTotalProduto3 picture '99,999.99'     valid nValorTotalProduto3 >= 0
         //Dados produto 4.
         @ 15,01 get cProduto4           picture '@!'            valid cProduto4 != cProduto3 .and. cProduto4 != cProduto2 .and. cProduto4 != cProduto1
         @ 15,39 get nQuantidadeProduto4 picture '999999'        valid nQuantidadeProduto4 >= 0
         @ 15,60 get nValorTotalProduto4 picture '99,999.99'     valid nValorTotalProduto4 >= 0
         //Dados produto 5.
         @ 17,01 get cProduto5           picture '@!'            valid cProduto5 != cProduto4 .and. cProduto5 != cProduto3 .and. cProduto5 != cProduto2 .and. cProduto5 != cProduto1
         @ 17,39 get nQuantidadeProduto5 picture '999999'        valid nQuantidadeProduto5 >= 0
         @ 17,60 get nValorTotalProduto5 picture '99,999.99'     valid nValorTotalProduto5 >= 0
         read

         //Caso deseje encerrar e calcular ou sair.
         If LastKey() == 114
            nResposta := 0
            nResposta := Alert('O QUE DESEJA FAZER?',{'MOSTRAR RESULTADO','SAIR'},'w+/b*')

            If nResposta == 1
               lResultado := .t.

            Elseif nResposta == 2
               clear
               lSair  := .t.
               nOpcao := 0
               exit
            Endif
         Endif

         //Calculando resultados e imprimindo.
         If !Empty(nValorICMSProprio) .or. lResultado

            If Empty(nMVA) .or. Empty(nAliquotaICMSST) .or. Empty(nValorICMSProprio)
               Alert('ALGUM DADO FOI PREENCHIDO ERRADO!',,'w+/r*')
               lResultado := .f.

            Else
               @ 01,01 clear to 22,78
               @ 02,38 to 04,38
               @ 02,01 to 02,78 Double
               @ 04,01 to 04,78 Double
               @ 06,01 to 06,78 Double
               @ 06,00 to 16,45 Double
               @ 07,32 to 15,32
               @ 22,01 to 22,78 Double
               @ 08,01 to 08,44
               @ 10,01 to 10,44
               @ 12,01 to 12,44
               @ 14,01 to 14,44
              // @ 16,01 to 16,40 Double
               @ 00,00 to 24,79 Double

               nValorGuia       := 0
               nTotalQuantidade := 0
               nTotalProdutos   := 0
               nAcrescimoUntario:= 0
               nCustoProduto1   := 0
               nCustoProduto2   := 0
               nCustoProduto3   := 0
               nCustoProduto4   := 0
               nCustoProduto5   := 0
               nNovosCustosProd1:= 0
               nNovosCustosProd2:= 0
               nNovosCustosProd3:= 0
               nNovosCustosProd4:= 0
               nNovosCustosProd5:= 0

               //C lculos!
               nCustoProduto1 := nValorTotalProduto1 / nQuantidadeProduto1
               nCustoProduto2 := nValorTotalProduto2 / nQuantidadeProduto2
               nCustoProduto3 := nValorTotalProduto3 / nQuantidadeProduto3
               nCustoProduto4 := nValorTotalProduto4 / nQuantidadeProduto4
               nCustoProduto5 := nValorTotalProduto5 / nQuantidadeProduto5

               nTotalProdutos   := ( nValorTotalProduto1 + nValorTotalProduto2 + nValorTotalProduto3 + nValorTotalProduto4 + nValorTotalProduto5 )
               nTotalQuantidade := ( nQuantidadeProduto1 + nQuantidadeProduto2 + nQuantidadeProduto3 + nQuantidadeProduto4 + nQuantidadeProduto5 )

               nValorGuia       := (nTotalProdutos + (nTotalProdutos * (nMVA / 100)))
               nValorGuia       := (nValorGuia * (nAliquotaICMSST/100)) - nValorICMSProprio

               nAcrescimoUntario:= (nValorGuia / nTotalQuantidade)

               nNovosCustosProd1:= (nCustoProduto1+nAcrescimoUntario)
               nNovosCustosProd2:= (nCustoProduto2+nAcrescimoUntario)
               nNovosCustosProd3:= (nCustoProduto3+nAcrescimoUntario)
               nNovosCustosProd4:= (nCustoProduto4+nAcrescimoUntario)
               nNovosCustosProd5:= (nCustoProduto5+nAcrescimoUntario)

               If nValorGuia <= 0 .or. nAcrescimoUntario <= 0
                  @ 01,01 clear to 22,78
                  Alert('DADOS INCORRETOS, TENTE NOVAMENTE!',,'w+/r*')
                  loop
               Endif

               //Zerando valores de novos custos dos produtos nao digitados.
               If Empty(nValorTotalProduto1)
                  nNovosCustosProd1 := 0
               Endif

               If Empty(nValorTotalProduto2)
                  nNovosCustosProd2 := 0
               Endif

               If Empty(nValorTotalProduto3)
                  nNovosCustosProd3 := 0
               Endif

               If Empty(nValorTotalProduto4)
                  nNovosCustosProd4 := 0
               Endif

               If Empty(nValorTotalProduto5)
                  nNovosCustosProd5 := 0
               Endif


               //Imprimindo resultados.
               do While .t.

                  @ 01,01 say PaDC('RESULTADOS FINAIS:',78) Color 'b+/w*'
                  @ 03,01 say 'VALOR DA GUIA.:'
                  @ 03,17 say ''+AllTrim(Str(nValorGuia, 8, 2)) Color 'b+/w*'
                  @ 03,39 say ' ACRESCIMO P/UN:'
                  @ 03,56 say ''+AllTrim(Str(nAcrescimoUntario, 8, 3)) Color'r+/w*'
                  @ 05,01 say PaDC('NOVOS CUSTOS:',78) Color'r+/w*'
                  @ 07,01 say ''+AllTrim(cProduto1)
                  @ 09,01 say ''+AllTrim(cProduto2)
                  @ 11,01 say ''+AllTrim(cProduto3)
                  @ 13,01 say ''+AllTrim(cProduto4)
                  @ 15,01 say ''+AllTrim(cProduto5)
                  @ 07,34 say ''+AllTrim(Str(nNovosCustosProd1, 8, 3))
                  @ 09,34 say ''+AllTrim(Str(nNovosCustosProd2, 8, 3))
                  @ 11,34 say ''+AllTrim(Str(nNovosCustosProd3, 8, 3))
                  @ 13,34 say ''+AllTrim(Str(nNovosCustosProd4, 8, 3))
                  @ 15,34 say ''+AllTrim(Str(nNovosCustosProd5, 8, 3))

                  //Perguntando se todos os precessos necessarios no sistema ja foram cumpridos.
                  InKey(0)
                  nResposta := 0
                  nResposta := Alert('JA ATUALIZOU O CUSTO DOS PRODUTO(s) NO SISTEMA?',{'SIM','NAO'},'W+/R*')

                  If nResposta == 1
                     Alert('LEMBRE-SE DE ARRUMAR CST E CFOP DA NFE DE ENTRADA.',,'w+/r*')
                     exit
                  Else
                     loop

                  Endif

                  lResultado := .f.

               Enddo

            Endif

         Endif

         //Ap¢s imprimir o resultado dar  essas opcoes.
         nResposta := Alert('O QUE DESEJA REALIZAR?',{'OUTRO CALCULO','MENU INICIAL','SAIR'},'w+/b*')

         If nResposta == 1
            loop

         ElseIf nResposta == 2
            nOpcao := 0
            clear
            exit

         Elseif nResposta == 3
            clear
            nOpcao := 0
            lSair := .t.
            exit
         Endif

      //D£vidas.
      Elseif nOpcao == 2
         @ 02,01 to 02,78 Double

         @ 01,01 say PadC('DUVIDAS',78) Color 'r+/w*'
         @ 03,01 say '  Ol , este programa foi desenvolvido com intuito de auxiliar no c lculo da'
         @ 04,01 say 'GNRE, ou seja, Guia Nacional de Recolhimento de Tributos Estaduais.'
         @ 05,01 say '  Para efetuar o c lculo serao necess rios alguns dados b sicos, sao eles:'
         @ 06,01 say 'M.V.A., a Al¡quota do ICMS-ST, Valor do ICMS Pr¢prio, Descricao do Produto,'
         @ 07,01 say 'Quantidade e Valor Total de cada Produto.'
         @ 08,01 say '  Tendo estes dados em maos fica f cil achar o resultado correto do ICMS-ST'
         @ 09,01 say 'para emitir a guia com sucesso e realizar o pagamento do tributo.'
         @ 12,01 say '  Para efetuar o c lculo ser  utilizado a seguinte f¢rmula:'
         @ 16,01 say ' ICMS-ST=((Valor Total dos Produtos + M.V.A )*Al¡quota ICMS-ST)-ICMS Pr¢prio ' Color 'b+/w*'
         @ 22,01 say 'TECLE QUALQUER TECLA PARA SAIR.' Color 'R+/W*'

         nOpcao := 0
         InKey(0)
         clear
         loop

      Elseif nOpcao == 0
         exit

      //Sair
      Else
         clear
         lSair := .t.
         exit
      Endif

   Enddo

   //Confirmando sa¡da do programa.
   If lSair
      lSair := .f.
      exit

   Else
      loop

   Endif

Enddo
