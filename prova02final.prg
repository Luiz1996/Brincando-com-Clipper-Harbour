//Luiz Fl vio Pereira

Function Main
SetMode(25,80)
Set Color to m/w*
Set ScoreBoard Off
Set Cursor Off
Set Date British
Set Epoch to 1940
clear

//Tabela(Layout).
@ 00,00 to 24,79 Double
@ 03,01 to 03,78
@ 05,01 to 05,78
@ 11,01 to 11,78
@ 13,01 to 13,78

//Bloco de Vari veis.

lFinaliza           := .t.

dDataVenda          := CTod('')

cNomeCliente        := Space(25)
cNomeVendedor       := Space(25)
cConfirma           := Space(1)
cConsFinal          := Space(1)

nPagarDinheiro      := 0
nPagarCheque        := 0
nPagarCartao        := 0
nValorCartao        := 0
nCadaParcela        := 0
nNumeroCheque       := 0
nConta              := 0
nAgencia            := 0
nValorCheque        := 0
nCodbanco           := 0
nFilial             := 0
nTotal              := 0
nPrecoUnitarioario  := 0
nResposta           := 0
nDesconto           := 0
nValorTotal         := 0
nPercVendedor       := 0
nTotal1             := 0
nTotal2             := 0
nTotal3             := 0
nTotal4             := 0
nTotal5             := 0
nValorTotalDesconto := 0
nTotalPagar         := 0
nValorRecebido      := 0
nTroco              := 0
nComissao           := 0
nQtdeParcelas       := 0
nParcelas           := 0
nAdicionaDias       := 0
nContadorData       := 1
nLinha              := 5
nContadorLinha      := 14


//Colhendo dados da venda.
@ 01,01 say 'Cliente.:'
@ 02,01 say 'Vendedor:'
@ 01,36 say 'Data da Venda:'
@ 02,36 say 'Comis.Vend:    %'
@ 01,59 say 'Filial:'
@ 02,51 say 'Cons.Fin.:  S/N'
@ 02,67 say 'Desc.:    %'

@ 01,10 get cNomeCliente   picture '@!'     valid !Empty(cNomeCliente)
@ 01,50 get dDataVenda                      valid !Empty(dDataVenda)
@ 01,67 get nFilial        picture '99'     valid nFilial > 0

@ 02,10 get cNomeVendedor  picture '@!'     valid !Empty(cNomeVendedor)
@ 02,47 get nPercVendedor  picture '999'    valid nPercVendedor >=0 .and. nPercVendedor <= 100
@ 02,61 get cConsFinal     picture '@!'     valid cConsFinal == 'S' .or. cConsFinal == 'N'
@ 02,73 get nDesconto   picture '999'        valid nDesconto >= 0 .and. nDesconto <= 100
read

//Colhendo dados dos produtos.
@ 04,01 say 'C¢digo  |   Descricao                  | Qtde.  |  Prec.Unit | Total P/Prod. '
@ 06,01 say '        |                              |        |            |               '
@ 07,01 say '        |                              |        |            |               '
@ 08,01 say '        |                              |        |            |               '
@ 09,01 say '        |                              |        |            |               '
@ 10,01 say '        |                              |        |            |               '

do While .t.

   If LastKey() == 27
      nResposta := Alert('O que deseja fazer? ' ,{'Finalizar','Cancelar','Continuar'}  , 'w+/b+')
      If nResposta == 1

         If ( nTotal1 = 0 .and. nTotal2 = 0 .and. nTotal3 = 0 .and. nTotal4 = 0 )
            @ 23,01 say 'NENHUM DADO PARA FINALIZAR A COMPRA! CANCELAR!' Color 'r+/w*'
            loop
         Endif

         If Empty( nTotal1 ) .or. Empty( nTotal2 ) .or. Empty( nTotal3 ) .or. Empty( nTotal4 )
            lFinaliza := .t.
            exit
         Endif

      ElseIf nResposta == 2
         lFinaliza := .f.
         exit
      ElseIf nResposta == 3
         loop
      Endif

   Endif

