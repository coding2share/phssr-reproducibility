* Encoding: UTF-8.
*********** PAPER 2/5*********** 

**DATA SOURCES**

*NACCHO data obtained from: http://nacchoprofilestudy.org/data-requests/, "2013 Profile Study*

**CODE INFORMATION**

*Written by: Sarah Wondmeneh, Yiqiang Zhao, Jenine Harris*
*Github Link: https://github.com/coding2share/phssr-reproducibility/blob/master/Paper2.sps*

*******************************************************

**CREATE DATASET**

*open 2013 NACCHO Data by adding file location between single quotes

GET 
  FILE='file name'. 
DATASET NAME Paper2 WINDOW=FRONT.

*select module 1 only (n=490)
 
DATASET ACTIVATE DataSet6. 
DATASET COPY  Paper2Module1. 
DATASET ACTIVATE  Paper2Module1. 
FILTER OFF. 
USE ALL. 
SELECT IF (c0module=1). 
EXECUTE. 

**INPUT VARIABLES**

*weight: c0moduleweight1

*POPULATION: c0population

*GOVERNANCE: c0govcat

RECODE c0govcat (1=1) (2=3) (3=2) INTO gov. 
VARIABLE LABELS  gov 'governance'.
VALUE LABELS 
gov
1 'state'
2 'shared'
3 'local'.
EXECUTE.

*AGENCY-WISE STRATEGIC PLAN: c7q217

RECODE c7q217 (1=1) (2=1) (3=3) (4=2) (5=3) 
    (SYSMIS=3) INTO stplan. 
VARIABLE LABELS  stplan 'strategic plan'. 
VALUE LABELS
stplan
1 'Yes'
2 'NextYear'
3 'No'.
EXECUTE.

*CHA: c7q147

RECODE c7q147 (1=1) (2=1) (3=3) (4=2) (5=3) 
    (SYSMIS=3) INTO CHA. 
VARIABLE LABELS  CHA 'CHA'. 
VALUE LABELS
CHA
1 'Yes'
2 'Next Year'
3 'No'. 
EXECUTE.

*CHIP: c7q149

RECODE c7q149 (1=1) (2=1) (3=3) (4=2) (5=3) 
    (SYSMIS=3) INTO CHIP. 
VARIABLE LABELS CHIP 'CHIP'. 
VALUE LABELS
CHIP
1 'Yes'
2 'Next Year'
3 'No'. 
EXECUTE.

*TOP EXECUTIVE HAD MD DEGREE: c4q34a

RECODE c4q34a (0=2) (1=1) 
    (SYSMIS=2) INTO MD. 
VARIABLE LABELS MD 'Top executive had MD degree'. 
VALUE LABELS
MD
1 'Yes'
2 'No'.
EXECUTE.

*LOCAL BOARD OF HEALTH: c2q301

RECODE c2q301 (0=0) (1=1) INTO LBH. 
VARIABLE LABELS LBH 'Local Board of Health'.
VALUE LABELS 
LBH
0 'No'
1 'Yes'.
EXECUTE.

*LHD WORKED WITH OTHER ORGANIZATIONS FOR CHA: m13q405

RECODE m13q405 (1=3) (2=1) (3=1) (4=1) (5=2) (6=3) 
    INTO CHAcollab. 
VARIABLE LABELS CHAcollab 'LHD worked with other organization for CHA'. 
VALUE LABELS
CHAcollab
1 'Network'
2 'Collab'
3 'No'.
EXECUTE.

*PER CAPITA EXPENDITURES QUARTILES: c3q15/c0population

COMPUTE percapexp=c3q15/c0population. 
EXECUTE.

RECODE percapexp (SYSMIS=1) (Lowest thru 22.8=2) (22.80 thru 
    37.88=3) (37.89 thru 65.02=4) (65.02 thru Highest=5) INTO 
    expenditure. 
VARIABLE LABELS  expenditure 'Per capita expenditures quartiles'. 
VALUE LABELS
expenditure
1 'NR'
2 '<22'
3 '22-37'
4 '37-65'
5 '>65'.
EXECUTE.

*LHD LEVEL OF ENGAGEMENT IN ACCREDITATION: m2q401

RECODE m2q401 (1=1) (2=1) (3=1) (4=1) (5=0) (6=0) (7=1)
    (SYSMIS=0) INTO engagement. 
VARIABLE LABELS engagement 'LHD level of engagement in accreditation'. 
VALUE LABELS
engagement
1 'Yes'
0 'No'. 
EXECUTE.

*******************************************************************************

***TABLE 1: DESCRIPTIVE STATISTICS without weights***

FREQUENCIES VARIABLES=m2q401 
 /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=gov
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=CHA
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=CHIP
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=stplan
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=MD
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=LBH
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=CHAcollab
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=expenditure
  /ORDER=ANALYSIS.

***TABLE 1 weighted percentages***
WEIGHT BY c0moduleweight1.

FREQUENCIES VARIABLES=m2q401 
 /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=gov
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=CHA
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=CHIP
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=stplan
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=MD
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=LBH
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=CHAcollab
  /ORDER=ANALYSIS.
FREQUENCIES VARIABLES=expenditure
  /ORDER=ANALYSIS.

*******************************************************************************

**TABLE 3 MULTIVARIATE LOGISTIC REGRESSION**
**make sure weight is still on**

LOGISTIC REGRESSION VARIABLES engagement 
  /METHOD=ENTER c0population gov stplan CHA CHIP MD LBH CHAcollab expenditure 
  /CONTRAST (gov)=Indicator 
  /CONTRAST (stplan)=Indicator 
  /CONTRAST (CHA)=Indicator 
  /CONTRAST (CHIP)=Indicator 
  /CONTRAST (MD)=Indicator 
  /CONTRAST (LBH)=Indicator 
  /CONTRAST (CHAcollab)=Indicator 
  /CONTRAST (expenditure)=Indicator 
  /CLASSPLOT 
  /PRINT=GOODFIT CI(95) 
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).
