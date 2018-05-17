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
# add your R code to write output file
####################################

df$STATE_R

#Group by state


NonV_NPSFunction <- function(NPS)
  
{
 
  #Promoters are numbers of 9 or 10
  Promoters <- sum(NPS > 8)
  Promoters
  
  #Detractors are numbers of 6 or less
  Detractors <- sum(NPS < 7)
  Detractors
  
  #Find percent promotors
  PercentPromoters <- Promoters/length(NPS)
  
  #Find percent detractors
  PercentDetractors <- Detractors/length(NPS)
  
  #NPS calculation then round number and convert to percent
  NPS2 <- PercentPromoters - PercentDetractors
 V2 <- format(round(NPS2*100))
 V2 
  
}

#Create vector with proper columns(?)
avg.NPS <- tapply(df$Likelihood_Recommend_H,df$STATE_R, NonV_NPSFunction)
avg.NPS  

#Transform string to numeric
#myPlotAvg <- names(NonV_NPSFunction)

#myPlotAvg <- as.integer(myPlotAvg)




#State <- names(avg.NPS)

#myPlotAvg <- as.integer(myPlotAvg)

#Transform string to numeric
State <- names(avg.NPS)

avg.NPS <- avg.NPS[avg.NPS > 0]
avg.NPS


State <- State[State > 0]
State

#Create dataframe with recently created vectors
dfNM<- data.frame(State,avg.NPS)

#WTF AM I DOING
#na.omit(dfNM, cols=(dfNM), invert=FALSE, na.action(dfNM))
#na.action(dfNM, cols=avg.NPS(dfNM), invert=FALSE)
dfNM
#######################

myPlotAvg <- ggplot(dfNM)


#Creating proper y and x axis with plot
myPlotAvg <- myPlotAvg + aes(x=State) + aes(y= avg.NPS)


#Choosing color and title
myPlotAvg <- myPlotAvg + geom_col( fill="blue", col="black") + ggtitle("Mean NPS by State" )
myPlotAvg

#Creating proper y and x axis with plot
myPlotNpsSt <- ggplot(dfNM)
myPlotNpsSt <- myPlotNpsSt + aes(x=State) + aes(y= avg.NPS)

#Different Barchart where the x-axis is sorted by NPS of state
myPlotNpsSt <- myPlotNpsSt + aes(x=avg.NPS) + aes(y= State)


#Choosing color and title for second Barchart
myPlotNpsSt <- myPlotNpsSt + geom_col( fill="pink", col="black") + ggtitle("Average NPS by state" )
myPlotNpsSt

#Creating proper y and x axis with plot
myColorNpsSt <- ggplot(dfNM)
myColorNpsSt <- myColorNpsSt + aes(x=State) + aes(y= avg.NPS)

#Last bar chart with color 
myColorNpsSt <- myColorNpsSt + aes(x=State) + aes(y= avg.NPS)

#Choosing color and title for second Barchart
myColorNpsSt <- myColorNpsSt + geom_col( fill=avg.NPS, col="black") + ggtitle("Colored Average NPS by state" )
myColorNpsSt