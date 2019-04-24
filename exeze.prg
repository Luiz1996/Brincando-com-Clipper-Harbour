Function Main
Set Date British
Set ScoreBoard Off
SetMode(25,80)
Set Color to m/w*
Set Cursor Off
Clear

@ 00,00 to 04,79 Double
@ 02,01 to 02,78

dDataAtual := Date()

//Achando o dia da semana a ser impresso por extenso.
   If Dow(dDataAtual) == 1
      cSemana := 'Domingo'
   Elseif Dow(dDataAtual) == 2
      cSemana := 'Segunda-Feira'
   Elseif Dow(dDataAtual) == 3
      cSemana := 'Terca-Feira'
   Elseif Dow(dDataAtual) == 4
      cSemana := 'Quarta-Feira'
   Elseif Dow(dDataAtual) == 5
      cSemana := 'Quinta-Feira'
   Elseif Dow(dDataAtual) == 6
      cSemana := 'Sexta-Feira'
   Elseif Dow(dDataAtual) == 7
      cSemana := 'S bado'
   Endif

//Achando o mˆs a ser impresso na tela por extenso.
   If Month(dDataAtual) == 1
      cMes := 'Janeiro'
   Elseif Month(dDataAtual) == 2
      cMes := 'Fevereiro'
   Elseif Month(dDataAtual) == 3
      cMes := 'Marco'
   Elseif Month(dDataAtual) == 4
      cMes := 'Abril'
   Elseif Month(dDataAtual) == 5
      cMes := 'Maio'
   Elseif Month(dDataAtual) == 6
      cMes := 'Junho'
   Elseif Month(dDataAtual) == 7
      cMes := 'Julho'
   Elseif Month(dDataAtual) == 8
      cMes := 'Agosto'
   Elseif Month(dDataAtual) == 9
      cMes := 'Setembro'
   Elseif Month(dDataAtual) == 10
      cMes := 'Outubro'
   Elseif Month(dDataAtual) == 11
      cMes := 'Novembro'
   Elseif Month(dDataAtual) == 12
      cMes := 'Dezembro'
   Endif

//Imprimindo por extenso a data atual.
@ 01,01 say 'Maring , ' +AllTrim(Str(Day(dDataAtual)))+ ' de ' +AllTrim(cMes)+ ' de ' +AllTrim(Str(Year(dDataAtual)))+' (' +AllTrim(cSemana)+ ').'


do While .t.

   nResposta := 0
   cNome     := Space(40)

   @ 03,01 say 'Nome:'

   @ 03,07 get cNome picture '@!' valid !Empty(cNome)
   read

   If !Empty(cNome)
   Alert('O Nome digitado foi: ' +AllTrim(cNome),,'w+/b*')
   Endif

   If LastKey() == 27
      nResposta := Alert('Deseja realmente sair?: ' ,{'Sim','Nao'}  , 'w+/r*')

      If nResposta == 1
         exit
      Else
         loop
      Endif

   Endif

Enddo


InKey(1)
clear
