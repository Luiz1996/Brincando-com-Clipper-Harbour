
/*
CTRO+F PESQUISA
CTRL+R PESQUISA E SUBSTITUI
CTRL+PG UP INICIO DO ARQUIVO
CTRL+PG DWN FIM DO ARQUIVO
*/

/*
CORES DE SETCOLOR
M PRETO
B AZUL
R VERMELHO
G VERDE
W BRANCO
GR MARROM
RB MAGENTA
BG CIANO
GR+ AMARELO
B+ AZUL CLARO FRENTE
B* AZUL CLARO FUNDO


Set Confirm On : para insistir que o cliente de enter pra ir pro próx campo
Set Centry On : para a data ficar com 4 digitos no ano.
Set Scoreboard : tira a falha na tabela qdo feita na primeira linha

Para data obrigatorio:
Set Date British : pra usar variavel modo data
Set Epoch to 1940 : pra entender que 02 é 1902 e nao 2002

 PadR()
   PadL()
   PadC()

@ 00,00 to 20,79
@ 01,01 say PadC('SG Trainee',78, '*')

MUITO IMPORTANTE
@ 01,01 get nIdade picture '999' valid nIdade>0

--------------------------------
Empty() retorna
         .t. se vazio

@ 10,05 get cProduto

-----------------------

Alert ('Teste',,'w/b')

---------------------------
MUDAR UMA LINHA ESPECIFICA:
 Color ('m/w*')

*/
/*

Do while (condicao)

   COMANDOS
   COMANDOS
   COMANDOS

Enddo

---------------------------
loop : retorna p/ o primeiro while que encontrar.

exit : força a saída



-------------------------




Len() - Retorna o tamanho de um texto/string

Len('Fabio')      --> 5
Len('SG_Trainee') --> 10

cNome := Space(20)
@ 3,0 get nome picture '@!'
read

@ 5,0 say Len(cNome)          --> Retorna 20
@ 6,0 say Len(AllTrim(cNome)) --> Retorna tamanho do nome digitado

-------------------------------------------------------------------

SubStr() - Extrai um texto de uma string

SubStr('Fabio',1,1) --> 'F'
        -----  - -
          |    | |
        texto  | Qtde de letras a partir da pos inicial
               pos. inicial

SubStr('Funcao',3,2) --> 'nc'
SubStr('Funcao',2)   --> 'uncao'

-------------------------------------------------------------------

Upper() - Deixa palavra mai£scula
Upper(cPalavra)

Lower() - Deixa a palavra min£scula

-------------------------------------------------------------------

Left()
cPalavraDigitada := 'SG Sistemas'
cPalavra := Left(cPalavraDigitada,4) --> 'SG S'


Right()


Time()
*/































