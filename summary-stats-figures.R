############### PAPER 6 ###################

##DATA SOURCES##

#NACCHO data obtained from: http://nacchoprofilestudy.org/data-requests/, "2018 Profile Study"

##CODE INFORMATION##

#Written by: Jenine Harris#
#Github Link: https://github.com/coding2share/phssr-reproducibility/blob/master/summary-stats-figures.R#

############################################

#commands for FIGURE 1

#Paper 5 descriptive statistics
#Table 3 LHDs with budget cuts
Origpaper5 <- c(32.9,	20.7,	16.7,	21.7,	8.7,	13,	69.4,	17.6,	70.5,	53.7,	
            53.9,	55.8,	55.9,	17.3,	26.4,	61.6,	60,	56.5,	12.4,	19.1,	
            37.8,	15.3,	15.3,	16.4,	20.3,	17.7,	10,	35.7,	27,	16.4,	
            40.2,	44.1,	19.6,	15.6,	16.3,	4.4,	20.5,	73.6,	6,	71.8,	
            44,	53.6,	53.5,	49,	12.1,	26.2,	61.6,	55.7,	47.7,	27.5,	16.8,	
            35.2,	9.8,	10.8,	24.8,	23.3,	12.4,	8.6,	30.1,	33.7,	12.9,	38.3)
Reppaper5 <- c(29.6,	20.8,	16.5,	23.5,	9.5,	13,	69.1,	17.9,	70.2,	52.7,	52.9,	
           55.1,	55.3,	16.7,	25.7,	60.9,	59.1,	55.8,	11.3,	17.8,	37.7,	16.3,	
           16.9,	16.3,	20.8,	17.9,	10,	35.1,	26.7,	16.7,	40.2,	40.6,	20.1,	
           15.8,	18.1,	5.4,	20.4,	73.5,	6.1,	71.6,	43.8,	53,	53.8,	48.6,	
           11.8,	25.7,	61.3,	55.1,	47.1,	25.6,	16.2,	35.4,	10.6,	12.1,	24.8,	
           23.6,	12.3,	8.7,	30.6,	33.3,	13.6,	39.3)
difpaper5<- (Reppaper5-Origpaper5)/Origpaper5
paper5mean<-mean(difpaper5)
paper5lci<-paper5mean - 1.96*sd(difpaper5)/sqrt(length(Origpaper5))
paper5uci<-paper5mean + 1.96*sd(difpaper5)/sqrt(length(Origpaper5))

#paper5 inferential statistics
#Table 4 Model 1
dat2<-read.csv(file.choose())  #OPEN ONCE FOR ALL INFERENTIAL
paper5T4M1 <-subset(dat2, !(is.na(dat2$paper5OR)))
paper5T4M1 <-subset(paper5T4M1, paper5T4M1$paper5Ref!="ref")
myvars <- c('paper5IV','paper5OR','paper5REP')
paper5T4M1<-paper5T4M1[myvars]
paper5T4M1<-reshape(paper5T4M1,timevar='paper5REP',idvar="paper5IV",direction="wide")
paper5T4M1$difpaper5T4M1<- (paper5T4M1$paper5OR.Reproduced-paper5T4M1$paper5OR.Original)/paper5T4M1$paper5OR.Original
paper5mean1<-mean(paper5T4M1$difpaper5T4M1)
paper5lci1<-paper5mean1 - 1.96*sd(paper5T4M1$difpaper5T4M1)/sqrt(length(paper5T4M1$paper5OR.Original))
paper5uci1<-paper5mean1 + 1.96*sd(paper5T4M1$difpaper5T4M1)/sqrt(length(paper5T4M1$paper5OR.Original))

#Table 4 Model 2
paper5T4M2 <-subset(dat2, !(is.na(dat2$paper5OR2)))
paper5T4M2 <-subset(paper5T4M2, paper5T4M2$paper5Ref!="ref")
myvars <- c('paper5IV','paper5OR2','paper5REP2')
paper5T4M2<-paper5T4M2[myvars]
paper5T4M2<-reshape(paper5T4M2,timevar='paper5REP2',idvar="paper5IV",direction="wide")
paper5T4M2$difpaper5T4M2<- (paper5T4M2$paper5OR2.Reproduced-paper5T4M2$paper5OR2.Original)/paper5T4M2$paper5OR2.Original
paper5mean2<-mean(paper5T4M2$difpaper5T4M2)
paper5lci2<-paper5mean2 - 1.96*sd(paper5T4M2$difpaper5T4M2)/sqrt(length(paper5T4M2$paper5OR2.Original))
paper5uci2<-paper5mean2 + 1.96*sd(paper5T4M2$difpaper5T4M2)/sqrt(length(paper5T4M2$paper5OR2.Original))

