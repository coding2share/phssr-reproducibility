############### PAPER 6 ###################

##DATA SOURCES##

#odds ratios data from: https://github.com/coding2share/phssr-reproducibility/blob/master/ReprodicibilityORgraphs.csv

##CODE INFORMATION##

#Written by: Jenine Harris#
#Github Link: https://github.com/coding2share/phssr-reproducibility/blob/master/summary-stats-figures.R#

############################################

#open needed libraries
library(ggplot2)
library(descr)
library(reshape)

#bring in results from inferential analyses
#wide data
dat2<-read.csv(file.choose()) 
#long data
dat3<-read.csv(file.choose()) 

#commands for FIGURE 1

#Paper 5 descriptive statistics
#Table 3 LHDs with budget cuts REVISED
Origpaper5 <- c(32.9,	20.7,	16.7,	21.7,	8.7,	13,	69.4,	17.6,	70.5,	53.7,	
            53.9,	55.8,	55.9,	17.3,	26.4,	61.6,	60,	56.5,	12.4,	19.1,	
            37.8,	15.3,	15.3,	16.4,	20.3,	17.7,	10,	35.7,	27,	16.4,	
            40.2,	44.1,	19.6,	15.6,	16.3,	4.4,	20.5,	73.6,	6,	71.8,	
            44,	53.6,	53.5,	49,	12.1,	26.2,	61.6,	55.7,	47.7,	27.5,	16.8,	
            35.2,	9.8,	10.8,	24.8,	23.3,	12.4,	8.6,	30.1,	33.7,	12.9,	38.3)
Reppaper5 <- c(33.0,20.7,16.3,21.6,8.3,13.0,69.3,17.6,70.5,53.3,53.6,55.4,
               55.5,17.2,26.2,61.2,59.5,55.4,12.5,19.2,37.7,15.3,15.4,16.3,20.4,
               17.7,9.9,35.7,26.7,17.0,40.1,44.3,19.7,15.2,16.3,4.5,20.4,73.6,
               6.0,71.7,43.8,53.2,53.2,48.7,12.0,26.1,61.2,55.4,46.5,27.7,
               16.8,35.0,9.7,10.9,24.8,23.3,12.4,8.6,31.0,33.4,13.8,38.9)
difpaper5<- (Reppaper5-Origpaper5)/Origpaper5
paper5mean<-mean(difpaper5)
paper5lci<-paper5mean - sd(difpaper5)
paper5uci<-paper5mean + sd(difpaper5)

#paper5 inferential statistics
#Table 4 Model 1
paper5T4M1 <-subset(dat2, !(is.na(dat2$paper5OR)))
paper5T4M1 <-subset(paper5T4M1, paper5T4M1$paper5Ref!="ref")
myvars <- c('paper5IV','paper5OR','paper5REP')
paper5T4M1<-paper5T4M1[myvars]
paper5T4M1<-reshape(paper5T4M1,timevar='paper5REP',idvar="paper5IV",direction="wide")
paper5T4M1$difpaper5T4M1<- (paper5T4M1$paper5OR.Reproduced-paper5T4M1$paper5OR.Original)/paper5T4M1$paper5OR.Original
paper5mean1<-mean(paper5T4M1$difpaper5T4M1)
paper5lci1<-paper5mean1 - sd(paper5T4M1$difpaper5T4M1)
paper5uci1<-paper5mean1 + sd(paper5T4M1$difpaper5T4M1)

#Table 4 Model 2
paper5T4M2 <-subset(dat2, !(is.na(dat2$paper5OR2)))
paper5T4M2 <-subset(paper5T4M2, paper5T4M2$paper5Ref!="ref")
myvars <- c('paper5IV','paper5OR2','paper5REP2')
paper5T4M2<-paper5T4M2[myvars]
paper5T4M2<-reshape(paper5T4M2,timevar='paper5REP2',idvar="paper5IV",direction="wide")
paper5T4M2$difpaper5T4M2<- (paper5T4M2$paper5OR2.Reproduced-paper5T4M2$paper5OR2.Original)/paper5T4M2$paper5OR2.Original
paper5mean2<-mean(paper5T4M2$difpaper5T4M2)
paper5lci2<-paper5mean2 - sd(paper5T4M2$difpaper5T4M2)
paper5uci2<-paper5mean2 + sd(paper5T4M2$difpaper5T4M2)

#Paper 4 descriptive statistics
#Table 1 REVISED
Origpaper4 <- c(55,64,25,112,21,11,13,131,5.95,53.54,19,64,6.87,109,32,106,36,
              60,25,32,27,4.49,159,118,32,228,47,34,80,229,6.14,46.77,56,138,8.05,
              203,101,172,135,91,49,125,44,2.75)
