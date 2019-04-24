//LUIZ FLµVIO PEREIRA

Set Color to m/w*
Set Date British
Set Epoch to 1940
Set Cursor Off
clear

//Bloco de Vari veis
cSituacaoAluno    := Space(40)
cCurso            := Space(27)
cNomeAluno        := Space(45)
cDependencia      := Space(60)
cDisciplinaA      := Space(10)
cDisciplinaB      := Space(10)
cDisciplinaC      := Space(10)
cDisciplinaD      := Space(10)
cDisciplinaE      := Space(10)
cDisciplinaF      := Space(10)

dDataNascimento   := CToD('')
dDataAtual        := Date()

nAnoLetivo        := 0
nSerie            := 0
nValorMensalidade := 0
nNotaA1           := 0
nNotaA2           := 0
nNotaA3           := 0
nNotaA4           := 0
nNotaB1           := 0
nNotaB2           := 0
nNotaB3           := 0
nNotaB4           := 0
nNotaC1           := 0
nNotaC2           := 0
nNotaC3           := 0
nNotaC4           := 0
nNotaD1           := 0
nNotaD2           := 0
nNotaD3           := 0
nNotaD4           := 0
nNotaE1           := 0
nNotaE2           := 0
nNotaE3           := 0
nNotaE4           := 0
nNotaF1           := 0
nNotaF2           := 0
nNotaF3           := 0
nNotaF4           := 0
nFaltaA1          := 0
nFaltaA2          := 0
nFaltaA3          := 0
nFaltaA4          := 0
nFaltaB1          := 0
nFaltaB2          := 0
nFaltaB3          := 0
nFaltaB4          := 0
nFaltaC1          := 0
nFaltaC2          := 0
nFaltaC3          := 0
nFaltaC4          := 0
nFaltaD1          := 0
nFaltaD2          := 0
nFaltaD3          := 0
nFaltaD4          := 0
nFaltaE1          := 0
nFaltaE2          := 0
nFaltaE3          := 0
nFaltaE4          := 0
nFaltaF1          := 0
nFaltaF2          := 0
nFaltaF3          := 0
nFaltaF4          := 0
nMediaA           := 0
nMediaB           := 0
nMediaC           := 0
nMediaD           := 0
nMediaE           := 0
nMediaF           := 0
nTotalFaltaA      := 0
nTotalFaltaB      := 0
nTotalFaltaC      := 0
nTotalFaltaD      := 0
nTotalFaltaE      := 0
nTotalFaltaF      := 0
nQuantReprovas    := 0
nValorAumento     := 0
nNovoAnoLetivo    := 0
nFaltaMaxima      := 48
nNotaMinima       := 6
nQuantRepEmDep    := 2
nAdicional        := 12

//Fazendo as Tabelas(Layout).
@ 01,01 to 24,78 Double
@ 10,02 to 10,77
@ 11,21 to 19,21
@ 11,32 to 19,32
@ 11,42 to 19,42
@ 11,53 to 19,53
@ 11,64 to 19,64
@ 13,02 to 13,77
@ 20,02 to 20,77

//Cabe‡alho Inicial.
@ 02,03 say PadC(' Boletim Escolar ',74,'*')
@ 03,03 say 'Col‚gio Estadual SG Sistemas.'
@ 04,03 say 'Rua Mamonas Assassinas         N§:10'
@ 04,43 say 'Telefone:(44)1234-5678)'
@ 05,03 say 'Aluno:'
@ 05,55 say 'S‚rie:'
@ 04,67 say +DToC(dDataAtual)
@ 06,55 say 'Data Nasc.:'
@ 06,20 say 'Curso:'
@ 06,03 say 'Ano Letivo:'
@ 07,03 say 'Valor da Mensalidade..:'
@ 08,03 say 'Digite os nomes das Disciplinas:'

//Abaixo do Cabe‡alho Inicial.
@ 11,08 say 'Disciplinas'
@ 11,25 say '1§Bim.'
@ 11,35 say '2§Bim.'
@ 11,45 say '3§Bim.'
@ 11,56 say '4§Bim.'
@ 11,67 say 'Res.Final'
@ 12,25 say ' N/F        N/F       N/F        N/F         N/F'