#Paper 4 descriptive statistics
#Table 1
Origpaper4 <- c(55,64,25,112,21,11,13,131,5.95,53.34,19,64,6.87,109,32,106,36,
              60,25,32,27,4.49,159,118,32,228,47,34,80,229,6.14,46.77,56,138,8.05,
              203,101,172,135,91,49,125,44,2.75)
Reppaper4 <- c(55,64,25,112,21,11,13,131,5.95,53.34,19,64,6.87,109,32,106,36,
             60,25,32,27,4.49,159,118,32,228,47,34,81,228,6.14,46.77,56,138,8.05,
             203,101,172,135,91,49,125,44,2.75)
difpaper4<- (Reppaper4-Origpaper4)/Origpaper4
paper4mean<-mean(difpaper4)
paper4lci<-paper4mean - 1.96*sd(difpaper4)/sqrt(length(Origpaper4))
paper4uci<-paper4mean + 1.96*sd(difpaper4)/sqrt(length(Origpaper4))

#Paper 4 inferential statistics
#Table 2
paper4T2 <-subset(dat2, !(is.na(dat2$paper4OR)))
paper4T2 <-subset(paper4T2, paper4T2$paper4Ref!="ref")
myvars <- c('paper4IV','paper4OR','paper4REP')
paper4T2<-paper4T2[myvars]
paper4T2<-reshape(paper4T2,timevar='paper4REP',idvar="paper4IV",direction="wide")
paper4T2$difpaper42<- (paper4T2$paper4OR.Reproduced-paper4T2$paper4OR.Original)/paper4T2$paper4OR.Original
paper4mean2i<-mean(paper4T2$difpaper42)
paper4lci2i<-paper4mean2i - 1.96*sd(paper4T2$difpaper42)/sqrt(length(paper4T2$paper4OR.Original))
paper4uci2i<-paper4mean2i + 1.96*sd(paper4T2$difpaper42)/sqrt(length(paper4T2$paper4OR.Original))

#Paper 3 descriptive statistics
#Table 1
Origpaper3 <- c(48,39,13,14,73,12,20,70,10,31,69,25,25,25,25,33,67,
               47,53,14,37,50,73,27,58,42,48,52,75,25,70,30,81,19,75,25,
               61,34,5,12,74,14,20,71,9,29,71,21,24,25,29,34,66,48,52,15,
               40,45,74,26,62,38,46,54,69,31,75,25,84,16,77,23)
Reppaper3 <- c(48,39,13,12,73,14,20,70,10,31,69,25,25,25,25,31,69,45,
              55,14,37,50,73,27,58,42,48,52,66,34,71,29,81,19,76,24,
              61,34,5,14,74,12,20,71,9,29,71,21,24,25,29,33,67,47,53,
              15,40,45,74,26,62,38,46,54,69,31,75,25,84,16,78,22)
difpaper3<- (Reppaper3-Origpaper3)/Origpaper3
paper3mean<-mean(difpaper3)
paper3lci<-paper3mean - 1.96*sd(difpaper3)/sqrt(length(Origpaper3))
paper3uci<-paper3mean + 1.96*sd(difpaper3)/sqrt(length(Origpaper3))

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
paper3lcia<-paper3meana - 1.96*sd(paper3a$difpaper3a)/sqrt(length(paper3a$paper3OR1.Original))
paper3ucia<-paper3meana + 1.96*sd(paper3a$difpaper3a)/sqrt(length(paper3a$paper3OR1.Original))
#Without weights
paper3a$difpaper3aw<- (paper3a$paper3OR1.ReproducedWithoutWeights-paper3a$paper3OR1.Original)/paper3a$paper3OR1.Original
paper3meanaw<-mean(paper3a$difpaper3aw)
paper3lciaw<-paper3meanaw - 1.96*sd(paper3a$difpaper3aw)/sqrt(length(paper3a$paper3OR1.Original))
paper3uciaw<-paper3meanaw + 1.96*sd(paper3a$difpaper3aw)/sqrt(length(paper3a$paper3OR1.Original))