Reppaper4 <- c(55,64,25,112,21,11,13,131,5.95,53.54,19,64,6.87,109,32,106,36,
               60,25,32,27,4.49,159,118,32,228,47,34,80,229,6.14,46.77,56,138,8.06,
               203,101,172,135,91,49,125,44,2.75)
difpaper4<- (Reppaper4-Origpaper4)/Origpaper4
paper4mean<-mean(difpaper4)
paper4lci<-paper4mean - sd(difpaper4)
paper4uci<-paper4mean + sd(difpaper4)

#Paper 4 inferential statistics
#Table 2
paper4T2 <-subset(dat2, !(is.na(dat2$paper4OR)))
paper4T2 <-subset(paper4T2, paper4T2$paper4Ref!="ref")
myvars <- c('paper4IV','paper4OR','paper4REP')
paper4T2<-paper4T2[myvars]
paper4T2<-reshape(paper4T2,timevar='paper4REP',idvar="paper4IV",direction="wide")
paper4T2$difpaper42<- (paper4T2$paper4OR.Reproduced-paper4T2$paper4OR.Original)/paper4T2$paper4OR.Original
paper4mean2i<-mean(paper4T2$difpaper42)
paper4lci2i<-paper4mean2i - sd(paper4T2$difpaper42)
paper4uci2i<-paper4mean2i + sd(paper4T2$difpaper42)

#Paper 3 descriptive statistics
#Table 1 REVISED
Origpaper3 <- c(48,39,13,14,73,12,20,70,10,31,69,25,25,25,25,33,67,
               47,53,14,37,50,73,27,58,42,48,52,75,25,70,30,81,19,75,25,
               61,34,5,12,74,14,20,71,9,29,71,21,24,25,29,34,66,48,52,15,
               40,45,74,26,62,38,46,54,69,31,75,25,84,16,77,23)
Reppaper3 <- c(48,39,13,12,73,14,20,70,10,31,69,25,25,25,25,31,69,45,
              55,14,37,50,73,27,58,42,48,52,66,34,71,29,81,19,76,24,
              61,34,5,14,74,12,20,71,9,29,71,22,24,25,29,33,67,47,53,
              15,40,45,74,26,62,38,46,54,69,31,75,25,84,16,78,22)
difpaper3<- (Reppaper3-Origpaper3)/Origpaper3
paper3mean<-mean(difpaper3)
paper3lci<-paper3mean - sd(difpaper3)
paper3uci<-paper3mean + sd(difpaper3)

#Table 2 REVISED
Origpaper32 <- c(10.8,22.0,43.1,11.5,21.4,11.5,22.2,11.8,17.6,12.8,9.2,18.9,10.5,
                 17.3,16.0,11.8,21.3,19.0,14.5,11.2,18.8,12.0,20.1,9.6,12.0,24.4,15.1,20.0,
                 8.9,29.1,16.9,15.7,12.1,27.1,89.2,78.0,56.9,88.5,78.6,88.5,77.8,88.2,82.4,
                 87.2,90.8,81.1,89.5,82.7,84.1,88.2,78.7,81.0,85.5,88.8,81.2,88.0,79.9,
                 90.4,88.0,75.6,84.9,80.0,91.1,70.9,83.1,84.3,87.9,72.9,
                 17.2,	35.4,	56.8,	16.2,	26.2,	27.8,	30.2,	16.1,	26.1,	31.9,	
                 23.9,	25.7,	26.2,	27.5,	24.8,	19.2,	32.2,	26.6,	25.1,	20.7,	27.8,	15.7,	
                 34.2,18.2,	19.3,	34.8,	23.3,	33.1,	18,	38,	23.6,	27.2,	17.1,	44.5,	82.8,	64.6,	43.2,	
                 83.8,	73.8,	72.2,	69.8,	83.9,	83.9,	68.1,	76.1,	74.3,	73.8,	72.5,	75.2,	80.8,	
                 67.4,	73.4,	74.9,	79.3,	72.2,	84.3,	65.8,	81.8,	80.7,	65.2,	76.7,	66.9,	82,	62,	
                 76.4,	72.8,82.9,	55.5,
                 18.4,	27.2,	43,	16,	25.5,	21.9,	26.4,	19.2,	23.5,	21.1,	14.5,	25.3,	19.6,
                 18.1,	24.7,	17.3,	26.7,	21.7,	26.1,	13.2,	31.3,	13.2,	27.4,	16.4,	16.1,	29.4,	
                 21,	27.5,	15.1,	35.9,	20.1,	24.5,	18.7,	30.9,	81.7,	72.8,	57,	84,	74.5,	78.1,	
                 73.6,	80.8,	76.5,	78.9,	85.5,	74.7,	80.4,	81.9,	75.3,	82.8,	73.3,	78.3,	73.9,	
                 86.8,	68.7,	86.8,	72.7,	83.6,	83.9,	70.6,	79,	72.5,	84.9,	64.1,	79.9,	75.5,	
                 81.3,	69.2)
