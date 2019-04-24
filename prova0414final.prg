//Luiz Fl vio Pereira

Function Main
SetMode(25,80)
Set Color to m/w*
Set ScoreBoard Off
Set Cursor Off
Set Date British
Set Epoch to 1920
Clear

//Bloco de Vari veis.
cLogin              := Space(05)
cSenha              := Space(08)

nOpcao              := 0
nValorTotalDigitado := 0
nValorTotalGeral    := 0
nEstoqueBanana      := 155
nEstoquePera        := 117.50
nEstoqueBatata      := 859.00
nUsoCartao          := 0

lRealizarPedido     := .f.
lFinalizaPedido     := .f.
lVendaPera          := .f.

//Tabela(Layout).
@ 00,00 to 24,79 Double
@ 02,01 to 02,78

do While .t.

   @ 01,01 say PadC('FRUTARIA DO LUIZ', 78)
   @ 12,33 say 'Login:'
   @ 13,33 say 'Senha:'

   @ 12,39 get cLogin picture '@!' valid !Empty(cLogin)
   @ 13,39 get cSenha picture '@!' valid !Empty(cSenha) Color 'm/m'
   read



   If cLogin == 'ADMIN' .and. cSenha == 'TESTE123'
      Clear

      //Tabela(Layout).
      @ 00,00 to 24,79 Double
      @ 02,01 to 02,78

      @ 01,01 say 'DIGITE A OPCAO DESEJADA:'
      @ 03,01 say '1) EFETUAR VENDA.'
      @ 04,01 say '2) SAIR.'

      @ 01,25 get nOpcao picture '9'valid nOpcao == 1 .or. nOpcao == 2
      read

      Clear

      If nOpcao == 1

         lRealizarPedido := .t.
         do While lRealizarPedido

            //Bloco de Vari veis.
            nNumeroPedido       := 1
            nLimiteCredito      := 0
            nCodigo             := 0
            nQuantidade         := 0
            nDesconto           := 0
            nLinha              := 3
            nEstoqueVendaBanana := 0
            nQuantidadePeraGanha:= 0
            nDescontoParaPera   := 0

            dDataVenda        := CToD('')

            cNomeCliente      := Space(45)
            cEntregaDomicilio := Space(01)
            cPromocao         := Space(01)

            //Tabela(Layout).
            @ 00,00 to 24,79 Double
            @ 02,01 to 02,78
            @ 09,01 to 09,78

            //Colhendo dados da venda.
            @ 01,01 say PadC('DADOS DA VENDA', 78)
            @ 03,01 say 'NUMERO DO PEDIDO...:' +AllTrim(Str(nNumeroPedido))
            @ 04,01 say 'NOME DO CLIENTE....:'
            @ 05,01 say 'LIMITE DE CREDITO..:'
            @ 06,01 say 'DATA DA VENDA......:'
            @ 07,01 say 'ENTREGA A DOMOCILIO:  [S]im/[N]ao'
            @ 08,01 say 'PROMOC.LEVE+ PAGUE-:  [S]im/[N]ao'

            @ 04,21 get cNomeCliente      picture '@!'         valid !Empty(cNomeCliente)
            @ 05,21 get nLimiteCredito    picture '999,999.99' valid nLimiteCredito > 0
            @ 06,21 get dDataVenda                             valid !Empty(dDataVenda)
            @ 07,21 get cEntregaDomicilio picture '@!'         valid cEntregaDomicilio == 'S' .or. cEntregaDomicilio == 'N'
            @ 08,21 get cPromocao         picture '@!'         valid cPromocao == 'S' .or. cPromocao == 'N'
            read

            //Colhendo dados da entrega.
            If cEntregaDomicilio == 'S'

               cEndereco        := Space(40)
               cBairro          := Space(40)
               cReferencia      := Space(40)
               cTelefone        := Space(13)

               nValorTotalGeral := 5

               @ 10,01 say 'ENDERECO...........:'
               @ 11,01 say 'BAIRRO.............:'
               @ 12,01 say 'PONTO DE REFERENCIA:'
               @ 13,01 say 'TELEFONE...........:'

               @ 10,21 get cEndereco   picture '@!' valid !Empty(cEndereco)
               @ 11,21 get cBairro     picture '@!' valid !Empty(cBairro)
               @ 12,21 get cReferencia picture '@!' valid !Empty(cReferencia)
               @ 13,21 get cTelefone   picture '@!' valid !Empty(cTelefone)
               read

            Endif

            Clear

            @ 01,01 say '   CODIGO   | DESCRICAO PROD. |  QTDE.  |  PR.UNIT.  | DESC.(%) |  VAL.TOTAL'

            //Fazendo a venda.
            do While .t.

               //Tabela(Layout).
               @ 00,00 to 24,79 Double
               @ 02,01 to 02,78
               @ 03,13 to 21,13
               @ 03,31 to 21,31
               @ 03,41 to 21,41
               @ 03,54 to 21,54
               @ 03,65 to 21,65
               @ 22,01 to 22,78

               nCodigo     := 0
               nQuantidade := 0
               nDesconto   := 0

               @ nLinha,05 get nCodigo     picture '9999'  valid ( nCodigo == 1500 .or. nCodigo == 2501 .or. nCodigo == 3001 )
               read

               //Descobrindo o produto digitado atrav‚s do c¢digo.
               If nCodigo == 1500
                  cDescricao     := 'BANANA PRATA'
                  nPrecoUnitario := 1.50
               Elseif nCodigo == 2501
                  cDescricao     := 'PERA ARGENTINA'
                  nPrecoUnitario := 9.00
               Else
                  cDescricao     := 'BATATA PERUANA'
                  nPrecoUnitario := 5.00
               Endif

               //Imprimindo descricao e preco unitario.
               @ nLinha,15 say +AllTrim(cDescricao)
               @ nLinha,45 say +AllTrim(Str(nPrecoUnitario))

               //Lendo quantidade.
               @ nLinha,33 get nQuantidade picture '999.99'valid nQuantidade > 0 .and. nQuantidade <= 859.00
               read

               //Atualizando e controle de estoques.
               If nCodigo == 1500
                  nEstoqueBanana := nEstoqueBanana - nQuantidade

                  If nEstoqueBanana < 0
                     Alert('ESTOQUE INSUFICIENTE!',,'w+/r*')
                     loop
                  Endif

                  //Fazendo a parte da promocao.
                  If cPromocao == 'S'
                  nEstoqueVendaBanana := ( nEstoqueVendaBanana + nQuantidade )
                  nQuantidadePeraGanha:= ( nEstoqueVendaBanana / 2 )
                  Endif

               Elseif nCodigo == 2501
                  nEstoquePera := nEstoquePera - nQuantidade
                  lVendaPera := .t.

                  If nEstoquePera < 0
                     Alert('ESTOQUE INSUFICIENTE!',,'w+/r*')
                     loop
                  Endif

               Elseif nCodigo == 3001
                  nEstoqueBatata := nEstoqueBatata - nQuantidade

                  If nEstoqueBatata < 0
                     Alert('ESTOQUE INSUFICIENTE!',,'w+/r*')
                     loop
                  Endif
               Endif

               //Fazendo o desconto caso o cliente seja contemplado com a promocao e leve tambem a pera.
               If nEstoquePera != 117.50 .and. cPromocao == 'S' .and. lVendaPera
                  nDescontoParaPera    := ( nQuantidadePeraGanha * 9 )
                  //Mostrando que houve desconto.
                  @ nLinha,66 say '-       DESC!' Color 'r+/w*'
                  lVendaPera := .f.
                  //Atualizando valores para valor total do pedido nao ir ficando negativo.
                  nQuantidadePeraGanha := 0
                  nEstoqueVendaBanana  := 0
               Endif

               //Calculando o total por produto.
               If nCodigo == 1500
                  nValorTotalDigitado := ( nQuantidade * nPrecoUnitario )
               Elseif nCodigo == 2501
                   nValorTotalDigitado := ( nQuantidade * nPrecoUnitario )
               Else
                   nValorTotalDigitado := ( nQuantidade * nPrecoUnitario )
               Endif

               //Lendo desconto.
               @ nLinha,59 get nDesconto   picture '99'    valid nDesconto >= 0
               read

               //Checando desconto superior ao permitido.
               If nCodigo == 1500 .and. nDesconto > 20
                  Alert('DESCONTO SUPERIOR AO PERMITIDO!',,'w+/r*')
                  loop
               Endif

               If nCodigo == 2501 .and. nDesconto > 15
                  Alert('DESCONTO SUPERIOR AO PERMITIDO!',,'w+/r*')
                  loop
               Endif

               If nCodigo == 3001 .and. nDesconto > 10
                  Alert('DESCONTO SUPERIOR AO PERMITIDO!',,'w+/r*')
                  loop
               Endif

               //Se todos os estoques chegarem a zero ele perguntar  se quer finalizar pedido.
               If nEstoqueBatata <= 0 .and. nEstoquePera <= 0 .and. nEstoqueBanana <= 0
                  Alert('TODOS ESTOQUES ESGOTADOS!',,'w+/r*')
                  lFinalizaPedido := .t.
               Endif

               //Chegando ao valor com desconto.
               nValorTotalDigitado := (( nValorTotalDigitado) - (( nValorTotalDigitado) * nDesconto / 100  ))
               nLimiteCredito      := ( nLimiteCredito - nValorTotalDigitado )
               nValorTotalGeral    := ( nValorTotalGeral + nValorTotalDigitado - nDescontoParaPera )
               nDescontoParaPera   := 0 //Estava deixando o valor total negativo.

               //Caso o limite seja estrapolado o pedido ‚ cancelado e o n£mero do pedido ‚ corrigido.
               If nLimiteCredito < 0
                  Alert('ESTRAPOLOU SEU CREDITO, PEDIDO CANCELADO!',,'W+/R*')
                  nNumeroPedido --
                  Clear
                  exit
               Endif

               //Caso dejese finalizar ou cancelar o pedido ou limite iguale a zero.
               If LastKey() == 27 .or. nLimiteCredito == 0 .or. lFinalizaPedido
                  nResposta := Alert('DESEJA ENCERRAR PEDIDO?',{'SIM','NAO'},'w+/b*')

                  If nResposta == 1 .or. nLimiteCredito == 0 .or. lFinalizaPedido
                     ///
                     do While nValorTotalGeral > 0

                        nValorPagamento := 0

                        Clear
                        @ 00,00 to 06,79 Double
                        @ 04,01 to 04,78

                        @ 01,01 say PadC('MUITO OBRIGADO',78) Color 'r+/w*'
                        Set Color to b+/w*
                        @ 02,01 say 'O pedido de '+AllTrim(cNomeCliente)+ ' ficou em: '+AllTrim(Str(nValorTotalGeral,15 ,2))+ ' Reais.'
                        @ 03,01 say 'E restaram: ' +AllTrim(Str(nLimiteCredito,15 ,2))+ ' Reais de cr‚dito.'

                        nResposta := 0
                        nResposta := Alert('FORMA DE PAGAMENTO:',{'DINHEIRO','CHEQUE','CARTAO DE CREDITO'},'w+/b*')

                        If nResposta == 1
                           @ 05,01 say 'DIGITE O VALOR EM DINHEIRO:'

                           @ 05,28 get nValorPagamento picture '999,999.00' valid nValorPagamento <= nValorTotalGeral
                           read
                           nValorTotalGeral := ( nValorTotalGeral - nValorPagamento )
                           loop

                        Elseif nResposta == 2
                           @ 05,01 say 'DIGITE O VALOR NO CHEQUE:'

                           @ 05,28 get nValorPagamento picture '999,999.00' valid nValorPagamento <= nValorTotalGeral
                           read
                           nValorTotalGeral := ( nValorTotalGeral - nValorPagamento )
                           loop

                        Else

                           If nUsoCartao > 0
                              Alert('ESSA OPCAO PODE SER USADA APENAS UMA VEZ, ESCOLHA OUTRA!',,'w+/r*')
                              loop
                           Endif

                           @ 05,01 say 'DIGITE O VALOR EM CARTAO DE CREDITO:'

                           @ 05,28 get nValorPagamento picture '999,999.00' valid nValorPagamento <= nValorTotalGeral
                           read
                           nValorTotalGeral := ( nValorTotalGeral - nValorPagamento )
                           nUsoCartao ++
                           loop

                        Endif

                        //Mostrando a possibilidade de levar a Pera devido a promo‡Æo.
                        If nEstoquePera == 117.50 .and. cPromocao == 'S'
                           Alert('Caro Cliente '+AllTrim(cNomeCliente)+ ' nao esqueca de levar seus '+AllTrim(Str(nQuantidadePeraGanha))+ 'Kg de Pera GRATUITO!',,'w+/b*')
                        Endif

                     Enddo

                     InKey(1)
                     Alert('OBRIGADO COM COMPRAR CONOSCO!',,'w+/b*')

                     nResposta := 0
                     nResposta := Alert('DESEJA FAZER OUTRO PEDIDO?',{'SIM','NAO'},'w+/b*')

                     If nResposta == 1

                        lRealizarPedido := .t.
                        Clear
                        nNumeroPedido ++
                        Set Color to m/w*

                        //Se todos os estoques chegarem a zero ele nÆo deixar  fazer outro pedido.
                        If nEstoqueBatata <= 0 .and. nEstoquePera <= 0 .and. nEstoqueBanana <= 0
                           Alert('TODOS ESTOQUES ESGOTADOS!',,'w+/r*')
                           lRealizarPedido := .f.
                           exit
                        Endif

                        exit
                     Else

                        lRealizarPedido := .f.
                        exit
                     Endif

                  Else

                     loop

                  Endif

               Endif

               @ nLinha,69 say +AllTrim(Str(nValorTotalDigitado,15 ,2))
               //Imprimindo em tempo real o valor total do pedido e o limite restante.
               @ 23,01 say 'VALOR TOTAL: ' +AllTrim(Str(nValorTotalGeral, 15, 2))+ ' E LIMITE ATUAL: ' +AllTrim(Str(nLimiteCredito, 15, 2))  Color 'b+/w*'
               nLinha ++

               //Fazendo controle de linhas.
               If nLinha == 22
                  @ 03,01 Clear to 21,78
                  nLinha := 3
               Endif


            Enddo

            loop

         Enddo

            InKey(1)
            nNumeroPedido ++

      Else
         exit
      Endif

   Else
      Alert('Senha ou Login INCORRETOS!',,'w+/r*')
      loop
   Endif

   exit
Enddo

InKey(1)
Clear