#Table 3 Model b
paper3b <-subset(dat2, !(is.na(dat2$paper3OR2)))
paper3b <-subset(paper3b, paper3b$paper3Ref!="ref")
myvars <- c('paper3IV','paper3OR2','paper3REP2')
paper3b<-paper3b[myvars]
paper3b<-reshape(paper3b,timevar='paper3REP2',idvar="paper3IV",direction="wide")
paper3b$difpaper3b<- (paper3b$paper3OR2.Reproduced-paper3b$paper3OR2.Original)/paper3b$paper3OR2.Original
paper3meanb<-mean(paper3b$difpaper3b)
paper3lcib<-paper3meanb - 1.96*sd(paper3b$difpaper3b)/sqrt(length(paper3b$paper3OR2.Original))
paper3ucib<-paper3meanb + 1.96*sd(paper3b$difpaper3b)/sqrt(length(paper3b$paper3OR2.Original))
#Without weights
paper3b$difpaper3bw<- (paper3b$paper3OR2.ReproducedWithoutWeights-paper3b$paper3OR2.Original)/paper3b$paper3OR2.Original
paper3meanbw<-mean(paper3b$difpaper3bw)
paper3lcibw<-paper3meanbw - 1.96*sd(paper3b$difpaper3bw)/sqrt(length(paper3b$paper3OR2.Original))
paper3ucibw<-paper3meanbw + 1.96*sd(paper3b$difpaper3bw)/sqrt(length(paper3b$paper3OR2.Original))

#Table 3 Model c
paper3c <-subset(dat2, !(is.na(dat2$paper3OR3)))
paper3c <-subset(paper3c, paper3c$paper3Ref!="ref")
myvars <- c('paper3IV','paper3OR3','paper3REP3')
paper3c<-paper3c[myvars]
paper3c<-reshape(paper3c,timevar='paper3REP3',idvar="paper3IV",direction="wide")
paper3c$difpaper3c<- (paper3c$paper3OR3.Reproduced-paper3c$paper3OR3.Original)/paper3c$paper3OR3.Original
paper3meanc<-mean(paper3c$difpaper3c)
paper3lcic<-paper3meanc - 1.96*sd(paper3c$difpaper3c)/sqrt(length(paper3c$paper3OR3.Original))
paper3ucic<-paper3meanc + 1.96*sd(paper3c$difpaper3c)/sqrt(length(paper3c$paper3OR3.Original))
#Without weights
paper3c$difpaper3cw<- (paper3c$paper3OR3.ReproducedWithoutWeights-paper3c$paper3OR3.Original)/paper3c$paper3OR3.Original
paper3meancw<-mean(paper3c$difpaper3cw)
paper3lcicw<-paper3meancw - 1.96*sd(paper3c$difpaper3cw)/sqrt(length(paper3c$paper3OR3.Original))
paper3ucicw<-paper3meancw + 1.96*sd(paper3c$difpaper3cw)/sqrt(length(paper3c$paper3OR3.Original))

#Descriptive statistics for Paper 2 
#Table 1
Origpaper2 <- c(20,14,128,164,62,60,96,344,50,329,57,104,262,104,124,221,109,160,
               69,421,152,334,208,213,56,113,96,95,95,91)
Reppaper2 <- c(20,14,128,164,62,60,96,344,50,329,57,104,262,104,124,221,109,160,
              69,421,152,334,208,213,56,113,95,96,95,91)
difpaper2<- (Reppaper2-Origpaper2)/Origpaper2
paper2mean<-mean(difpaper2)
paper2lci<-paper2mean - 1.96*sd(difpaper2)/sqrt(length(Origpaper2))
paper2uci<-paper2mean + 1.96*sd(difpaper2)/sqrt(length(Origpaper2))

#Inferential statistics for Paper 2 
#Table 3
paper2 <-subset(dat2, !(is.na(dat2$paper2OR)))
paper2 <-subset(paper2, paper2$paper2REF!="ref")
myvars <- c('paper2IV','paper2OR','paper2REP')
paper2<-paper2[myvars]
paper2<-reshape(paper2,timevar='paper2REP',idvar="paper2IV",direction="wide")
paper2$difpaper2T3<- (paper2$paper2OR.Reproduced-paper2$paper2OR.Original)/paper2$paper2OR.Original
paper2mean3<-mean(paper2$difpaper2T3)
paper2lci3<-paper2mean3 - 1.96*sd(paper2$difpaper2T3)/sqrt(length(paper2$paper2OR.Original))
paper2uci3<-paper2mean3 + 1.96*sd(paper2$difpaper2T3)/sqrt(length(paper2$paper2OR.Original))


