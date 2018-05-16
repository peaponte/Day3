#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('raw_data.csv')
####################################

## start writing your R code from here
#Clean Column L2R from Hotel Data
is.na(df)
dfClean <- df[!is.na(df$Likelihood_Recommend_H), ]
#dfClean
install.packages('ggplot2')
library(ggplot2)

#Generate Boxplot for LTR
LTRBoxPlot <- ggplot(dfClean)
LTRBoxPlot <- LTRBoxPlot + aes(x=dfClean$Likelihood_Recommend_H, y=dfClean$Likelihood_Recommend_H)
LTRBoxPlot <- LTRBoxPlot + geom_boxplot(fill="purple", col="black")
LTRBoxPlot

#index9 <- which(df$Likelihood_Recommend_H ==9)
#df[index9,]

#index10 <- which(df$Likelihood_Recommend_H ==10)
#df[index10,]

L2R9 <- df[df$Likelihood_Recommend_H==9,]
L2R10 <- df[df$Likelihood_Recommend_H==10,]
L2R9$Likelihood_Recommend_H

NPSBoxPlot <- ggplot(dfClean)
NPSBoxPlot <- NPSBoxPlot + aes(x=L2R9$Likelihood_Recommend,y=L2R10$Likelihood_Recommend_H)
NPSBoxPlot <- NPSBoxPlot + geom_boxplot()
NPSBoxPlot

## end your R code and logic 

####################################
##### write output file ############
write.csv(df, file = 'data.csv')
####################################

