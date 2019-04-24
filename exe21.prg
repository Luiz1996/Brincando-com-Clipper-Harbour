Set ScoreBoard Off
Set Color to m/w*
Set Cursor Off
Clear

@ 00,00 to 06,79 Double
@ 03,01 to 03,78

cNomeMagro := ''
cNomeGordo := ''
nPesoGordo := 0
nPesoMagro := 9999

For nContador := 1 to 6

   cNome      := Space(40)
   nPeso      := 0

   @ 01,01 say 'Nome: '
   @ 02,01 say 'Peso: '

   @ 01,06 get cNome picture '@!'      valid !Empty(cNome)
   @ 02,06 get nPeso picture '999,999' valid nPeso > 0
   read

   If nPeso < nPesoMagro
      nPesoMagro := nPeso
      cNomeMagro := cNome
   Endif

   If nPeso > nPesoGordo
      nPesoGordo := nPeso
      cNomeGordo := cNome
   Endif

Next

@ 04,01 say 'O mais magro ‚: '+AllTrim(cNomeMagro)+ ', com peso: ' +AllTrim(Str(nPesoMagro))
@ 05,01 say 'O mais gordo ‚: '+AllTrim(cNomeGordo)+ ', com peso: ' +AllTrim(Str(nPesoGordo))

InKey(0)
Clear