#Paper 1 descriptive statistics
#Table 1
Origpaper1 <- c(39.8,19.7,40.5,78.3,60.6,47.8,77.8,73.9,13.8,78.6,
                7.7,37.2,47.1,33.5,1.8,46.2,36,16,20.8,33.6,33.2,12.4,
                137780,394765,8.9,55.8,6.6,7.9)
Reppaper1 <- c(38.9,20.8,40.3,77.4,63,56.2,76.2,74,12.9,79.8,7.3,
               36.3,45.5,32.2,5.1,41.4,38.8,14.6,19.5,32.8,33.6,14.1,123047,389437,8.8,67.9,
               6.4,6.0)
difpaper1<- (Reppaper1-Origpaper1)/Origpaper1
paper1mean<-mean(difpaper1)
paper1lci<-paper1mean - 1.96*sd(difpaper1)/sqrt(length(Origpaper1))
paper1uci<-paper1mean + 1.96*sd(difpaper1)/sqrt(length(Origpaper1))

#Table 2
Origpaper12 <- c(4.1,8.9,87.0,100,93.8,89.1,79.1,58.3,18.6,73.5,7.8,
                 62.1,51.6,72.3,0,29.9,41.0,29.1,53.8,40,6.2,0,244204,218140,
                 46.7,235.5,6,9.2,41.3,21.6,37.1,74.6,57.1,43.8,76,75.1,12.5,80.2,7.3,
                 33.8,44.9,28.6,2.8,48.1,34.9,14.2,17.1,32.3,35.6,15.1,114707,397208,
                 6.9,26,6.4,5.7)
Reppaper12 <- c(4.1,8.9,87.0,94.6,96,92.7,79.1,58.3,18.6,73.5,7.8,
                62.1,51.6,72.3,0,29.7,41.5,28.8,53.8,40,6.2,0,244204,218140,
                46.7,235.5,6,9.2,41.3,21.6,37.1,76,60.4,52.8,76,75.1,12.5,80.2,7.3,
                33.8,44.9,28.6,5.5,42.3,38.7,13.6,17.1,32.3,35.6,15.1,114707,397208,
                5.9,26,6.4,5.7)
difpaper12<- (Reppaper12-Origpaper12)/Origpaper12
difpaper12[difpaper12=='NaN']<-0
paper1mean2<-mean(difpaper12)
paper1lci2<-paper1mean2 - 1.96*sd(difpaper12)/sqrt(length(Origpaper12))
paper1uci2<-paper1mean2 + 1.96*sd(difpaper12)/sqrt(length(Origpaper12))

#paper1 inferential statistics
#Table 4
paper1T4 <-subset(dat2, !(is.na(dat2$paper1OR)))
paper1T4 <-subset(paper1T4, paper1T4$paper1Ref!="ref")
myvars <- c('paper1IV','paper1OR','paper1REP')
paper1T4<-paper1T4[myvars]
paper1T4<-reshape(paper1T4,timevar='paper1REP',idvar="paper1IV",direction="wide")
paper1T4$difpaper13<- (paper1T4$paper1OR.Reproduced-paper1T4$paper1OR.Original)/paper1T4$paper1OR.Original
paper1mean3<-mean(paper1T4$difpaper13)
paper1lci3<-paper1mean3 - 1.96*sd(paper1T4$difpaper13)/sqrt(length(paper1T4$paper1OR.Original))
paper1uci3<-paper1mean3 + 1.96*sd(paper1T4$difpaper13)/sqrt(length(paper1T4$paper1OR.Original))

#Paper 6 descriptive statistics
#Table 1
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
               41.9,	18.6,	2.3,	48.5,	23.7,	0.2,	67.7,	52.3,	6.9,	41.3,
               22.2,	0.9,	67.7,	36.1,	35.5,	29.3,	9,	9.8,	9,	7.5,	3)