Reppaper32 <- c(10.5,	21.5,	40.3,	11.2,	20.8,	11.1,	21.8,	11.6,	17.1,	12.4,	8.9,	18.5,
                9.9,	16.9,	15.5,	11.6,	21,	18.9,	14.1,	10.5,	18.5,	11.9,	19.8,	9.6,	11.7,
                23.9,	14.8,	20,	8.7,	28.3,	16.7,	15.3,	11.7,	27.1,	89.6,	78.5,	59.8,	88.8,
                79.2,	88.9,	78.2,	88.4,	82.9,	87.6,	91.1,	81.6,	90.2,	83.1,	84.5,	88.4,	79,
                81.1,	85.9,	89.5,	81.6,	88.1,	80.2,	90.5,	88.4,	76.1,	85.2,	80,	91.3,	71.8,
                83.3,	84.7,	88.3,	72.9,16.7,	34.6,	53.1,	15.7,	25.5,	26.6,	30.4,	15.8,	25.3,	
                30.8,	23.2,	25.1,	24.6,	26.8,	24.1,	18.9,	31.7,	26.4,	24.4,	19.5,	27.3,	15.6,	
                33.7,	18.1,	18.8,	34.1,	22.7,	33.1,	17.7,	37,	23.3,	26.4,	16.6,	44.3,	83.3,	
                65.5,	46.9,	84.3,	74.5,	73.4,	69.6,	84.2,	74.7,	69.2,	76.9,	74.9,	75.4,	
                73.3,	75.9,	81.1,	68.3,	73.6,	75.6,	80.5,	72.7,	84.4,	66.4,	82,	81.2,	65.9,	
                77.3,	66.9,	82.3,	63.1,76.7,	73.6,	83.4,	55.7,
                17.8,	26.6,	40.2,	15.5,	24.8,	20.9,	26.7,	18.9,	22.8,	20.4,	14,	24.7,	18.4,	
                17.6,	24,	17,	26.3,	21.5,	25.4,	12.1,	26.9,	13.1,	30.8,	16.3,	15.7,	28.9,	
                20.6,	27.5,14.8,	34.9,	19.8,	23.9,	18.2,	30.8,	82.2,	73.5,	59.8,	84.5,	75.3,	
                79.1,	73.3,	81.2,	77.2,	79.6,	86,	75.4,	81.6,	82.4,	76,	83.1,	73.7,	78.5,	74.6,	
                87.9,	73.1,	86.9,	69.2,	83.7,	84.3,	71.2,	79.5,	72.5,	85.2,	65.1,	80.2,	76.1,	
                81.8,	69.2)
difpaper32<- (Reppaper32-Origpaper32)/Origpaper32
paper3mean2<-mean(difpaper32)
paper3lci2<-paper3mean2 - sd(difpaper32)
paper3uci2<-paper3mean2 + sd(difpaper32)

#paper3 inferential statistics
#Table 3 Model a
#With weights
paper3a <-subset(dat2, !(is.na(dat2$paper3OR1)))
paper3a <-subset(paper3a, paper3a$paper3Ref!="ref")
myvars <- c('paper3IV','paper3OR1','paper3REP1')
paper3a<-paper3a[myvars]
paper3a<-reshape(paper3a,timevar='paper3REP1',idvar="paper3IV",direction="wide")
paper3a$difpaper3a<- (paper3a$paper3OR1.Reproduced-paper3a$paper3OR1.Original)/paper3a$paper3OR1.Original
paper3meana<-mean(paper3a$difpaper3a)
paper3lcia<-paper3meana - sd(paper3a$difpaper3a)
paper3ucia<-paper3meana + sd(paper3a$difpaper3a)

#Table 3 Model b
paper3b <-subset(dat2, !(is.na(dat2$paper3OR2)))
paper3b <-subset(paper3b, paper3b$paper3Ref!="ref")
myvars <- c('paper3IV2','paper3OR2','paper3REP2')
paper3b<-paper3b[myvars]
paper3b<-reshape(paper3b,timevar='paper3REP2',idvar="paper3IV2",direction="wide")
paper3b$difpaper3b<- (paper3b$paper3OR2.Reproduced-paper3b$paper3OR2.Original)/paper3b$paper3OR2.Original
paper3meanb<-mean(paper3b$difpaper3b)
paper3lcib<-paper3meanb - sd(paper3b$difpaper3b)
paper3ucib<-paper3meanb + sd(paper3b$difpaper3b)

