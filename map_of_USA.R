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

## end your R code and logic 

####################################
##### write output file ############
# add your R code to write output file
####################################

