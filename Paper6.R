############### PAPER 6 ###################

##DATA SOURCES##

#NACCHO data obtained from: http://nacchoprofilestudy.org/data-requests/, "2018 Profile Study"

##CODE INFORMATION##

#Written by: Yiqiang Zhao#
#Github Link: https://github.com/coding2share/phssr-reproducibility/Paper6.R#

############################################

library(foreign)
naccho2008 <- read.spss(file.choose(), to.data.frame = T)

paper6 <- NULL
# module 3
paper6$module <- naccho2008$module


#Planning and policy development#
paper6$EmergencyPreAndResp <- naccho2008$q248e
paper6$LandUsePlan <- naccho2008$q252e
paper6$TabaccoPrevAndCont <- naccho2008$q247e
paper6$Influenza <- naccho2008$q249e
paper6$Obesity <- naccho2008$q250e
paper6$IndoorAir <- naccho2008$q251e

#Policy and advocacy communication Prepared issue briefs#
paper6$PrepIssueBriefsLocal[naccho2008$q255a == 1] <- 1
paper6$PrepIssueBriefsLocal[naccho2008$q255a == 0] <- 0
paper6$PrepIssueBriefsState[naccho2008$q255b == 1] <- 1
paper6$PrepIssueBriefsState[naccho2008$q255b == 0] <- 0
paper6$PrepIssueBriefsFederal[naccho2008$q255c == 1] <- 1
paper6$PrepIssueBriefsFederal[naccho2008$q255c == 0] <- 0

paper6$GavePublicTestLocal[naccho2008$q256a == 1] <- 1
paper6$GavePublicTestLocal[naccho2008$q256a == 0] <- 0
paper6$GavePublicTestState[naccho2008$q256b == 1] <- 1
paper6$GavePublicTestState[naccho2008$q256b == 0] <- 0
paper6$GavePublicTestFederal[naccho2008$q256c == 1] <- 1
paper6$GavePublicTestFederal[naccho2008$q256c == 0] <- 0

paper6$PartOnBoardOrAdvPanelLocal[naccho2008$q257a == 1] <- 1
paper6$PartOnBoardOrAdvPanelLocal[naccho2008$q257a == 0] <- 0
paper6$PartOnBoardOrAdvPanelState[naccho2008$q257b == 1] <- 1
paper6$PartOnBoardOrAdvPanelState[naccho2008$q257b == 0] <- 0
paper6$PartOnBoardOrAdvPanelFederal[naccho2008$q257c == 1] <- 1
paper6$PartOnBoardOrAdvPanelFederal[naccho2008$q257c == 0] <- 0

paper6$ComWithLegislatorsLocal[naccho2008$q258a == 1] <- 1
paper6$ComWithLegislatorsLocal[naccho2008$q258a == 0] <- 0
paper6$ComWithLegislatorsState[naccho2008$q258b == 1] <- 1
paper6$ComWithLegislatorsState[naccho2008$q258b == 0] <- 0
paper6$ComWithLegislatorsFederal[naccho2008$q258c == 1] <- 1
paper6$ComWithLegislatorsFederal[naccho2008$q258c == 0] <- 0

paper6$ProvidedTechAssistLocal[naccho2008$q259a == 1] <- 1
paper6$ProvidedTechAssistLocal[naccho2008$q259a == 0] <- 0
paper6$ProvidedTechAssistState[naccho2008$q259b == 1] <- 1
paper6$ProvidedTechAssistState[naccho2008$q259b == 0] <- 0
paper6$ProvidedTechAssistFederal[naccho2008$q259c == 1] <- 1
paper6$ProvidedTechAssistFederal[naccho2008$q259c == 0] <- 0

#General policy and advocacy areas#
paper6$AffordHouse <- naccho2008$q260a
paper6$CriminalJusticeSystem <- naccho2008$q260b
paper6$Education <- naccho2008$q260c
paper6$Environment <- naccho2008$q260d
paper6$FundingHealthCare <- naccho2008$q260e
paper6$LandUse <- naccho2008$q260f
paper6$Labor <- naccho2008$q260g
paper6$OccupHealthAndSafety <- naccho2008$q260h
paper6$Tobacco <- naccho2008$q260i

#RUCA
paper6$Area <- naccho2008$RUCA_CAT

paper6 <- as.data.frame(paper6)