#Table 3 Model c
paper3c <-subset(dat2, !(is.na(dat2$paper3OR3)))
paper3c <-subset(paper3c, paper3c$paper3Ref!="ref")
myvars <- c('paper3IV3','paper3OR3','paper3REP3')
paper3c<-paper3c[myvars]
paper3c<-reshape(paper3c,timevar='paper3REP3',idvar="paper3IV3",direction="wide")
paper3c$difpaper3c<- (paper3c$paper3OR3.Reproduced-paper3c$paper3OR3.Original)/paper3c$paper3OR3.Original
paper3meanc<-mean(paper3c$difpaper3c)
paper3lcic<-paper3meanc - sd(paper3c$difpaper3c)
paper3ucic<-paper3meanc + sd(paper3c$difpaper3c)

#Descriptive statistics for Paper 2 
#Table 1 REVISED
Origpaper2 <- c(20,14,128,164,62,60,96,344,50,329,57,104,262,104,124,221,109,160,
               69,421,152,334,208,213,56,113,96,95,95,91)
Reppaper2 <- c(20,14,128,164,62,60,96,344,50,329,57,104,262,104,124,221,109,160,
              69,421,152,334,208,213,56,113,95,96,95,91)
difpaper2<- (Reppaper2-Origpaper2)/Origpaper2
paper2mean<-mean(difpaper2)
paper2lci<-paper2mean - sd(difpaper2)
paper2uci<-paper2mean + sd(difpaper2)

#Inferential statistics for Paper 2 
#Table 3
paper2 <-subset(dat2, !(is.na(dat2$paper2OR)))
paper2 <-subset(paper2, paper2$paper2Ref!="ref")
myvars <- c('paper2IV','paper2OR','paper2REP')
paper2<-paper2[myvars]
paper2<-reshape(paper2,timevar='paper2REP',idvar="paper2IV",direction="wide")
paper2$difpaper2T3<- (paper2$paper2OR.Reproduced-paper2$paper2OR.Original)/paper2$paper2OR.Original
paper2mean3<-mean(paper2$difpaper2T3)
paper2lci3<-paper2mean3 - sd(paper2$difpaper2T3)
paper2uci3<-paper2mean3 + sd(paper2$difpaper2T3)


#Paper 1 descriptive statistics
#Table 1 REVISED
Origpaper1 <- c(39.8,19.7,40.5,78.3,60.6,47.8,77.8,73.9,13.8,78.6,
                7.7,37.2,47.1,33.5,1.8,46.2,36,16,20.8,33.6,33.2,12.4,
                137780,394765,8.9,55.8,6.6,7.9)
Reppaper1 <- c(38.9,20.8,40.3,77.4,63.0,56.2,76.2,74.0,12.9,79.8,
               7.3,36.3,45.5,32.2,3.8,42.6,39.1,14.5,19.5,32.8,33.6,
               14.1,123047,389437,8.8,67.9,6.4,6.0)
difpaper1<- (Reppaper1-Origpaper1)/Origpaper1
paper1mean<-mean(difpaper1)
paper1lci<-paper1mean - sd(difpaper1)
paper1uci<-paper1mean + sd(difpaper1)

#Table 2 REVISED
Origpaper12 <- c(4.1,8.9,87.0,100,93.8,89.1,79.1,58.3,18.6,73.6,7.8,
                 62.1,51.6,72.3,0,29.9,41.0,29.1,53.8,40,6.2,0,244204,218140,
                 46.7,235.5,6,9.2,41.3,21.6,37.1,74.6,57.1,43.8,76,75.1,12.5,80.2,7.3,
                 33.8,44.9,28.6,2.8,48.1,34.9,14.2,17.1,32.3,35.6,15.1,114707,397208,
                 6.9,26,6.4,5.7)
Reppaper12 <- c(4.1,8.9,87.0,94.6,96.0,92.7,79.1,58.3,18.6,73.6,7.8,
                62.1,51.6,72.3,0,30.2,40.5,29.3,53.8,40,6.2,0,244204,218140,
                46.7,235.5,6,9.2,41.3,21.6,37.1,76.0,60.4,52.8,76,75.1,12.5,80.2,7.3,
                33.8,44.9,28.6,4.0,43.5,39.0,13.5,17.1,32.3,35.6,15.1,114707,397208,
                5.9,26,6.4,5.7)
difpaper12<- (Reppaper12-Origpaper12)/Origpaper12
difpaper12[difpaper12=='NaN']<-0
paper1mean2<-mean(difpaper12)
paper1lci2<-paper1mean2 - sd(difpaper12)
paper1uci2<-paper1mean2 + sd(difpaper12)

