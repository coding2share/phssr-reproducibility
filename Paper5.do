


*************** PAPER 5/5 *******************

**DATA SOURCES**

*NACCHO data obtained from: http://nacchoprofilestudy.org/data-requests/, "2013 Profile Study"

**CODE INFORMATION**

*Github Link: https://github.com/coding2share/phssr-reproducibility/blob/master/Paper5.R*

********************************************

***CREATE DATASET***

*import 2013 NACCHO Data
use "Profile2013_id_publicdata_ALL.dta",clear

*survey set with module 2
svyset _n [pweight=c0coreweight_s], strata(c0popcat7) vce(linearized) singleunit(missing)


**INPUT VARIABLES**


*population 

gen population = 5 if c0population<.
replace population =4 if c0population <500000
replace population =3 if c0population<100000
replace population=2 if c0population<50000
replace population=1 if c0population<25000
label define population 1 "<25000" 2 "25000-49999" 3 "50000-99999" 4 "100000-499999" 5 "500000+"
label values population population

* governance
ren c0govcat governance_type

* budget cut
gen budget =1 if c10q301==1	
replace budget = 0 if c10q301==2|c10q301==3

* BOH with authority related variable
ren c2q301 BOH_0
ren c2q6a BOH_1
ren c2q7a BOH_2
ren c2q8a BOH_3
ren c2q9a BOH_4
ren c2q10a BOH_5
ren c2q11a BOH_6
ren c2q14a BOH_7
ren c2q15a BOH_8

foreach var of varlist BOH_1-BOH_8 {
replace `var'=0 if BOH_0<.&`var'>=. //This is a difference from your student's coding -- this is how NACCHO did it in the paper, although it clearly seems like the wrong thing to do to me!
}

gen BOH_9 = 0 //	if c6q75a<.
foreach var of varlist c6q75a c6q76a c6q77a c6q78a c6q79a {   
replace BOH_9 =1 if `var'==1
}


label values BOH_9 check

* total expenditures
egen total_exp=cut(c3q15),at(0 500000 1000000 5000000 10000000 1000000000000)
label define total_exp 0 "<500000" 500000 "500000-999999" 1000000 "1000000-4999999" 5000000 "5000000-9999999" 10000000 "10000000+"
label values total_exp total_exp
* expenditures per capita
gen per_capita_exp=c3q15/c0population
egen per_capita_exp_cat=cut(per_capita),at(0 20  35 45 55 10000)
label define per_capita_exp_cat 0 "<20" 20 "20-34.99" 35 "35-44.99" 45 "45-54.99" 55 "55+"
label values per_capita_exp_cat per_capita_exp_cat


* mean% revenues 
gen localrev=c3q17p/c3q16*100
gen Medicaidrev=c3q17r/c3q16*100
gen Federalrev=c3q17qe/c3q16

cls

**TABLE 3 DESCRIPTIVE STATISTICS**

foreach v of varlist population gov BOH_* total_exp per_capita_exp_cat {
display "`v'"
svy: tab `v' budget ,col 
}


foreach v in localrev Medicaidrev Federalrev { 
svy:mean `v',over(budget)
}

*********************************************
cls
**TABLE 4 LOGISTIC REGRESSION: MODELS**

*Run regression

svy: logit budget i.population i.governance_type i.BOH_* ,or  //Model1

svy: logit budget i.population i.governance_type i.BOH_* i.total_exp i.per_capita_exp_cat  localrev Medicaidrev Federalrev,or //Model2


*Model Fit: % Correctly Predicted       

predict prob1
replace prob1=0 if prob1<=.5
replace prob1=1 if prob1>.5&prob1<.

tab budget prob1 //*71% correctly predicted 

