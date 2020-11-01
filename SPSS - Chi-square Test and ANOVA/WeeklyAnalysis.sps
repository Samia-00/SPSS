* Encoding: UTF-8.
DATASET NAME DataSet1 WINDOW=FRONT.
SORT CASES BY gender .
SPLIT FILE
  LAYERED BY gender .
CROSSTABS
  /TABLES=method  BY computer
  /FORMAT= AVALUE TABLES
  /CELLS= COUNT
  /COUNT ROUND CELL .
SPLIT FILE
  OFF.
T-TEST
  GROUPS = gender(1 2)
  /MISSING = ANALYSIS
  /VARIABLES = pretest
  /CRITERIA = CI(.95) .
T-TEST
  GROUPS = gender(1 2)
  /MISSING = ANALYSIS
  /VARIABLES = posttest
  /CRITERIA = CI(.95) .
T-TEST
  PAIRS = pretest  WITH posttest (PAIRED)
  /CRITERIA = CI(.95)
  /MISSING = ANALYSIS.
UNIANOVA
  posttest  BY gender computer method
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /CRITERIA = ALPHA(.05)
  /DESIGN = gender computer method gender*computer gender*method computer
 *method gender*computer*method .
SORT CASES BY gender .
SPLIT FILE
  LAYERED BY gender .
UNIANOVA
  posttest  BY computer method
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /CRITERIA = ALPHA(.05)
  /DESIGN = computer method computer*method .
GRAPH
  /SCATTERPLOT(BIVAR)=pretest WITH posttest
  /MISSING=LISTWISE .
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT posttest
  /METHOD=ENTER pretest  .
SPLIT FILE
  OFF.
GRAPH
  /SCATTERPLOT(BIVAR)=pretest WITH posttest
  /MISSING=LISTWISE .
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT posttest
  /METHOD=ENTER pretest  .