#Table 3 REVISED
Origpaper13 <- c(27,25,89,83.2,54,50.0,95,88.0,24,22.2,28,32.2,40,46.5,45,51.7,
                 64,74.4,17,19.5,32,24.6,52,40.3,32,24.8,79,60.8,20,15.4,87,
                 26.8,181,56.2,131,40.4,238,73.5,61,18.8)
Reppaper13 <- c(27,25,89,83.2,54,50.0,95,88.0,24,22.2,28,32.2,40,46.5,45,51.7,
                64,74.4,17,19.5,32,24.6,52,40.3,32,24.8,79,60.8,20,15.4,87,
                26.8,181,56.2,131,40.4,238,73.5,61,18.8)
difpaper13<- (Reppaper13-Origpaper13)/Origpaper13
difpaper13[difpaper13=='NaN']<-0
paper1mean3<-mean(difpaper13)
paper1lci3<-paper1mean3 - sd(difpaper13)
paper1uci3<-paper1mean3 + sd(difpaper13)

#paper 1 inferential statistics
#Table 4
paper1T4 <-subset(dat2, !(is.na(dat2$paper1OR)))
paper1T4 <-subset(paper1T4, paper1T4$paper1Ref!="ref")
myvars <- c('paper1IV','paper1OR','paper1REP')
paper1T4<-paper1T4[myvars]
paper1T4<-reshape(paper1T4,timevar='paper1REP',idvar="paper1IV",direction="wide")
paper1T4$difpaper14<- (paper1T4$paper1OR.Reproduced-paper1T4$paper1OR.Original)/paper1T4$paper1OR.Original
paper1mean4<-mean(paper1T4$difpaper14)
paper1lci4<-paper1mean4 - sd(paper1T4$difpaper14)
paper1uci4<-paper1mean4 + sd(paper1T4$difpaper14)

#Paper 6 descriptive statistics
#Table 1 REVISED
Origpaper6 <- c(77.3,54.9,46.3,36.3,30.4,17.2,60.1,29.7,6.2,54.9,
                27.8,4.9,62.2,37.6,5.9,76.4,58.7,15.6,55.4,37.3,6.1,
                71.0,55.4,45.0,29.0,18.3,15.2,10.0,10.4,4.3,
                83,	55.6,	52.8,	39.4,	37.5,	18.5,	72.1,	33.3,	9.7,
                61.7,	34.4,	6.7,	71.6,	47.6,	9.9,	80.7,	61.9,	21.1,
                62.9,	45.1,	9.4,	73.1,	68.9,	48.9,	30.1,	23.3,	19.6,
                11,	12.8,	3.7,	80.5,	55.8,	38.6,	35.8,	33.9,	15.2,	61.1,
                31.1,	1.1,	57.8,	25.6,	4.4,	60.2,	33.7,	3.6,	78.4,	60.2,
                14.8,	57.5,	40.2,	2.3,	71.1,	51.1,	50,	25.6,	20,	12.2,	8.9,
                8.9,	7.8,	65.4,	52.8,	40.9,	31,	12.7,	16.5,	40,	23.1,	3.8,
                41.9,	18.6,	2.3,	48.5,	23.7,	0.2,	67.7,	52.3,	6.9,	41.3,
                22.2,	0.9,	67.7,	36.1,	35.5,	29.3,	9,	9.8,	9,	7.5,	3)
Reppaper6 <- c(77.3,30.2,54.8,46.4,36.1,17.2,60.1,29.7,6.2,54.9,
               27.8,4.9,62.2,37.6,5.9,76.4,58.7,15.6,55.4,37.3,6.1,
               71.0,55.4,45.0,29.0,18.3,15.2,10.0,10.4,4.3,
               83,	37.5,	55.6,	52.8,	39.4,	18.5,	72.1,	33.3,	9.7,
               61.7,	34.4,	6.7,	71.6,	47.6,	9.9,	80.7,	61.9,	21.1,
               62.9,	45.1,	9.4,	73.1,	68.9,	48.9,	30.1,	23.3,	19.6,
               11,	12.8,	3.7,	80.5,	33.9,	55.8,	38.6,	35.8,	15.2,	61.1,
               31.1,	1.1,	57.8,	25.6,	4.4,	60.2,	33.7,	3.6,	78.4,	60.2,
               14.8,	57.5,	40.2,	2.3,	71.1,	51.1,	50,	25.6,	20,	12.2,	8.9,
               8.9,	7.8,	65.4,	12.7,	52.8,	40.9,	31.0,	16.5,	40,	23.1,	3.8,
               41.9,	18.6,	2.3,	48.5,	23.7,	0.8,	67.7,	52.3,	6.9,	41.3,
               22.2,	3.2,	67.7,	36.1,	35.5,	29.3,	9,	9.8,	9,	7.5,	3)
