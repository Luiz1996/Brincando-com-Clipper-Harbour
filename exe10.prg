Set Color to m/w*
Set Date British
Set Cursor Off
clear

cNomeUsuario := Space(40)
nIdade       := 0
dDataAtual   := Date()

@ 01,01 to 07,75 Double

@ 02,03 say 'Digite seu Nome:'
@ 03,03 say 'Informe sua Idade:'
@ 03,65 say +DToC(dDataAtual)

@ 02,19 get cNomeUsuario picture '@!'   valid !Empty(cNomeUsuario)
@ 03,21 get nIdade       picture '999'  valid nIdade>0
read

// Sempre inicial IF, Else, Elseif, Endif com letras mai�sculas.
// N�o precisa fechar Elseif

If ( nIdade > 21)
   @ 05,03 say 'Okay ' + AllTrim(cNomeUsuario) + ', voc� j� pode beber!'
   Set Color to r+/w*
   @ 06,25 say 'Se beber nao DIRIJA!'
Elseif ( nIdade == 21 )
   @ 05,03 say + AllTrim(cNomeUsuario) + ', voc� possui exatamente 21Anos.'
   Set Color to r+/w*
   @ 06,20 say 'J� pode Beber, se Beber nao dirija!'
Else
   Set Color to r+/w*
   @ 05,03 say + AllTrim(cNomeUsuario) + ', voc� nao pode Beber!'
Endif

InKey(0)
clear