difpaper6<- (Reppaper6-Origpaper6)/Origpaper6
paper6mean<-mean(difpaper6)
paper6lci<-paper6mean - 1.96*sd(difpaper6)/sqrt(length(Origpaper6))
paper6uci<-paper6mean + 1.96*sd(difpaper6)/sqrt(length(Origpaper6))


#GRAPH DIFFERENCES
#make data frame
labels <- c("AUTHOR Paper 6 Table 1", "Paper 5 Table 3","Paper 4 Table 1","Paper 3 Table 1","Paper 2 Table 1",
            "Paper 1 Table 1", "Paper 1 Table 2",
            "Paper 5 Table 4 Model 1","Paper 5 Table 4 Model 2","Paper 4 Table 2","Paper 3 Table 3 Model 1 (weighted)",
            "Paper 3 Table 3 Model 1 (no weights)",
           "Paper 3 Table 3 Model 2 (weighted)","Paper 3 Table 3 Model 2 (no weights)",
           "Paper 3 Table 3 Model 3 (weighted)","Paper 3 Table 3 Model 3 (no weights)","Paper 2 Table 3",
           "Paper 1 Table 4")
means <- c(paper6mean, paper5mean,paper4mean,paper3mean,paper2mean,paper1mean,paper1mean2,
           paper5mean1,paper5mean2,paper4mean2i,paper3meana,paper3meanaw,paper3meanb,paper3meanbw,paper3meanc,
           paper3meancw,paper2mean,paper1mean3)
lowers <- c(paper6lci,paper5lci,paper4lci,paper3lci,paper2lci,paper1lci,paper1lci2,
            paper5lci1,paper5lci2,paper4lci2i,paper3lcia,paper3lciaw,paper3lcib,paper3lcibw,paper3lcic,paper3lcicw,
           paper2lci,paper1lci3)
uppers <- c(paper6uci,paper5uci,paper4uci,paper3uci,paper2uci,paper1uci,paper1uci2,
            paper5uci1,paper5uci2,paper4uci2i,paper3ucia,paper3uciaw,paper3ucib,paper3ucibw,paper3ucic,paper3ucicw,
           paper2uci,paper1uci3)
desinf <- c('descriptive','descriptive','descriptive','descriptive','descriptive','descriptive','descriptive',
            'inferential','inferential','inferential','inferential','inferential','inferential',
            'inferential','inferential','inferential','inferential','inferential')
Tables <- data.frame(labels,means,lowers,uppers,desinf)

#visualize
library(ggplot2)
orinf<-ggplot(Tables, aes(x = reorder(labels, -means), y = means,  ymin = lowers, ymax = uppers)) + 
  geom_pointrange(aes(col=factor(Tables$desinf)), size=.75) +
  geom_hline(yintercept=0, lty=2) + scale_y_continuous(labels = scales::percent)+
  labs(x="Manuscript & table number", y="Mean percent difference from original to reproduced\nwith 95% confidence interval")+
  scale_color_manual(values=c("black","gray60"),
                     name="")+
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+coord_flip()
orinf

#statistical significance changes
sigtable <- subset(Tables, Tables$desinf!="descriptive")
sigtable$change2sig <- c(0/16,3/28,0/15,13/21,0/21,7/21,0/21,15/21,0/21,0/18,0)
sigtable$change2not <- c(2/16,2/28,4/15,0/21,0/21,0/21,1/21,0/21,0/21,2/18,0)
myvars <- c('labels','change2sig','change2not')
sigtable <- sigtable[myvars]
sigtable$labels <- reorder(sigtable$labels, -rowSums(sigtable[-1]))
sigtable$labels <- reorder(sigtable$labels, new.order=c(1,2,3,4,5,6,7,8,10,11,9))
library(reshape)
sigtable<-melt(sigtable, id=c('labels'))
sigdif <- ggplot(sigtable, aes(x=labels, y=value, fill=variable, ordered=T)) + 
  geom_bar(stat="identity") +
  scale_y_continuous(labels = scales::percent)+
  labs(x="Manuscript & table number", 
       y="Percent of odds ratios changing\nchanging significance status")+
  scale_fill_manual(values=c("gray40", "gray70"), name="",
                    label=c("Changed to significant\nwhen reproduced","Changed to non-significant\nwhen reproduced")) +
  theme(legend.position="top", plot.title = element_text(hjust = 0.5))+
    coord_flip()
sigdif


