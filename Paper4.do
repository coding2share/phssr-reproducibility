


*************** PAPER 4/5 *******************

**DATA SOURCES**

*NACCHO data obtained from: http://nacchoprofilestudy.org/data-requests/, "2013 Profile Study"

**CODE INFORMATION**

*Written by: *
*Github Link: https://github.com/coding2share/phssr-reproducibility/blob/master/Paper4.do*

********************************************

***CREATE DATASET***

*import 2013 NACCHO Data
use "Profile2013_id_publicdata_ALL.dta",clear

*survey set with module 2
svyset _n [pweight=c0moduleweight2], strata(c0popcat7) vce(linearized) singleunit(missing)
keep if c0module==2


**INPUT VARIABLES**

*Outcome Variable

gen healthcare = 0 if m14q401c==0&m14q304c==0
replace healthcare=1 if m14q401c==1|m14q304c==1
label define yesno 0 "No" 1 "Yes",replace
label values healthcare yesno




*population
egen population=cut(c0population),at(0 50000 500000 100000000) 
label define pop 0 "<50000" 50000 "50000-499999" 500000 "500000+"
label values population pop
svy: tab population


* Jurisdiction type

gen jurisdiction = 1 if c0jurisdiction=="county"
replace jurisdiction=2 if c0jurisdiction=="city-county"
replace jurisdiction=3 if c0jurisdiction=="city"
replace jurisdiction=3 if c0jurisdiction=="multi-city"
replace jurisdiction=2 if c0jurisdiction=="multi-county"
label define jurisdiction 1 "County" 2 "City-county/multicounty" 3 "City/multi-city"
label values jurisdiction jurisdiction

* Centralised governance
gen governance = 0 if c0govcat==2|c0govcat==3
replace governance = 1 if c0govcat==1
label var governance "Governance category"
label define governance 0 "Non-centralized" 1 "Centralized"


* FTEs per 10,000 people
gen FTE=c5q37/c0population*10000 


*Per capita expenditure 
gen PerCapitaExp = c3q15/c0population
gen PerCapitaExplog=log(PerCapitaExp)


*full time director 
ren c4q302 FullTimeDirector
replace FullTimeDirector = 0 if FullTimeDirect==2
label values FullTimeDirector yesno



* paper4$tenure <- LHD_2013$c4q24
gen tenure=(date("2013-04-01","YMD")-c4q24)/365-.28

* With local board of health
ren c2q301 LocalBoard

* Completed community health assessment in the past three years
gen HealthAssess=0 if c7q147<.
replace HealthAssess=1 if c7q147==1
label values HealthAssess yesno


* Geographic location
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
replace region = 0 if c0state=="ND"
replace region = 0 if c0state=="SD"
replace region = 0 if c0state=="NE"
replace region = 0 if c0state=="KS"
replace region = 0 if c0state=="MN"
replace region = 0 if c0state=="IA"
replace region = 0 if c0state=="MO"
replace region = 0 if c0state=="WI"
replace region = 0 if c0state=="IL"
replace region = 0 if c0state=="IN"
replace region = 0 if c0state=="MI"
replace region = 0 if c0state=="OH"
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

label define region 1 "Northeast" 0 "Midwest" 3 "West" 4 "South"
label values region region


* Disparity total socre

gen disparity = 0 //if m18q146b<.
foreach v of varlist m18q146a m18q146b m18q146c m18q146d m18q146e m18q146f m18q146g m18q146h m18q146j {
replace disparity=disparity+1 if `v'==1&`v'<.
}


cls
********************************************

**TABLE 1: LHD CHARACTERISTICS**

*Unweighted 
foreach var of varlist population jurisdiction governance LocalBoard HealthAssess region FullTimeDirector {
tab  `var' healthcare , chi2
}

*Weighted
foreach var of varlist population jurisdiction governance LocalBoard HealthAssess region FullTimeDirector {
svy: tab  `var' healthcare , row  ci
}


*Unweighted
foreach var of varlist FTE PerCapitaExp tenure disparity {

mean `var',over(healthcare)
		lincom [`var']Yes-[`var']No
}


*Weighted
foreach var of varlist FTE PerCapitaExp tenure disparity {

		svy:mean `var',over(healthcare)
		lincom [`var']Yes-[`var']No
}
		
********************************************
cls
**TABLE 2: LOGISTIC REGRESSION**

svy: logit healthcare i.population i.jurisdiction i.governance FTE PerCapitaExplog i.FullTimeDirector tenure i.LocalBoard i.HealthAssess i.region disparity,or 


*Model Fit: % Correctly Predicted       
predict prob1
replace prob1=0 if prob1<=.5
replace prob1=1 if prob1>.5&prob1<.

tab healthcare prob1 //77.0% correctly predicted


