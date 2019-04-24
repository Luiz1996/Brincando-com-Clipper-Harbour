Set Color to m/w*
Set Date British
clear

dDataAtual     := Date()
dData          := CtoD('')
cLetra         := Space(1)
cString        := Space(40)
nNumeroInteiro := 0
nNumeroDecimal := 0

@ 01,01 say 'Digite uma Data:'
@ 02,01 say 'Digite uma Letra:'
@ 03,01 say 'Digite na String:'
@ 04,01 say 'Digite um N£mero Inteiro:'
@ 05,01 say 'Digite um N£mero Decimal:'

@ 01,17 get dData                               valid !Empty(dData)
@ 02,18 get cLetra         picture 'A!'         valid !Empty(cLetra)
@ 03,18 get cString        picture '@!'         valid !Empty(cString)
@ 04,27 get nNumeroInteiro picture '99999'      valid nNumeroInteiro>0
@ 05,27 get nNumeroDecimal picture '999,999.99' valid nNumeroDecimal>0
read

clear

@ 01,01 say 'Data Atual:'      +DToC(dDataAtual)
@ 02,01 say 'Data Digitada:'   +DToC(dData)
@ 03,01 say 'Letra Escolhida:' +AllTrim(cLetra)
@ 04,01 say 'Texto Digitado:'  +AllTrim(cString)
@ 05,01 say 'N£mero Inteiro:'  +AllTrim(Str(nNumeroInteiro))
@ 06,01 say 'N£mero Decimal:'  +AllTrim(Str(nNumeroDecimal))

InKey(0)
clear