difpaper6<- (Reppaper6-Origpaper6)/Origpaper6
paper6mean<-mean(difpaper6)
paper6lci<-paper6mean - sd(difpaper6)
paper6uci<-paper6mean + sd(difpaper6)

#Table 2 REVISED
Origpaper62 <- c(59.0,42.4,16.5,6.7,11.1,5.1,29.6,65.3,45.7,19.6,8.5,11.1,6.0,36.2,
                 49.4,38.7,5.3,6.7,13.3,5.3,25.3,51.8,39.1,18.3,3.5,9.6,3.5,20.9)
Reppaper62 <- c(59.2,42.4,16.5,6.7,11.1,5.1,29.6,67.4,45.7,19.6,8.5,11.1,6.0,36.2,
                50.0,38.7,5.3,6.7,13.3,5.3,25.3,52.2,39.1,18.3,3.5,9.6,3.5,20.9)
difpaper62<- (Reppaper62-Origpaper62)/Origpaper62
paper6mean2<-mean(difpaper62)
paper6lci2<-paper6mean2 - sd(difpaper62)
paper6uci2<-paper6mean2 + sd(difpaper62)

#Table 3 REVISED
Origpaper63 <- c(.37,.31,.28,.21,.08,.26,.27,.21,.16,.21,.38,.36,.10,.23,.08,.18,.26,.17,.19,.23,
                 .29,.19,.55,.25,-.16,.24,.22,.30,.08,.10,.39,.25,.43,.12,.18,.32,.24,.13,.02,.19)
Reppaper63 <- c(.37,.31,.28,.21,.08,.28,.30,.24,.17,.21,.38,.36,.10,.23,.08,.19,.32,.23,.21,.23,
                .29,.19,.55,.25,-.16,.19,.25,.31,.15,.10,.39,.25,.43,.12,.18,.45,.24,.11,-.03,.19)
difpaper63<- (Reppaper63-Origpaper63)/Origpaper63
paper6mean3<-mean(difpaper63)
paper6lci3<-paper6mean3 - sd(difpaper63)
paper6uci3<-paper6mean3 + sd(difpaper63)


#GRAPH DIFFERENCES
#make data frame
labels <- c('Paper 1 Table 1','Paper 1 Table 2','Paper 1 Table 3','Paper 1 Table 4',
            'Paper 2 Table 1','Paper 2 Table 3',
            'Paper 3 Table 1','Paper 3 Table 2','Paper 3 Table 3 Model 1', 'Paper 3 Table 3 Model 2','Paper 3 Table 3 Model 3',
            'Paper 4 Table 1','Paper 4 Table 2',
            'Paper 5 Table 3','Paper 5 Table 4 Model 1','Paper 5 Table 4 Model 2',
            'Paper 6 Table 1','Paper 6 Table 2','Paper 6 Table 3')
means <- c(paper1mean,paper1mean2,paper1mean3,paper1mean4,
           paper2mean,paper2mean3,
           paper3mean,paper3mean2,paper3meana,paper3meanb,paper3meanc,
           paper4mean,paper4mean2i,
           paper5mean,paper5mean1,paper5mean2,
           paper6mean,paper6mean2,paper6mean3)
lowers <- c(paper1lci,paper1lci2,paper1lci3,paper1lci4,
            paper2lci,paper2lci3,
            paper3lci,paper3lci2,paper3lcia,paper3lcib,paper3lcic,
            paper4lci,paper4lci2i,
            paper5lci,paper5lci1,paper5lci2,
            paper6lci,paper6lci2,paper6lci3)
uppers <- c(paper1uci,paper1uci2,paper1uci3,paper1uci4,
            paper2uci,paper2uci3,
            paper3uci,paper3uci2,paper3ucia,paper3ucib,paper3ucic,
            paper4uci,paper4uci2i,
            paper5uci,paper5uci1,paper5uci2,
            paper6uci,paper6uci2,paper6uci3)
desinf <- c("descriptive\nstatistics","descriptive\nstatistics","descriptive\nstatistics","odds ratios \nand correlations",
            "descriptive\nstatistics","odds ratios \nand correlations",
            'descriptive\nstatistics','descriptive\nstatistics','odds ratios \nand correlations','odds ratios \nand correlations','odds ratios \nand correlations',
            'descriptive\nstatistics','odds ratios \nand correlations',
            'descriptive\nstatistics','odds ratios \nand correlations','odds ratios \nand correlations',
            'descriptive\nstatistics','descriptive\nstatistics','odds ratios \nand correlations')
Tables <- data.frame(labels,means,lowers,uppers,desinf)

