#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('raw_data.csv')
####################################

## start writing your R code from here

#NPS Function using only a vector
NPSfunction <- function(df)
{
  #Promoters are numbers of 9 or 10
  Promoters <- sum(df > 8)
  Promoters
  #Detractors are numbers of 6 or less
  Detractors <- sum(df<7)
  
  #Find percent promotors
  PercentPromoters <- Promoters/length(df)
  
  #Find percent detractors
  PercentDetractors <- Detractors/length(df)
  
  #NPS calculation then round number and convert to percent
  NPS <- PercentPromoters - PercentDetractors
  V <- format(round(NPS*100))
  return(V)
}



#Pass LTR Values sorted on Sate to my Funtion which calc NPS
avg.NPS <- tapply(df$Likelihood_Recommend_H,df$STATE_R,NPSfunction)
avg.NPS

State <- names(avg.NPS)
newDF <- data.frame(State,avg.NPS)

index<-match(state.abb,State)
index <- index[!is.na(index)]
indexnew <- index[index >0]
newDF[indexnew,]
cleanDF <- newDF[!is.na(newDF$State), ]

library(ggmap)

dummyDF <- data.frame(state.name, stringsAsFactors=FALSE)
dummyDF$state <- tolower(dummyDF$state.name)
us <- map_data("state") 

map.simple <- ggplot(dummyDF, aes(map_id = State))  
map.simple <- map.simple +  
  geom_map(map = us, color="black",fill=avg.NPS) +
  scale_fill_gradient(low="white", high="blue")

map.simple <- map.simple +
  expand_limits(x = us$long, y = us$lat)

map.simple <- map.simple +
  coord_map() + ggtitle("Heatmap of the USA") 
map.simple

## end your R code and logic 

####################################
##### write output file ############
# add your R code to write output file
####################################