paper6 <- paper6[paper6$module == "module 3" & is.na(paper6$module) == F, ]

#Table 1
table(paper6$Area) #same: urban 225, suburban 91; rural 137

library(descr)
# part (a)
CrossTable(paper6$EmergencyPreAndResp, paper6$Area, prop.r = F, prop.chisq = F) # Emergency preparedness and response 
CrossTable(paper6$LandUsePlan, paper6$Area, prop.r = F, prop.chisq = F) # Land use planing
CrossTable(paper6$TabaccoPrevAndCont, paper6$Area, prop.r = F, prop.chisq = F) # Tobacco Prevention and control
CrossTable(paper6$Influenza, paper6$Area, prop.r = F, prop.chisq = F) # Influenza
CrossTable(paper6$Obesity, paper6$Area, prop.r = F, prop.chisq = F) #Obesity
CrossTable(paper6$IndoorAir, paper6$Area, prop.r = F, prop.chisq = F) #Indoor air quality

# part (b)
CrossTable(paper6$PrepIssueBriefsLocal, paper6$Area, prop.r = F, prop.chisq = F) # Prepared issue briefs local
CrossTable(paper6$PrepIssueBriefsState, paper6$Area, prop.r = F, prop.chisq = F) # Prepared issue briefs state
CrossTable(paper6$PrepIssueBriefsFederal, paper6$Area, prop.r = F, prop.chisq = F) # Prepared issue briefs federal

CrossTable(paper6$GavePublicTestLocal, paper6$Area, prop.r = F, prop.chisq = F) # Gave public testimony local
CrossTable(paper6$GavePublicTestState, paper6$Area, prop.r = F, prop.chisq = F) # Gave public testimony state
CrossTable(paper6$GavePublicTestFederal, paper6$Area, prop.r = F, prop.chisq = F) # Gave public testimony federal

CrossTable(paper6$PartOnBoardOrAdvPanelLocal, paper6$Area, prop.r = F, prop.chisq = F) # Participated on board or advisory panel local
CrossTable(paper6$PartOnBoardOrAdvPanelState, paper6$Area, prop.r = F, prop.chisq = F) # Participated on board or advisory panel state
CrossTable(paper6$PartOnBoardOrAdvPanelFederal, paper6$Area, prop.r = F, prop.chisq = F) # Participated on board or advisory panel federal

CrossTable(paper6$ComWithLegislatorsLocal, paper6$Area, prop.r = F, prop.chisq = F) # Communicated with legislators local
CrossTable(paper6$ComWithLegislatorsState, paper6$Area, prop.r = F, prop.chisq = F) # Communicated with legislators state
CrossTable(paper6$ComWithLegislatorsFederal, paper6$Area, prop.r = F, prop.chisq = F) # Communicated with legislators federal

CrossTable(paper6$ProvidedTechAssistLocal, paper6$Area, prop.r = F, prop.chisq = F) # Provided techinical assistance local
CrossTable(paper6$ProvidedTechAssistState, paper6$Area, prop.r = F, prop.chisq = F) # Provided techinical assistance state
CrossTable(paper6$ProvidedTechAssistFederal, paper6$Area, prop.r = F, prop.chisq = F) # Provided techinical assistance federal

# part (c)
CrossTable(paper6$Tobacco, paper6$Area, prop.r = F, prop.chisq = F) # Tobacco 
CrossTable(paper6$Environment, paper6$Area, prop.r = F, prop.chisq = F) # Environment
CrossTable(paper6$FundingHealthCare, paper6$Area, prop.r = F, prop.chisq = F) # funding for health care access
CrossTable(paper6$Education, paper6$Area, prop.r = F, prop.chisq = F) # Education
CrossTable(paper6$LandUse, paper6$Area, prop.r = F, prop.chisq = F) # Land Use
CrossTable(paper6$OccupHealthAndSafety, paper6$Area, prop.r = F, prop.chisq = F) # Occupational health and safety
CrossTable(paper6$CriminalJusticeSystem, paper6$Area, prop.r = F, prop.chisq = F) # Criminal justice system
CrossTable(paper6$AffordHouse, paper6$Area, prop.r = F, prop.chisq = F) #Affordable housing
CrossTable(paper6$Labor, paper6$Area, prop.r = F, prop.chisq = F) # Labor 