#FIGURE 1
#visualize
par(mar=c(0,0,0,1))
orinf<-ggplot(Tables, aes(x = reorder(labels, -means), y = means,  ymin = lowers, ymax = uppers)) + 
  geom_pointrange(aes(col=factor(Tables$desinf)), size=.75) +
  geom_hline(yintercept=0, lty=2) + scale_y_continuous(labels = scales::percent)+
  labs(x="Manuscript & table number", y="Mean percent difference from original to reproduced\nwith standard deviation")+
  scale_color_manual(values=c("gray65","black"),
                     name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+coord_flip()+
  theme(plot.margin=unit(c(0,.5,.5,.5),"cm"))
orinf

#statistical significance changes
#FIGURE 3
sigtable <- Tables[c(2,3,4,6,8,9,10,11,12,13,15,16,17,18,19),]
sigtable$change2sig <- c(0/15,0/5,1/10,0/16,0/39,1/21,1/21,1/21,0/11,0/15,0/16,3/27,0/30,0/7,0/40)
sigtable$change2not <- c(0/15,0/5,1/10,2/16,0/39,0/21,0/21,0/21,0/11,0/15,1/16,1/27,0/30,0/7,10/40)
sigtable$type <- c('bivariate','bivariate','multivariate','multivariate',
                   'bivariate','multivariate','multivariate','multivariate',
                   'bivariate','multivariate','multivariate','multivariate',
                   'bivariate','bivariate','bivariate')
myvars <- c('labels','change2sig','change2not','type')
sigtable <- sigtable[myvars]
sigtable$totalsame <- 1 - (sigtable$change2sig + sigtable$change2not)

sigtable<-melt(sigtable, id=c('labels','type'))
sigdif <- ggplot(sigtable, aes(x=labels, y=value, fill=variable, ordered=T)) + 
  geom_bar(stat="identity") +
  scale_y_continuous(labels = scales::percent)+
  labs(x="Manuscript & table number", 
       y="Percent of inferential statistics that maintained\nor changed significance status when reproduced")+
  scale_fill_manual(values=c("black", "gray40","gray70"), name="",
                    label=c("Non-significant in original,\nsignificant when \nreproduced","Significant in original,\nnon-significant when\nreproduced",
                            "Stayed the same")) +
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
    coord_flip() + facet_grid(type~., scales = "free", space = "free") 
sigdif

#FIGURE 4
#CI width analysis
confInts <- subset(dat3, dat3$ref!="ref" & dat3$rep!="ReproducedWithoutWeights")
confInts$rep <- droplevels(confInts$rep)
confInts$confIntRange <- confInts$uci - confInts$lci
tabConfInts <- as.data.frame(aggregate( confIntRange~paper+rep, confInts, mean))
#visualize
CIwidth<-ggplot(tabConfInts, aes(x = reorder(paper, -confIntRange), y = confIntRange)) + 
  geom_point(aes(col=factor(tabConfInts$rep)), size=2, position=position_dodge(width=.50)) +
  geom_hline(yintercept=0, lty=2) + scale_y_continuous()+
  labs(x="Paper and table number", y="Mean confidence interval width for\noriginal and reproduced\nlogistic regression results")+
  scale_color_manual(values=c("gray65","black"),
                     name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5)) + coord_flip()
CIwidth