//Declarando vari veis, Lendo e Imprimindo os dados dos produtos!
   nLinha         ++
   cDescricao     := Space(30)
   nCodigo        := 0
   nQtde          := 0
   nPrecoUnitario := 0


   @ nLinha,01 get nCodigo        picture '99999999'   valid !Empty(nCodigo)
   @ nLinha,10 get cDescricao     picture '@!'         valid !Empty(cDescricao)
   @ nLinha,43 get nQtde          picture '9999'       valid !Empty(nQtde)
   @ nLInha,50 get nPrecoUnitario picture '999,999.99' valid !Empty(nPrecoUnitario)
   read


//Imprimindo o valor total por produto.
   If nLinha == 6
      nTotal1  := ( nQtde  * nPrecoUnitario  )

      @ nLinha,64 say +AllTrim(Str( nTotal1 ) )
      loop
   ElseIf nLinha == 7
      nTotal2  := ( nQtde  * nPrecoUnitario  )

      @ nLinha,64 say +AllTrim(Str( nTotal2 ) )
      loop
   ElseIf nLinha == 8
      nTotal3  := ( nQtde  * nPrecoUnitario  )

      @ nLinha,64 say +AllTrim(Str( nTotal3 ) )
      loop
   Endif

   If nLinha == 9
      nTotal4 := ( nQtde  * nPrecoUnitario  )
      If !Empty( nTotal4 )
         @ nLinha,64 say +AllTrim(Str( nTotal4 ) )
         lFinaliza := .t.
         loop
      Else
         @ nLinha,64 say +AllTrim(Str( nTotal4 ) )
         lFinaliza := .f.
         loop
      Endif
   Endif

   If nLinha == 10
      nTotal5  := ( nQtde  * nPrecoUnitario  )
      @ nLinha,64 say +AllTrim(Str( nTotal5 ) )

      If nTotal5 = 0
         exit
      Endif

      lFinaliza := .t.
      exit
   Endif

Enddo

do While lFinaliza .or. nTotal5 != 0

   If lFinaliza .or. nTotal5 != 0
      nTotal := ( nTotal1 + nTotal2 + nTotal3 + nTotal4 + nTotal5 )


      //Imprimindo valor total e seus respectivos descontos.
      If cConsFinal == 'S'
         nDesconto       := ( nTotal * ( ( nDesconto + 3 ) / 100 ) )
         nValorTotalDesconto := ( nTotal - nDesconto )
         @ 12,01 say 'Total da Compra:' +AllTrim(Str( nTotal ) )+ '   Valor C/Desc.:' +AllTrim(Str( nValorTotalDesconto ,15 ,2 ) )  Color 'b+/w*'
      Else
         nTotal  := ( nTotal1 + nTotal2 + nTotal3 + nTotal4 + nTotal5  )
         nDesconto       := ( nTotal * ( nDesconto/100 ) )
         nValorTotalDesconto := ( nTotal - nDesconto )
         @ 12,01 say 'Total da Compra:' +AllTrim(Str( nTotal ) )+ '   Valor C/Desc.:' +AllTrim(Str( nValorTotalDesconto ,15 ,2 ) )  Color 'b+/w*'
      Endif


      //C uculo da comissÆo do vendedor.
      nComissao := ( nValorTotalDesconto * ( nPercVendedor/100 ) )

      //Perguntando como deseja finalizar a venda.
      nResposta := 0
      nResposta := Alert('Como deseja ENCERRAR VENDA?',{'A Vista','A Prazo','Bonificacao'} , 'w+/b+')
      @ 14,01 clear to 23,78

