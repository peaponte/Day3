#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('raw_data.csv')
####################################

## start writing your R code from here

#Hotel_Condition <- df$Condition_Hotel_H
#LTR<- df$Likelihood_Recommend_H

LTR<-jitter(df$Likelihood_Recommend_H, factor = 5, amount = 2)
Hotel_Condition <- jitter(df$Condition_Hotel_H, factor = 5, amount =2)
myPlot <- ggplot(df)

myPlot <- myPlot + aes(x=Hotel_Condition,y=LTR)

myPlot <- myPlot + geom_point() 

myPlot <- myPlot + geom_smooth(method="lm") 

myPlot

# ScattorPlot (x for hotel condition, y for staff care) size and color represented by LTR
Staff_care<- jitter(df$Staff_Cared_H, factor = 5, amount =2)

myPlot <- ggplot(df)

myPlot <- myPlot + aes(x=Hotel_Condition,y=Staff_care)

myPlot <- myPlot + 
  geom_point(aes(color= LTR, size=LTR) )+
  scale_colour_gradient(low="white", high="black")


myPlot <- myPlot + geom_point() 

myPlot <- myPlot + geom_smooth(method="lm") 

myPlot


## end your R code and logic 

####################################
##### write output file ############
write.csv(df, file = 'scatterplot_C.csv')
####################################