#Appendix B and FIGURE 2
#Paper 1 Table 4 (FIGURE 2)
paper1appB <-subset(dat2, !(is.na(dat2$paper1OR)) & paper1Ref!="ref")
orspaper1<-ggplot(paper1appB, aes(x = paper1IV, y = paper1OR,  ymin = paper1LCI, ymax = paper1UCI)) +
  geom_pointrange(aes(col=factor(paper1appB$paper1REP)), size=.75, position=position_dodge(width=.50)) +
  ylab("Odds ratio & 95% CI (log scale)") + geom_hline(aes(yintercept = 1)) +
  scale_y_log10(breaks=c(.1,1,10), labels=c("0.1","1.0","10.0")) +
  xlab("Local Health Department Characteristic") + scale_color_manual(values=c("black","gray70"),
                                                                      name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
  coord_flip()
orspaper1

#Paper 2 Table 3
paper2appB <-subset(dat2, !(is.na(dat2$paper2OR)) & paper1Ref!="ref")
orspaper2<-ggplot(paper2appB, aes(x = paper2IV, y = paper2OR,  ymin = paper2LCI, ymax = paper2UCI)) +
  geom_pointrange(aes(col=factor(paper2appB$paper2REP)), size=.75, position=position_dodge(width=.50)) +
  ylab("Odds ratio & 95% CI (log scale)") + geom_hline(aes(yintercept = 1)) +
  scale_y_log10() +
  xlab("Local Health Department Characteristic") + scale_color_manual(values=c("black","gray70"),
                                                                      labels=c("Original", "Reproduced"),
                                                                      name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
  coord_flip()
orspaper2

#Paper 3 Table 3 Model 1
paper31appB <-subset(dat2, !(is.na(dat2$paper3OR1)) & paper3Ref!="ref" & paper3REP1!="ReproducedWithoutWeights")
orspaper31<-ggplot(paper31appB, aes(x = paper3IV, width=20, y = paper3OR1,  ymin = paper3LCI1, ymax = paper3UCI1)) +
  geom_pointrange(aes(col=factor(paper31appB$paper3REP1)),size=.75, position=position_dodge(width=.50)) +
  ylab("Odds ratio & 95% CI") + geom_hline(aes(yintercept = 1)) +
  scale_y_log10() +
  xlab("Local Health Department Characteristic") + scale_color_manual(values=c("black","gray70"),
                                                                      name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
  coord_flip()
orspaper31

#Paper 3 Table 3 Model 2
paper32appB <-subset(dat2, !(is.na(dat2$paper3OR2)) & paper3Ref!="ref" & paper3REP2!="ReproducedWithoutWeights")
orspaper32<-ggplot(paper32appB, aes(x = paper3IV2, width=20, y = paper3OR2,  ymin = paper3LCI2, ymax = paper3UCI2)) +
  geom_pointrange(aes(col=factor(paper32appB$paper3REP2)),size=.75, position=position_dodge(width=.50)) +
  ylab("Odds ratio & 95% CI") + geom_hline(aes(yintercept = 1)) +
  scale_y_log10() +
  xlab("Local Health Department Characteristic") + scale_color_manual(values=c("black","gray70"),
                                                                      name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
  coord_flip()
orspaper32

#Paper 3 Table 3 Model 3
paper33appB <-subset(dat2, !(is.na(dat2$paper3OR3)) & paper3Ref!="ref" & paper3REP3!="ReproducedWithoutWeights")
orspaper33<-ggplot(paper33appB, aes(x = paper3IV3, width=20, y = paper3OR3,  ymin = paper3LCI3, ymax = paper3UCI3)) +
  geom_pointrange(aes(col=factor(paper33appB$paper3REP3)),size=.75, position=position_dodge(width=.50)) +
  ylab("Odds ratio & 95% CI") + geom_hline(aes(yintercept = 1)) +
  scale_y_log10() +
  xlab("Local Health Department Characteristic") + scale_color_manual(values=c("black","gray70"),
                                                                      name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
  coord_flip()
orspaper33

#Paper 4 Table 2
paper4appB <-subset(dat2, !(is.na(dat2$paper4OR)) & paper4Ref!="ref")
orspaper4<-ggplot(paper4appB, aes(x = paper4IV, y = paper4OR,  ymin = paper4LCI, ymax = paper4UCI)) +
  geom_pointrange(aes(col=factor(paper4appB$paper4REP)), size=.75, position=position_dodge(width=.50)) +
  ylab("Odds ratio & 95% CI") + geom_hline(aes(yintercept = 1)) +
  scale_y_log10() +
  xlab("Local Health Department Characteristic") + scale_color_manual(values=c("gray70","black"),
                                                                      name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
  coord_flip()
orspaper4

#Paper 5 Table 4 Model 1
paper5appB <-subset(dat2, !(is.na(dat2$paper5OR)) & paper5Ref!="ref")
orspaper5<-ggplot(paper5appB, aes(x = paper5IV, y = paper5OR,  ymin = paper5LCI, ymax = paper5UCI)) +
  geom_pointrange(aes(col=factor(paper5appB$paper5REP)), size=.75, position=position_dodge(width=.50)) +
  ylab("Odds ratio & 95% CI") + geom_hline(aes(yintercept = 1)) +
  scale_y_log10() +
  xlab("Local Health Department Characteristic") + scale_color_manual(values=c("black","gray70"),
                                                                      name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
  coord_flip()
orspaper5

#Paper 5 Table 4 Model 2
orspaper52<-ggplot(paper5appB, aes(x = paper5IV2, y = paper5OR2,  ymin = paper5LCI2, ymax = paper5UCI2)) +
  geom_pointrange(aes(col=factor(paper5appB$paper5REP2)), size=.75, position=position_dodge(width=.50)) +
  ylab("Odds ratio & 95% CI") + geom_hline(aes(yintercept = 1)) +
  scale_y_log10() +
  xlab("Local Health Department Characteristic") + scale_color_manual(values=c("black","gray70"),
                                                                      labels=c("Original", "Reproduced"),
                                                                      name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
  coord_flip()
orspaper52