//Quando o pagamento for A VISTA, teremos 3 op‡oes : Dinheiro, Cheque e Cartao de D‚bito.
      nValorRecebido := 0

      If nResposta == 1

         @ 14,01 clear to 23,78
         @ 12,01 say 'Total da Compra:' +AllTrim(Str( nTotal ) )+ '   Valor C/Desc.:' +AllTrim(Str( nValorTotalDesconto ,15 ,2 ) )  Color 'b+/w*'
         do While nValorTotalDesconto > 0

            do while nValorTotalDesconto > 0

               //Quando o cliente utiliza as 3 formas e nao quita a d¡vida, imprime essas mensagens e cancela a venda(Programa fecha).
               If ( nPagarCartao = 1 .and. nPagarCheque = 1 .and. nPagarDinheiro = 1 .and. nValorTotalDesconto > 0 )
                  @ 14,01 clear to 23,78
                  @ 14,01 say 'VOCE JA UTILIZOU TODAS FORMAS DE PAGAMENTO E NAO QUITOU A DIVIDA!'
                  @ 15,01 say 'SUA COMPRA SERA CANCELADA.'
                  @ 16,01 say 'AT A PROXIMA!'
                  nValorTotalDesconto := -1
                  nResposta           := -1  //Essas variaveis recebem -1 pra nao entrarem na forma de pagamento a prazo.
                  nTotal5             := 0
                  lFinaliza           := .f.
                  InKey(0)
                  exit
               Endif

               nResposta := 0
               nResposta := Alert('Como deseja PAGAR?',{'Dinheiro','Cheque','Cartao(D‚bito)'} , 'w+/b+')

//Se for pagar no DINHEIRO.
               If nResposta == 1

                  If nPagarDinheiro = 0  //Vari vel de controle para nao permitir o pagamento em dinheiro novamente, caso nPagarDinheiro == 1, mostra o alert abaixo.

                     Set Color to 'b+/w*'
                     @ 14,01 say  'Ol  ' +AllTrim( cNomeCliente )+ ', voce deve: ' +AllTrim(Str( nValorTotalDesconto, 15, 2 ) )+ '          '
                     @ 15,01 say  'Valor dado ao caixa: '

                     @ 15,21 get nValorRecebido picture '@999,999,999,999.99' valid !Empty( nValorRecebido )
                     read

                     If nValorRecebido > nValorTotalDesconto
                        nTroco := ( nValorRecebido - nValorTotalDesconto )
                        Set Color to 'r+/w*'
                        @ 16,01 to 16,78 Color 'm/w*'
                        @ 17,01 say 'A comissao do ' +AllTrim( cNomeVendedor )+' foi de: ' +AllTrim(Str( nComissao, 15, 2 ) )
                        @ 19,01 say 'VOLTE SEMPRE!'
                        @ 18,01 say 'Seu troco ser  de: ' +AllTrim(Str(nTroco ,15 ,2 ))
                        nValorTotalDesconto := 0
                        InKey(0)
                        lFinaliza := .f.
                        loop
                     Endif

                     If nValorRecebido == nValorTotalDesconto
                        Set Color to 'r+/w*'
                        @ 16,01 to 16,78 Color 'm/w*'
                        @ 17,01 say 'A comissao do ' +AllTrim( cNomeVendedor )+' foi de: ' +AllTrim(Str( nComissao, 15, 2 ) )
                        @ 18,01 say 'VOLTE SEMPRE!'
                        nValorTotalDesconto := -1
                        nResposta           := -1  //Essas variaveis recebem -1 pra nao entrarem na forma de pagamento a prazo.
                        lFinaliza           := .f.
                        InKey(0)
                        exit
                     Endif

                     If nValorRecebido < nValorTotalDesconto
                        nPagarDinheiro += 1
                        nValorTotalDesconto := ( nValorTotalDesconto - nValorRecebido )
                        @ 14,01 clear to 23,78
                        exit
                     Endif
                     exit
                  Else
                     @ 14,01 clear to 23,78
                     Alert('JA USOU ESSA FORMA DE PAGAMENTO!',,'w+/r+')
                     exit
                  Endif
               Endif

