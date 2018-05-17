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

dummyDF <- data.frame(state.name, stringsAsFactors = FALSE)
dummyDF$state <- tolower(dummyDF$state.name)
us <- map_data("state")

map.simple <- ggplot(dummyDF, aes(map_id = state))  
map.simple <- map.simple +  
  geom_map(map = us, fill="light blue", color="black") 

map.simple <- map.simple +
  expand_limits(x = us$long, y = us$lat)

map.simple <- map.simple +
  coord_map() + ggtitle("Map of USA")
map.simple

avg.LTR <- tapply(df$Likelihood_Recommend_H,df$STATE_R, mean)
avg.LTR

Cond_H <- names(avg.LTR)
#Cond_H <- tolower(Cond_H)
#Cond_H

#abbr2state(dfStates$Cond_H)
state<-state.name[match(Cond_H,state.abb)]
dfStates <- data.frame(Cond_H,state,avg.LTR,stringsAsFactors = FALSE )

is.na(dfStates)
cleandfState <- dfStates[!is.na(dfStates$state), ]
cleandfState$state <- tolower(cleandfState$state)

map.popColor <- ggplot(cleandfState,aes(map_id = state))
map.popColor <- map.popColor + geom_map(map = us, aes(fill=avg.LTR))
map.popColor <- map.popColor + expand_limits(x=us$long, y= us$lat)
map.popColor <- map.popColor + coord_map() + ggtitle("Average LTR per State")
map.popColor

## end your R code and logic 

####################################
##### write output file ############
# add your R code to write output file
####################################


