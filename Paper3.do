

*************** PAPER 3/5 *******************

**DATA SOURCES**

*NACCHO data obtained from: http://nacchoprofilestudy.org/data-requests/, "2013 Profile Study"

**CODE INFORMATION**

*Github Link: https://github.com/coding2share/phssr-reproducibility/blob/master/Paper3.do*

********************************************

***CREATE DATASET***


*import 2013 NACCHO Data

use "Profile2013_id_publicdata_ALL.dta",clear

*survey set with module 1
svyset _n [pweight=c0moduleweight1], strata(c0popcat7) vce(linearized) singleunit(missing)
keep if c0module==1

**INPUT VARIABLES**


*population
egen population=cut(c0population),at(0 50000 500000 100000000) 
label define pop 0 "<50000" 50000 "50000-499999" 500000 "500000+"
label values population pop
svy: tab population

*geographic region - based on Census region classification
*West: WA, OR, HI, CA, AK, AZ, CO, ID, NM, MT, UT, NV, WY
*Midwest: ND, SD, NE, KS, MN, IA, MO, WI, IL, IN, MI, OH
*Northeast: NY, PA, NJ, ME, VT, NH, MA, CT, RI
*South: OK, TX, AR, LA, MS, AL, TN, KY, GA, FL, WV, VA, NC, SC, MD, DC, DE

gen region=4
replace region = 1 if c0state=="NY"
replace region = 1 if c0state=="PA"
replace region = 1 if c0state=="NJ"
replace region = 1 if c0state=="ME"
replace region = 1 if c0state=="VT"
replace region = 1 if c0state=="NH"
replace region = 1 if c0state=="MA"
replace region = 1 if c0state=="CT"
replace region = 1 if c0state=="MA"
replace region = 2 if c0state=="ND"
replace region = 2 if c0state=="SD"
replace region = 2 if c0state=="NE"
replace region = 2 if c0state=="KS"
replace region = 2 if c0state=="MN"
replace region = 2 if c0state=="IA"
replace region = 2 if c0state=="MO"
replace region = 2 if c0state=="WI"
replace region = 2 if c0state=="IL"
replace region = 2 if c0state=="IN"
replace region = 2 if c0state=="MI"
replace region = 2 if c0state=="OH"
replace region = 3 if c0state=="WA"
replace region = 3 if c0state=="OR"
replace region = 3 if c0state=="HI"
replace region = 3 if c0state=="CA"
replace region = 3 if c0state=="AK"
replace region = 3 if c0state=="AZ"
replace region = 3 if c0state=="CO"
replace region = 3 if c0state=="ID"
replace region = 3 if c0state=="NM"
replace region = 3 if c0state=="MT"
replace region = 3 if c0state=="UT"
replace region = 3 if c0state=="NV"
replace region = 3 if c0state=="WY"

label define region 1 "Northeast" 2 "Midwest" 3 "West" 4 "South"
label values region region
* Jurisdiction type 
gen jurisdiction = 3
replace jurisdiction=1 if c0jurisdiction=="city"
replace jurisdiction=2 if c0jurisdiction=="county"
label define jurisdiction 1 "city" 2 "county" 3 "other"
label values jurisdiction jurisdiction

* Governance 

ren c0govcat governance


* Local board of health 
ren c2q301 local_board


* FTE per 100,000 population //This one works fine if you just have it not show missings
gen FTE_pop=c5q37/c0population*100000

gen FTE=1 if FTE_pop <= 27.92 //Q1
replace FTE=2 if FTE_pop<= 45.95 & FTE_pop>= 27.93 //Q2
replace FTE=3 if FTE_pop<= 73.49 & FTE_pop >= 45.96 //Q3
replace FTE=4 if FTE_pop > 73.49 // Q4
replace FTE=.a if FTE_pop==.|FTE==.
label define FTE 1 "Quartile 1" 2 "Quartile 2" 3 "Quartile 3" 4 "Quartile 4" .a "NA's",replace
label values FTE FTE

** Performance improvement efforts (< 5 years) //Shouldn't have NAs
* Community health assessment 

gen health_assmt=0 if c7q147<.
replace health_assmt=1 if c7q147<3
label define yesno 0 "No" 1 "Yes",replace
label values health_assmt yesno

* Community health improvement plan (<5 years) //Shouldn't have NAs
gen health_impplan =0 if c7q149<.
replace health_impplan=1 if c7q149<3
label values health_impplan yesno