//Se for pagar no cheque.
              If nResposta == 2
                 @ 12,01 clear to 12,78
                 @ 12,01 say 'Total da Compra:' +AllTrim(Str( nTotal ) )+ '   Valor C/Desc.:' +AllTrim(Str( nValorTotalDesconto ,15 ,2 ) )  Color 'b+/w*'

                 If nPagarCheque = 0  //Vari vel de controle para nao permitir o pagamento em cheque novamente, caso nPagarCheque == 1, mostra o alert abaixo.

                    @ 14,01 say 'Valor Cheque:'
                    @ 14,33 say 'C¢d.Banco:'
                    @ 14,48 say 'Agencia:'
                    @ 15,01 say 'Conta:'
                    @ 15,15 say 'N£m.Cheque:'

                    @ 14,14 get nValorCheque       picture '999,999,999,999.99' valid nValorCheque > 0
                    @ 14,43 get nCodbanco          picture '9999'               valid nCodBanco    > 0
                    @ 14,56 get nAgencia           picture '99999'              valid nAgencia     > 0
                    @ 15,07 get nConta             picture '999999'             valid nConta       > 0
                    @ 15,26 get nNumeroCheque      picture '999999999'          valid nNumeroCheque   > 0
                    read

                    If nValorCheque > nValorTotalDesconto
                       nTroco := ( nValorCheque - nValorTotalDesconto )
                       Set Color to 'r+/w*'
                       @ 16,01 to 16,78 Color 'm/w*'
                       @ 17,01 say 'A comissao do ' +AllTrim( cNomeVendedor )+' foi de: ' +AllTrim(Str( nComissao, 15, 2 ) )
                       @ 19,01 say 'VOLTE SEMPRE!'
                       @ 18,01 say 'Seu troco ser  de: ' +AllTrim(Str( nTroco ,15 ,2 ) )

                       nValorTotalDesconto := -1
                       nResposta           := -1
                       nTotal5             := 0
                       lFinaliza           := .f.
                       InKey(0)
                       exit
                    Endif

                    If nValorCheque == nValorTotalDesconto
                       Set Color to 'r+/w*'
                       @ 16,01 to 16,78 Color 'm/w*'
                       @ 17,01 say 'A comissao do ' +AllTrim( cNomeVendedor )+' foi de: ' +AllTrim(Str( nComissao, 15, 2 ) )
                       @ 18,01 say 'VOLTE SEMPRE!'

                       InKey(0)
                       nValorTotalDesconto := ( nValorTotalDesconto - nValorCheque )

                       If nValorTotalDesconto = 0
                           Set Color to 'r+/w*'
                           @ 12,01 clear to 12,78
                           @ 14,01 clear to 23,78
                           @ 12,01 say 'Total da Compra:' +AllTrim(Str( nTotal ) )+ '   Valor C/Desc.:' +AllTrim(Str( nValorTotalDesconto ,15 ,2 ) )  Color 'b+/w*'
                           @ 14,01 say 'VOLTE SEMPRE!'
                           nResposta := -1
                           nTotal5   := 0
                           lFinaliza := .f.
                           exit
                       Endif

                    Endif

                    If nValorCheque < nValorTotalDesconto
                       nPagarCheque += 1
                       nValorTotalDesconto := ( nValorTotalDesconto - nValorCheque )
                       @ 14,01 clear to 23,78
                       exit
                    Endif
                 Else
                    @ 14,01 clear to 23,78
                    Alert('JA USOU ESSA FORMA DE PAGAMENTO!',,'w+/r+')
                    exit
                 Endif
              Endif

