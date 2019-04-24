Set Color to m/w*

clear

Set Date British
Set Epoch to 1940

@ 01,01 to 08,61 Double

dDataNascimento := cToD('')
dDataAtual      := Date()
cNomePessoal    := Space(40)
nIdade          := 0
nPeso           := 0
nValorCelular   := 0

@ 03,03 say 'Digite seu Nome:'
@ 04,03 say 'Forneca sua Idade:'
@ 05,03 say 'Insira seu Peso:'
@ 06,03 say 'Digite a Data de Nascimento:'
@ 07,03 say 'Digite o valor do seu Celular:'

@ 03,20 get cNomePessoal    picture '@!'            valid !Empty(cNomePessoal)
@ 04,22 get nIdade          picture '999'           valid nIdade > 0
@ 05,20 get nPeso           picture '999.999'       valid nPeso  > 0
@ 06,31 get dDataNascimento                         valid !Empty(dDataNascimento)
@ 07,34 get nValorcelular   picture '@E 999,999.99' valid nValorcelular > 0
read

clear

@ 01,01 to 10,63 Double

@ 03,03 say 'Nome..............:'+AllTrim(cNomePessoal)
@ 04,03 say 'Idade.............:'+AllTrim(str(nIdade))
@ 05,03 say 'Peso..............:'+AllTrim(Str(nPeso))
@ 05,29 say 'Quilos.'
@ 06,03 say 'Data de Nascimento:'+DToC(dDataNascimento)
@ 07,03 say 'Data Atual........:'+DToC(dDataAtual)
@ 08,03 say 'Valor do Celular..:'+Transform(nValorCelular,'@E 999,999.99')
@ 08,32 say 'Reais.'
@ 11,01 say ''

Inkey (0)
clear


