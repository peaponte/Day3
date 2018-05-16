#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('raw_data.csv')
####################################

## start writing your R code from here
library(ggmap)

dummyDF <- data.frame(state.name, stringsAsFactors=FALSE)
dummyDF$state <- tolower(dummyDF$state.name)
us <- map_data("state") 

map.simple <- ggplot(dummyDF, aes(map_id = state))  
map.simple <- map.simple +  
  geom_map(map = us, fill="light blue", color="black") 

map.simple <- map.simple +
  expand_limits(x = us$long, y = us$lat)

map.simple <- map.simple +
  coord_map() + ggtitle("Heatmap of the USA")
map.simple

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
#NPSfunction(dfClean)

avg.NPS <- tapply(df$Likelihood_Recommend_H,df$STATE_R,NPSfunction)
avg.NPS
## end your R code and logic 

####################################
##### write output file ############
# add your R code to write output file
####################################