* PHAB accrediation status corret 
gen PHAB=. if m2q401<.
replace PHAB=3 if m2q401==5
replace PHAB=2 if m2q401==6
replace PHAB=1 if m2q401==2|m2q401==7|m2q401==4|m2q401==3
label define PHAB 3 "Undecided" 2 "Decided not to apply" 1 "Engaged/intend to engage",replace
label values PHAB PHAB

* Use of core competencies 
ren m6q204b core_comp
label values core_comp  yesno
replace core_comp=core_comp+1 //reverse code
replace core_comp=0 if core_comp==2
label variable core_comp "have used core comp"


* Use of commmunity guide 
gen guide=1 if c11q301 ==2|c11q301 ==3
replace guide=0 if c11q301==1|c11q301 ==4
label define guide 1 "Consistently/some areas" 0 "No/do not know"
label values guide guide	

**Collaboration
* Any Partnerships for land use  
gen landpartner=0 if m13q408<.
replace landpartner=1 if m13q408>1&m13q408<6
label values landpartner yesno

*Cross-jurisdictional sharing 
ren m8q219 cjsharing


**Obesity/chronic disease policy/advocacy activities
*Community level urban design and land use policies  
ren c12q402a PApolicies
replace PApolicies=0 if PApolicies ==. 
label values PApolicies yesno
label variable PApolicies .

*active transportation options 
ren c12q402b transportation
replace transportation=0 if transportation==.
label values transportation yesno


*expanding access to recreational facilities  
ren c12q402e recaccess
replace recaccess=0 if recaccess==.
label values recaccess yesno

cls

**TABLE 1: STUDY SAMPLE CHARACTERISTICS**

*unweighted %
foreach var of varlist population jurisdiction governance local_board FTE health_assmt health_impplan PHAB core_comp guide cjsharing landpartner PApolicies transportation recaccess {
tab `var'
}

foreach var of varlist population jurisdiction governance local_board FTE health_assmt health_impplan PHAB core_comp guide cjsharing landpartner PApolicies transportation recaccess {
svy: tab `var'
}


***Table 2 Bivariates

foreach x of varlist PApolicies transportation recaccess {
foreach y of varlist population region jurisdiction governance local_board FTE health_assmt health_impplan PHAB core_comp guide cjsharing landpartner {
svy: tab `y' `x' ,row
}
}

**TABLE 3 MULTIVARIATE LOGISTIC REGRESSION**

*Model 1: Community level urban design and land use - weighted
svy: logit PApolicies i.population i.region i.jurisdiction i.governance i.local_board i.FTE i.health_assmt i.health_impplan i.PHAB i.core_comp i.guide i.cjsharing i.landpartner,or

*Model Fit: % Correctly Predicted       
predict prob1
replace prob1=0 if prob1<=.5
replace prob1=1 if prob1>.5&prob1<.


tab PApolicies prob1 //*86.9% correctly predicted

*unweighted
logit PApolicies i.population i.region i.jurisdiction i.governance i.local_board i.FTE i.health_assmt i.health_impplan i.PHAB i.core_comp i.guide i.cjsharing i.landpartner,or

*Model 2: Active transportation options -weighted
svy: logit transportation i.population i.region i.jurisdiction i.governance i.local_board i.FTE i.health_assmt i.health_impplan i.PHAB i.core_comp i.guide i.cjsharing i.landpartner,or


*Model Fit: % Correctly Predicted       
predict prob2
replace prob2=0 if prob2<=.5
replace prob2=1 if prob2>.5&prob2<.

tab transportation prob2 //*86.9% correctly predicted 

*unweighted
logit transportation i.population i.region i.jurisdiction i.governance i.local_board i.FTE i.health_assmt i.health_impplan i.PHAB i.core_comp i.guide i.cjsharing i.landpartner,or


*Model 3: Expanding access to recreation facilities  -weighted
svy:logit recaccess i.population i.region i.jurisdiction i.governance i.local_board i.FTE i.health_assmt i.health_impplan i.PHAB i.core_comp i.guide i.cjsharing i.landpartner,or


*Model Fit: % Correctly Predicted       
predict prob3

replace prob3 =0 if prob3<=.5
replace prob3=1 if prob3>.5&prob3<.
tab recaccess prob3 //*86.9% correctly predicted 

*unweighted
logit recaccess i.population i.region i.jurisdiction i.governance i.local_board i.FTE i.health_assmt i.health_impplan i.PHAB i.core_comp i.guide i.cjsharing i.landpartner,or

