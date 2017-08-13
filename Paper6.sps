* Encoding: UTF-8.
********************** PAPER 6 ************************

**DATA SOURCES**

*NACCHO data obtained from: http:// nacchoprofilestudy.org/data-requests/, "2008 Profile Study"

**CODE INFORMATION**

*Written by: Yiqiang Zhao & Jenine Harris*
*Github Link: https://github.com/coding2share/phssr-reproducibility/blob/master/Paper6.sav*

************************************************************

*** RETRIEVE DATABASE ****

GET FILE='file path goes here'. 
DATASET NAME DataSet1 WINDOW=FRONT. 

*** RESTRICT TO MODULE 3 ***

DATASET ACTIVATE DataSet1. 
DATASET COPY  Module3. 
DATASET ACTIVATE  Module3. 
FILTER OFF. 
USE ALL. 
SELECT IF (module = 3). 
EXECUTE. 
DATASET CLOSE DataSet1.

***VARIABLES OF INTEREST***

**module 3: module

** Planning and policy development **
*Emergency Pre And Resp: q248e
*Land Use Plan: q252e
*Tobacco Prev And Cont: q247e
*Influenza: q249e
*Obesity: q250e
*Indoor Air: q251e

** Policy adoption ** 
* pass Policy: q261
* tob Policy: q262a
* emer Policy: q262b
* nut Policy: q262c
* air Policy: q262d
* land Policy: q262e
* other Policy: q262f

** General policy and advocacy areas **
* Afford House: q260a
* Criminal Justice System: q260b
* Education: q260c
* Environment: q260d
* Funding Health Care: q260e
* Land Use: q260f
* Labor: q260g
* Occup Health And Safety: q260h
* Tobacco: q260i

** Policy and advocacy communication Prepared issue briefs **

* Prep Issue Briefs Local: q255a
* Prep Issue Briefs State: q255b
* Prep Issue Briefs Federal: q255c

* Gave Public Test Local: q256a
* Gave Public Test State: q256b
* Gave Public Test Federal: q256c

* Part On Board Or Adv Panel Local: q257a
* Part On Board Or Adv Panel State: q257b
* Part On Board Or Adv Panel Federal: q257c

* Com With Legislators Local: q258a
* Com With Legislators State: q258b
* Com With Legislators Federal: q258c

* Provided Tech Assist Local: q259a
* Provided Tech Assist State: q259b
* Provided Tech Assist Federal: q259c

** RUCA: RUCA_CAT

******************** TABLE 1 *************************

CROSSTABS 
  /TABLES=q248e q252e q247e q249e q250e q251e q255a q255b q255c q256a q256b q256c q257a q257b q257c 
    q258a q258b q258c q259a q259b q259c q260i q260d q260e q260c q260f q260h q260b q260a q260g BY 
    RUCA_CAT 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COLUMN SRESID 
  /COUNT ROUND CELL.

******************** TABLE 2 *************************

** Policy adoption ** 
* pass Policy: q261
* tob Policy: q262a
* emer Policy: q262b
* nut Policy: q262c
* air Policy: q262d
* land Policy: q262e
* other Policy: q262f

CROSSTABS 
  /TABLES=q261 q262a q262b q262c q262d q262e q262f BY 
    RUCA_CAT 
  /FORMAT=AVALUE TABLES 
  /STATISTICS=CHISQ 
  /CELLS=COLUMN SRESID 
  /COUNT ROUND CELL.

******************** TABLE 3 *************************

*Sum responses*

DATASET ACTIVATE Module3. 
COMPUTE planPolicyDevSum=q248e + q252e + q247e + q249e + q250e + q251e. 
EXECUTE. 
COMPUTE localsum=q255a + q256a + q257a + q258a + q259a. 
EXECUTE. 
COMPUTE statesum=q255b + q256b + q257b + q258b + q259b. 
EXECUTE. 
COMPUTE federalsum=q255c + q256c + q257c + q258c + q259c. 
EXECUTE. 
COMPUTE genPolicyAdvSum=q260a + q260b + q260c + q260d + q260e + q260f + q260g +q260h + q260i.
EXECUTE.

*Correlation with corresponding policy adoption in jurisdiction

*all

DATASET ACTIVATE  Module3.
CROSSTABS
  /TABLES=q260i BY q262a
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q260f BY q262e
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q251e BY q262d
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q248e BY q262b
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q250e BY q262c
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=any_policy_activity BY q262g
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.



