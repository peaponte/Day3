#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('raw_data.csv')
####################################

## start writing your R code from here

## end your R code and logic 

####################################
##### write output file ############
write.csv(df, file = 'barchart.csv')
####################################

NPSfunction <- function(df)
{
  #Promoters are numbers of 9 or 10
  Promoters <- sum(df$Likelihood_Recommend_H > 8)
  Promoters
  
  #Detractors are numbers of 6 or less
  Detractors <- sum(df$Likelihood_Recommend_H < 7)
  Detractors
  
  #Add a line that will give me the passive numbers find all the 7 and 8s
  
  Passive <- sum(df$Likelihood_Recommend_H == 7:8)
  Passive
  
  #Find percent promotors
  
}

NPSfunction(df)
#Create vectors for Detractors, Promoters, Passive

Type <- c('Detractors', 'Promoters', 'Passive')
Count <- c(2169, 13570, 1806)

#Create Dataframe with vectors
NPS.data <- data.frame(Type, Count)
NPS.data


#Integrate dataframe into myPlot0 for easier plotting

myPlot0 <- ggplot(NPS.data)

myPlot0 <- myPlot0 + aes(x= Type) + aes(y= Count)

myPlot0 <- myPlot0 + geom_col()

#Use paste to create a vector with the string form of the data
title <- paste("Overall NPS Value:", NPSfunction(df))

#Chosing color and title of graph
myPlot0 <- myPlot0 + geom_col( fill="purple", col="black") + ggtitle(title)
myPlot0

#Create vector with proper columns

avg.LTR <- tapply(df$Likelihood_Recommend_H, df$Condition_Hotel_H, mean)

#Transform string to numeric
Cond_H <- names(avg.LTR)

Cond_H <- as.integer(Cond_H)

#Create dataframe with recently created vectors
dfNM<- data.frame(Cond_H,avg.LTR)


myPlotnm<- ggplot(dfNM)
myPlotnm

#Creating proper y and x axis with plot
myPlotnm <- myPlotnm + aes(y= avg.LTR) + aes(x= Cond_H)

#Choosing color and title
myPlotnm <- myPlotnm + geom_col( fill="blue", col="black") + ggtitle("LTR" )
myPlotnm