//Para pagamento no cartao de d‚bito.
               If nResposta == 3
                  @ 12,01 clear to 12,78
                  @ 12,01 say 'Total da Compra:' +AllTrim(Str( nTotal ) )+ '   Valor C/Desc.:' +AllTrim(Str( nValorTotalDesconto ,15 ,2 ) )  Color 'b+/w*'

                  If nPagarCartao = 0  //Vari vel de controle para nao permitir o pagamento em cartao novamente, caso nPagarCartao == 1, mostra o alert abaixo.
                     nResposta := 0
                     nResposta := Alert('Como deseja PAGAR?',{'Integral','Parcial'} , 'w+/b+')

                     If nResposta == 1
                        Set Color to 'r+/w*'
                        @ 12,01 clear to 12,78
                        @ 12,01 say 'Total da Compra:' +AllTrim(Str( nTotal ) )+ '   Valor C/Desc.:' +AllTrim(Str( nValorTotalDesconto ,15 ,2 ) )  Color 'b+/w*'
                        @ 17,01 say 'A comissao do ' +AllTrim( cNomeVendedor )+' foi de: ' +AllTrim(Str( nComissao, 15, 2 ) )
                        @ 14,01 say 'VOLTE SEMPRE!'
                        lFinaliza           := .f.
                        nValorTotalDesconto := 0
                        exit
                     Endif

                     If nResposta == 2
                        Set Color to 'b+/w*'
                        @ 14,01 say 'Quanto deseja passar no Cartao?'

                        @ 14,32 get nValorCartao picture '999,999,999,999.99' valid nValorCartao > 0 .and. nValorCartao <= nValorTotalDesconto
                        read

                        nPagarCartao += 1
                        nValorTotalDesconto := ( nValorTotalDesconto - nValorCartao )
                        If nValorTotalDesconto = 0
                           Set Color to 'r+/w*'
                           @ 12,01 clear to 12,78
                           @ 14,01 clear to 23,78
                           @ 12,01 say 'Total da Compra:' +AllTrim(Str( nTotal ) ) + '   Valor C/Desc.:' +AllTrim(Str( nValorTotalDesconto ,15 ,2 ) )  Color 'b+/w*'
                           @ 15,01 say 'VOLTE SEMPRE!'
                           @ 14,01 say 'A comissao do ' +AllTrim( cNomeVendedor )+' foi de: ' +AllTrim(Str( nComissao, 15, 2 ) )
                           nResposta := -1
                           nTotal5   := 0
                           lFinaliza := .f.
                           InKey(0)
                           exit
                       Endif

                     Endif
                  Else
                    @ 14,01 clear to 23,78
                    Alert('JA USOU ESSA FORMA DE PAGAMENTO!',,'w+/r+')
                    exit
                  Endif

               Endif

            Enddo

         Enddo

      Endif

//Quando o pagamento for feito A PRAZO.
      If nResposta == 2

         do While .t.

            @ 14,01 clear to 23,78
            @ 14,62 to 23,62 Color 'm/w*'
            Set Color to b+/w*
            @ 12,62 say '|  VENCIMENTOS  ' Color 'm/w*'
            @ 14,01 say 'Realmente quer pagar A Prazo?   [S]im/[N]ao'

            @ 14,31 get cConfirma picture '@!' valid cConfirma == 'S' .or. cConfirma == 'N'
            read

            If cConfirma == 'S'

               @ 15,01 say 'Pagar em quantas Parcelas?   (M x=10)'
               @ 15,27 get nParcelas picture '99' valid nParcelas > 0 .and. nParcelas <= 10
               read

               nCadaParcela := ( nValorTotalDesconto / nParcelas )

               @ 16,01 to 16,61 Color 'm/w*'
               Set Color to r+/w*
               @ 17,01 say 'Ol  ' +AllTrim( cNomeCliente )+ ',obrigado pela preferencia'
               @ 18,01 say 'Fique atento as datas de vencimento ao lado.'
               @ 19,01 say 'Cada parcela custar : ' +AllTrim(Str( nCadaParcela ) )
               @ 20,01 say 'VOLTE SEMPRE!'

               do While nContadorData <= nParcelas

                  Set Color to 'b+/w*'
                  dDataVenda += 30
                  @ nContadorLinha,63 say +AllTrim(StrZero( nContadorData, 2 ) ) + '¦ Pc:'
                  @ nContadorLinha,70 say +DToC( dDataVenda )

                  nContadorData  ++
                  nContadorLinha ++
               Enddo

               lFinaliza := .f.
               InKey(0)
               exit
            Endif

//Quando o cliente quer retornar e escolher novamente a op‡Æo de pagamento.
            If cConfirma == 'N'

               //Limpar a tela caso o cliente mude a forma de pagamento para A Vista..
               @ 12,01 clear to 12,78
               @ 14,01 clear to 23,78
               lFinaliza := .t.
               exit
            Endif

         Enddo

      Endif

//Se a venda for bonificada .
      If nResposta == 3
         @ 12,01 clear to 12,78
         Alert('ESTA FOI UM VENDA BONIFICADA, PORTANTO, GRATUITA!', , 'w+/b+')
         lFinaliza := .f.
         exit
      Endif

   Endif

Enddo
InKey(1)
clear