*urban

DATASET COPY  Urban. 
DATASET ACTIVATE  Urban. 
FILTER OFF. 
USE ALL. 
SELECT IF (RUCA_CAT=1). 
EXECUTE. 

DATASET ACTIVATE  Urban. 
CROSSTABS
  /TABLES=q260i BY q262a
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q260f BY q262e
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q251e BY q262d
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q248e BY q262b
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q250e BY q262c
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=any_policy_activity BY q262g
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.


DATASET CLOSE  Urban. 

*suburban

DATASET ACTIVATE  Module3.
DATASET COPY  Suburban. 
DATASET ACTIVATE  Suburban. 
FILTER OFF. 
USE ALL. 
SELECT IF (RUCA_CAT=2). 
EXECUTE. 

DATASET ACTIVATE  Suburban. 
CROSSTABS
  /TABLES=q260i BY q262a
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q260f BY q262e
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q251e BY q262d
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q248e BY q262b
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q250e BY q262c
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=any_policy_activity BY q262g
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.


DATASET CLOSE  Suburban. 

*rural

DATASET ACTIVATE  Module3.
DATASET COPY  Rural. 
DATASET ACTIVATE  Rural. 
FILTER OFF. 
USE ALL. 
SELECT IF (RUCA_CAT=3). 
EXECUTE. 

DATASET ACTIVATE  Rural. 
CROSSTABS
  /TABLES=q260i BY q262a
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q260f BY q262e
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q251e BY q262d
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q248e BY q262b
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=q250e BY q262c
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.

CROSSTABS
  /TABLES=any_policy_activity BY q262g
  /FORMAT=AVALUE TABLES
  /STATISTICS=PHI CORR 
  /CELLS=COUNT
  /COUNT ROUND CELL.


DATASET CLOSE  Rural. 

*Correlation with any policy adoption in jurisdiction

*all 

DATASET ACTIVATE  Module3.
CORRELATIONS 
  /VARIABLES=localsum q261
  /VARIABLES=statesum q261 
  /VARIABLES=federalsum q261
  /VARIABLES=planPolicyDevSum q261
  /VARIABLES=genPolicyAdvSum q261
  /PRINT=TWOTAIL NOSIG 
  /MISSING=PAIRWISE.

*urban

DATASET COPY  Urban. 
DATASET ACTIVATE  Urban. 
FILTER OFF. 
USE ALL. 
SELECT IF (RUCA_CAT=1). 
EXECUTE. 

DATASET ACTIVATE  Urban. 
CORRELATIONS 
  /VARIABLES=localsum q261
  /VARIABLES=statesum q261 
  /VARIABLES=federalsum q261
  /VARIABLES=planPolicyDevSum q261
  /VARIABLES=genPolicyAdvSum q261
  /PRINT=TWOTAIL NOSIG 
  /MISSING=PAIRWISE.
DATASET CLOSE  Urban. 

*suburban

DATASET ACTIVATE  Module3.
DATASET COPY  Suburban. 
DATASET ACTIVATE  Suburban. 
FILTER OFF. 
USE ALL. 
SELECT IF (RUCA_CAT=2). 
EXECUTE. 

DATASET ACTIVATE  Suburban. 
CORRELATIONS 
  /VARIABLES=localsum q261
  /VARIABLES=statesum q261 
  /VARIABLES=federalsum q261
  /VARIABLES=planPolicyDevSum q261
  /VARIABLES=genPolicyAdvSum q261
  /PRINT=TWOTAIL NOSIG 
  /MISSING=PAIRWISE.
DATASET CLOSE  Suburban. 

*rural

DATASET ACTIVATE  Module3.
DATASET COPY  Rural. 
DATASET ACTIVATE  Rural. 
FILTER OFF. 
USE ALL. 
SELECT IF (RUCA_CAT=3). 
EXECUTE. 

DATASET ACTIVATE  Rural. 
CORRELATIONS 
  /VARIABLES=localsum q261
  /VARIABLES=statesum q261 
  /VARIABLES=federalsum q261
  /VARIABLES=planPolicyDevSum q261
  /VARIABLES=genPolicyAdvSum q261
  /PRINT=TWOTAIL NOSIG 
  /MISSING=PAIRWISE.
DATASET CLOSE  Rural. 

