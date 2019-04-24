Function Main
SetMode(25,80)
Set Color to m/w*
Set ScoreBoard Off
Set Cursor Off
Set Date British
Set Epoch to 1920
Clear

do While .t.

@ 00,00 to 06,79 Double
@ 02,01 to 02,78

nOpcaoSistema := 0

//In¡cio do programa.
@ 01,01 say 'ESCOLHA O PROGRAMA:'
@ 03,01 say '1) Exerc¡cio KM'
@ 04,01 say '2) Exerc¡cio Palavra'
@ 05,01 say '3) Sair do Sistema!'

@ 01,20 get nOpcaoSistema picture '9' valid ( nOpcaoSistema > 0 .and. nOpcaoSistema <= 3 )
read

clear

   If nOpcaoSistema == 1

      do While .t.

         @ 00,00 to 10,79 Double
         @ 02,01 to 02,78

         //Bloco de Vari veis.
         cModeloVeiculo       := Space(40)
         cMarcaVeiculo        := Space(40)

         nAnoVeiculo          := 0
         nKmInicial           := 0
         nKmFinal             := 0
         nLitrosConsumidos    := 0
         nPrecoPorLitro       := 0
         nDistanciaPercorrida := 0
         nValorTotal          := 0
         nKmPorLitro          := 0

         @ 01,01 say PadC('PREENCHA OS DADOS A SEGUIR!',78 )
         @ 03,01 say 'Modelo...........:'
         @ 04,01 say 'Marca............:'
         @ 05,01 say 'Ano..............:'
         @ 06,01 say 'KM inicial.......:'
         @ 07,01 say 'KM Final.........:'
         @ 08,01 say 'Litros Consumidos:'
         @ 09,01 say 'Preco por Litro..:'

         @ 03,19 get cModeloVeiculo    picture '@!'      valid !Empty(cModeloVeiculo)
         @ 04,19 get cMarcaVeiculo     picture '@!'      valid !Empty(cMarcaVeiculo)
         @ 05,19 get nAnoVeiculo       picture '9999'    valid nAnoVeiculo > 0
         @ 06,19 get nKmInicial        picture '9999999' valid nKmInicial >= 0
         @ 07,19 get nKmFinal          picture '9999999' valid nKmFinal > nKmInicial
         @ 08,19 get nLitrosConsumidos picture '9999999' valid nLitrosConsumidos > 0
         @ 09,19 get nPrecoPorLitro    picture '9.99'    valid nPrecoPorLitro > 0
         read

         If LastKey() == 27
            Clear
            exit
         Endif

         //Obtendo Resultados;
         nDistanciaPercorrida := ( nKmFinal - nKmInicial )
         nValorTotal          := ( nLitrosConsumidos * nPrecoPorLitro )
         nKmPorLitro          := ( nDistanciaPercorrida / nLitrosConsumidos )

         Clear

         @ 00,00 to 11,79 Double
         @ 02,01 to 02,78

         //Imprimindo relat¢rio.
         @ 01,01 say PadC('RELATORIO OBTIDO',78 )
         @ 03,01 say 'Modelo..............:' +AllTrim(cModeloVeiculo)
         @ 04,01 say 'Marca...............:' +AllTrim(cMarcaVeiculo)
         @ 05,01 say 'Ano.................:' +AllTrim(Str(nAnoVeiculo))
         @ 06,01 say 'Distancia Percorrida:' +AllTrim(Str(nDistanciaPercorrida))
         @ 07,01 say 'Litros Consumidos...:' +AllTrim(Str(nLitrosConsumidos))
         @ 08,01 say 'Valor do Litro......:' +AllTrim(Str(nPrecoPorLitro))
         @ 09,01 say 'Valor Total.........:' +AllTrim(Str(nValorTotal))
         @ 10,01 say 'KM Por Litro........:' +AllTrim(Str(nKmPorLitro))

         InKey(0)
         Clear

      Enddo

   Elseif nOpcaoSistema == 2

      do While .t.

         @ 00,00 to 02,79 Double

         //Bloco de Var veis
         cPalavra              := Space(22)
         cInvertida            := ''
         cPercorrePalavra      := ''
         cLetrasVogais         := ''
         cLetrasConsoantes     := ''
         cPalavraIntercalada   := ''

         nLetra                := 0
         nTamanhoPalavra       := 0
         nQuantidadeDeA        := 0
         nQuantidadeVogais     := 0
         nQuantidadeConsoantes := 0

         @ 01,01 say 'Digite uma Palavra:'

         @ 01,20 get cPalavra picture '@!' valid !Empty(cPalavra)
         read

         If LastKey() == 27
            Clear
            exit
         Endif

         /*
         //OBTENDO OS RESULTADOS.
         nTamanhoPalavra := Len(AllTrim(cPalavra))

         //Invertendo a palavra.
         do While nTamanhoPalavra > 0

            cInvertida += SubStr( cPalavra, nTamanhoPalavra , 1 )

            //Pegando a quantida de A(s).
            If SubStr( cPalavra, nTamanhoPalavra, 1 ) == 'A'

               nQuantidadeDeA += 1

            Endif

            //Pegando a quantidade de Vogais e as Letras.
            If SubStr( cPalavra, nTamanhoPalavra, 1 ) == 'A' .or. SubStr( cPalavra, nTamanhoPalavra, 1 ) == 'E' .or. SubStr( cPalavra, nTamanhoPalavra, 1 ) == 'I' .or. SubStr( cPalavra, nTamanhoPalavra, 1 ) == 'O' .or. SubStr( cPalavra, nTamanhoPalavra, 1 ) == 'U'

               nQuantidadeVogais += 1
               cLetrasVogais += Upper(SubStr( cPalavra, nTamanhoPalavra, 1 ))

            Else //Pegando a quantidade de Consoantes e as Letras.

               nQuantidadeConsoantes += 1
               cLetrasConsoantes += Upper(SubStr( cPalavra, nTamanhoPalavra, 1 ))

            Endif

            //Intercalando Mai£scula e Min£scula.
            If nTamanhoPalavra % 2 == 0
               cPalavraIntercalada += SubStr( cPalavra, nTamanhoPalavra, 1 )
            Else
               cPalavraIntercalada += Lower(SubStr( cPalavra, nTamanhoPalavra, 1 ))
            Endif

            nTamanhoPalavra -- //Para manuten‡Æo do while.
         Enddo */

         For nLetra := 1 to Len(cPalavra)

            cLetra    := SubStr(cPalavra, nLetra, 1)
            nContador := Len(cPalavra)

            If cLetra == 'A'
               nQuantidadeDeA ++
            Endif

            If cLetra == 'A' .or.  cLetra == 'E' .or.  cLetra == 'I' .or.  cLetra == 'O' .or.  cLetra == 'U'
               nQuantidadeVogais ++
               cLetrasVogais += cLetra
            Else
               nQuantidadeConsoantes ++
               cLetrasConsoantes += cLetra
            Endif

            If nLetra % 2 != 0
               cPalavraIntercalada += Lower(cLetra)
            Else
               cPalavraIntercalada += cLetra
            Endif

            do While nContador > 0

               cInvertida += SubStr( cPalavra, nContador , 1 )

               nContador --

            Enddo

         Next

         Clear

         @ 00,00 to 10,79 Double
         @ 02,01 to 02,78

         //Imprimindo relat¢rio.
         @ 01,01 say PadC('RESULTADOS FINAIS',78 )
         @ 03,01 say 'Quantidade de A(s)..................:' +AllTrim(Str(nQuantidadeDeA))
         @ 04,01 say 'Quantidade de Vogais................:' +AllTrim(Str(nQuantidadeVogais))
         @ 05,01 say 'Quantidade de Consoantes............:' +AllTrim(Str(nQuantidadeConsoantes))
         @ 06,01 say 'Vogais em Mai£sculo.................:' +AllTrim(cLetrasVogais)
         @ 07,01 say 'Consoantes em Mai£sculo.............:' +AllTrim(cLetrasConsoantes)
         @ 08,01 say 'Palavra digitada Mai£scula/Min£scula:' +AllTrim(cPalavraIntercalada)
         @ 09,01 say 'Palavra digitada Invertida..........:' +AllTrim(cInvertida)

         InKey(0)
         Clear

      Enddo

   //Saindo do sistema.
   Else
      exit
   Endif

Enddo

InKey(1)
Clear
