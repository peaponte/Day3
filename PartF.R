#####################################
##### Do NOT delete this block #####
setwd(Sys.getenv('PROJECT_HOME'))
####################################

####################################
## write code to read input csv into data frame
df <- read.csv('raw_data.csv')
####################################

## start writing your R code from here
avg.LTR <- tapply(df$Likelihood_Recommend_H,df$STATE_R, mean)
avg.LTR

Cond_H <- names(avg.LTR)

state<-state.name[match(Cond_H,state.abb)]
dfStates <- data.frame(Cond_H,state,avg.LTR,stringsAsFactors = FALSE )

is.na(dfStates)
cleandfState <- dfStates[!is.na(dfStates$state), ]
cleandfState$state <- tolower(cleandfState$state)

index1<- which(cleandfState$Cond_H == "FL" )
index2<-which(cleandfState$Cond_H == "TN")
index3<-which(cleandfState$Cond_H == "VT" )

v_index<-c(index1, index2, index3)

newdf<-cleandfState[v_index,]



FLlatlon <- geocode("orlando, fl")
TNlatlon <- geocode("nashville, tn")
VYlatlon <- geocode("burlington, vt")

newdf$lon<-c(FLlatlon$lon[1], TNlatlon$lon[1], VYlatlon$lon[1])
newdf$lat<-c(FLlatlon$lat[1], TNlatlon$lat[1], VYlatlon$lat[1])



library(ggmap)

dummyDF <- data.frame(state.name, stringsAsFactors=FALSE)
dummyDF$state <- tolower(dummyDF$state.name)
us <- map_data("state") 

map.simple <- ggplot(dummyDF, aes(map_id = state))  
map.simple <- map.simple +  geom_map(map = us, fill="White", color="black") 

map.simple <- map.simple +
  expand_limits(x = us$long, y = us$lat)

map.simple <- map.simple +
  coord_map() + ggtitle("basic map of USA")
map.simple

#map.point <- map.simple + geom_point(aes(x=FLlatlon$lon,y=FLlatlon$lat,fill = "white"))+  geom_point(aes(x=TNlatlon$lon, y=TNlatlon$lat, fill =5))+ geom_point(aes(x=VYlatlon$lon,y=VYlatlon$lat))

map.point <- map.simple + geom_point(data=newdf,aes(x=newdf$lon, y=newdf$lat,color=newdf$avg.LTR,size=2) )
                                     #++ geom_point(data=newdf,aes(x=newdf$lon[2], y=newdf$lat[2],color=newdf$avg.LTR[2]) )          
#map.point <- map.simple + geom_point(aes(x=TNlatlon$lon, y=TNlatlon$lat))
#map.point <- map.point + map.simple + geom_point(aes(x=VYlatlon$lon,y=VYlatlon$lat))
map.point

v<-c("VT","MO", "MT","ZZ")
match(v,state.abb)




## end your R code and logic 

####################################
##### write output file ############
# add your R code to write output file
####################################


