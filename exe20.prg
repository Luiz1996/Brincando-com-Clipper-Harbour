Set Color to m/w*
Set ScoreBoard Off
Set Cursor Off
Clear
@ 00,00 to 24,79 Double

/* for nContador := 1 to 10 step 2
      comandos
      comandos
   next

d  pra usar:
loop e exit */
//--------------------
nSoma := 0

For nContador := 10 to 50
   nSoma += nContador
Next

@ 01,01 say 'A Soma de 10 at‚ 50 ‚: '+AllTrim(Str(nSoma))

InKey(0)
Clear