//Colhendo dados Aluno/Curso.
@ 05,09 get cNomeAluno          picture '@!'         valid !Empty(cNomeAluno)
@ 05,62 get nSerie              picture '9'          valid nSerie>0
@ 06,15 get nAnoLetivo          picture '9999'       valid !Empty(nAnoLetivo)
@ 06,27 get cCurso              picture '@!'         valid !Empty(cCurso)
@ 06,67 get dDataNascimento                          valid !Empty(dDataNascimento)
@ 07,27 get nValorMensalidade   picture '999,999.99' valid nValorMensalidade>0
@ 09,03 get cDisciplinaA        picture '@!'         valid !Empty(cDisciplinaA)
@ 09,15 get cDisciplinaB        picture '@!'         valid !Empty(cDisciplinaB)
@ 09,27 get cDisciplinaC        picture '@!'         valid !Empty(cDisciplinaC)
@ 09,39 get cDisciplinaD        picture '@!'         valid !Empty(cDisciplinaD)
@ 09,51 get cDisciplinaE        picture '@!'         valid !Empty(cDisciplinaE)
@ 09,63 get cDisciplinaF        picture '@!'         valid !Empty(cDisciplinaF)
read

//Imprimindo as Disciplinas.
@ 14,03 say +AllTrim(cDisciplinaA)
@ 15,03 say +AllTrim(cDisciplinaB)
@ 16,03 say +AllTrim(cDisciplinaC)
@ 17,03 say +AllTrim(cDisciplinaD)
@ 18,03 say +AllTrim(cDisciplinaE)
@ 19,03 say +AllTrim(cDisciplinaF)

//Colhendo as notas e faltas do primeiro bimestre.
@ 14,23 get nNotaA1             picture '99.9'       valid nNotaA1>=0 .and. nNotaA1<=10
@ 14,28 get nFaltaA1            picture '99'         valid nFaltaA1>=0
@ 15,23 get nNotaB1             picture '99.9'       valid nNotaB1>=0 .and. nNotaB1<=10
@ 15,28 get nFaltaB1            picture '99'         valid nFaltaB1>=0
@ 16,23 get nNotaC1             picture '99.9'       valid nNotaC1>=0 .and. nNotaC1<=10
@ 16,28 get nFaltaC1            picture '99'         valid nFaltaC1>=0
@ 17,23 get nNotaD1             picture '99.9'       valid nNotaD1>=0 .and. nNotaD1<=10
@ 17,28 get nFaltaD1            picture '99'         valid nFaltaD1>=0
@ 18,23 get nNotaE1             picture '99.9'       valid nNotaE1>=0 .and. nNotaE1<=10
@ 18,28 get nFaltaE1            picture '99'         valid nFaltaE1>=0
@ 19,23 get nNotaF1             picture '99.9'       valid nNotaF1>=0 .and. nNotaF1<=10
@ 19,28 get nFaltaF1            picture '99'         valid nFaltaF1>=0

//Colhendo as notas e faltas do segundo bimestre.
@ 14,34 get nNotaA2             picture '99.9'       valid nNotaA2>=0 .and. nNotaA2<=10
@ 14,39 get nFaltaA2            picture '99'         valid nFaltaA2>=0
@ 15,34 get nNotaB2             picture '99.9'       valid nNotaB2>=0 .and. nNotaB2<=10
@ 15,39 get nFaltaB2            picture '99'         valid nFaltaB2>=0
@ 16,34 get nNotaC2             picture '99.9'       valid nNotaC2>=0 .and. nNotaC2<=10
@ 16,39 get nFaltaC2            picture '99'         valid nFaltaC2>=0
@ 17,34 get nNotaD2             picture '99.9'       valid nNotaD2>=0 .and. nNotaD2<=10
@ 17,39 get nFaltaD2            picture '99'         valid nFaltaD2>=0
@ 18,34 get nNotaE2             picture '99.9'       valid nNotaE2>=0 .and. nNotaE2<=10
@ 18,39 get nFaltaE2            picture '99'         valid nFaltaE2>=0
@ 19,34 get nNotaF2             picture '99.9'       valid nNotaF2>=0 .and. nNotaF2<=10
@ 19,39 get nFaltaF2            picture '99'         valid nFaltaF2>=0

//Colhendo as notas e faltas do terceiro bimestre.
@ 14,44 get nNotaA3             picture '99.9'       valid nNotaA3>=0 .and. nNotaA3<=10
@ 14,49 get nFaltaA3            picture '99'         valid nFaltaA3>=0
@ 15,44 get nNotaB3             picture '99.9'       valid nNotaB3>=0 .and. nNotaB3<=10
@ 15,49 get nFaltaB3            picture '99'         valid nFaltaB3>=0
@ 16,44 get nNotaC3             picture '99.9'       valid nNotaC3>=0 .and. nNotaC3<=10
@ 16,49 get nFaltaC3            picture '99'         valid nFaltaC3>=0
@ 17,44 get nNotaD3             picture '99.9'       valid nNotaD3>=0 .and. nNotaD3<=10
@ 17,49 get nFaltaD3            picture '99'         valid nFaltaD3>=0
@ 18,44 get nNotaE3             picture '99.9'       valid nNotaE3>=0 .and. nNotaE3<=10
@ 18,49 get nFaltaE3            picture '99'         valid nFaltaE3>=0
@ 19,44 get nNotaF3             picture '99.9'       valid nNotaF3>=0 .and. nNotaF3<=10
@ 19,49 get nFaltaF3            picture '99'         valid nFaltaF3>=0

//Colhendo as notas e faltas do quarto bimestre.
@ 14,55 get nNotaA4             picture '99.9'       valid nNotaA4>=0 .and. nNotaA4<=10
@ 14,60 get nFaltaA4            picture '99'         valid nFaltaA4>=0
@ 15,55 get nNotaB4             picture '99.9'       valid nNotaB4>=0 .and. nNotaB4<=10
@ 15,60 get nFaltaB4            picture '99'         valid nFaltaB4>=0
@ 16,55 get nNotaC4             picture '99.9'       valid nNotaC4>=0 .and. nNotaC4<=10
@ 16,60 get nFaltaC4            picture '99'         valid nFaltaC4>=0
@ 17,55 get nNotaD4             picture '99.9'       valid nNotaD4>=0 .and. nNotaD4<=10
@ 17,60 get nFaltaD4            picture '99'         valid nFaltaD4>=0
@ 18,55 get nNotaE4             picture '99.9'       valid nNotaE4>=0 .and. nNotaE4<=10
@ 18,60 get nFaltaE4            picture '99'         valid nFaltaE4>=0
@ 19,55 get nNotaF4             picture '99.9'       valid nNotaF4>=0 .and. nNotaF4<=10
@ 19,60 get nFaltaF4            picture '99'         valid nFaltaF4>=0
read

//Tirando a m‚dia das notas de todas as disciplinas.
nMediaA := (( nNotaA1 + nNotaA2 + nNotaA3 + nNotaA4) / 4 )
nMediaB := (( nNotaB1 + nNotaB2 + nNotaB3 + nNotaB4) / 4 )
nMediaC := (( nNotaC1 + nNotaC2 + nNotaC3 + nNotaC4) / 4 )
nMediaD := (( nNotaD1 + nNotaD2 + nNotaD3 + nNotaD4) / 4 )
nMediaE := (( nNotaE1 + nNotaE2 + nNotaE3 + nNotaE4) / 4 )
nMediaF := (( nNotaF1 + nNotaF2 + nNotaF3 + nNotaF4) / 4 )

//Somando o total de faltas de todas disciplinas.
nTotalFaltaA := ( nFaltaA1 + nFaltaA2 + nFaltaA3 + nFaltaA4 )
nTotalFaltaB := ( nFaltaB1 + nFaltaB2 + nFaltaB3 + nFaltaB4 )
nTotalFaltaC := ( nFaltaC1 + nFaltaC2 + nFaltaC3 + nFaltaC4 )
nTotalFaltaD := ( nFaltaD1 + nFaltaD2 + nFaltaD3 + nFaltaD4 )
nTotalFaltaE := ( nFaltaE1 + nFaltaE2 + nFaltaE3 + nFaltaE4 )
nTotalFaltaF := ( nFaltaF1 + nFaltaF2 + nFaltaF3 + nFaltaF4 )

//Testa se o Aluno foi aprovado.
nQuantReprovas := 0
cDependencia := ''
If ( nMediaA < nNotaMinima .or. nTotalFaltaA > nFaltaMaxima )
   nQuantReprovas += 1
   cDependencia := cDependencia  + AllTrim(cDisciplinaA) + ' '
Endif

If ( nMediaB < nNotaMinima .or. nTotalFaltaB > nFaltaMaxima )
   nQuantReprovas += 1
   cDependencia := cDependencia + AllTrim(cDisciplinaB) + ' '
Endif

If ( nMediaC < nNotaMinima .or. nTotalFaltaC > nFaltaMaxima )
   nQuantReprovas += 1
   cDependencia := cDependencia + AllTrim(cDisciplinaC) + ' '
Endif

If ( nMediaD < nNotaMinima .or. nTotalFaltaD > nFaltaMaxima )
   nQuantReprovas += 1
   cDependencia := cDependencia + AllTrim(cDisciplinaD) + ' '
Endif

If ( nMediaE < nNotaMinima .or. nTotalFaltaE > nFaltaMaxima )
   nQuantReprovas += 1
   cDependencia := cDependencia + AllTrim(cDisciplinaE) + ' '
Endif

If ( nMediaF < nNotaMinima .or. nTotalFaltaF > nFaltaMaxima )
   nQuantReprovas += 1
   cDependencia := cDependencia + AllTrim(cDisciplinaF) + ' '
Endif


//Verifica se o aluno est  aprovado com dependencia, aprovado ou reprovado.
nAumentoValor := 0
lAlunoDependencia       := .f.

If( nQuantReprovas > 0 .and. nQuantReprovas <= nQuantRepEmDep )
   nValorAumento:= nValorMensalidade * ( nQuantReprovas * 0.1 )
   nValorMensalidade       := ( nValorMensalidade + nValorAumento + ( nQuantReprovas * nAdicional ))
   cSituacaoAluno := 'Aprovado com Dependencia(s).'
   Set Color to b+/w*
Elseif (nQuantReprovas == 0)
   cSituacaoAluno := 'Aprovado!'
   Set Color to g+/w*
Else
   cSituacaoAluno := 'Reprovado!'
   Set Color to r+/w*
   @ 22,03 say 'Repr.Em: ' +AllTrim(cDependencia)
Endif

//Mostra se o aluno ficou em dependencia e as respectivas materias, tamb‚m imprime o aumento do valor.
If(nValorAumento > 0 )
   @ 22,03 say 'Voce ficou com dependencia em: ' +AllTrim(cDependencia)
   @ 23,03 say 'Haver  Aumento de:'             +AllTrim(Str(nValorAumento, 15, 2)) + ',+R$12 por mat‚ria em DP.'
   @ 23,55 say 'Nova Mens.: '                   +AllTrim(Str(nValorMensalidade, 10, 2))  Color ('r+/w*')
Endif

//Imprimindo M‚dias e Faltas na tela para o usu rio.
@ 14,67 say +AllTrim(Str(nMediaA, 4,1 ))
@ 15,67 say +AllTrim(Str(nMediaB, 4,1 ))
@ 16,67 say +AllTrim(Str(nMediaC, 4,1 ))
@ 17,67 say +AllTrim(Str(nMediaD, 4,1 ))
@ 18,67 say +AllTrim(Str(nMediaE, 4,1 ))
@ 19,67 say +AllTrim(Str(nMediaF, 4,1 ))
@ 14,72 say +AllTrim(Str(nTotalFaltaA))
@ 15,72 say +AllTrim(Str(nTotalFaltaB))
@ 16,72 say +AllTrim(Str(nTotalFaltaC))
@ 17,72 say +AllTrim(Str(nTotalFaltaD))
@ 18,72 say +AllTrim(Str(nTotalFaltaE))
@ 19,72 say +AllTrim(Str(nTotalFaltaF))
@ 21,03 say +AllTrim(cSituacaoAluno)

InKey(0)
clear

