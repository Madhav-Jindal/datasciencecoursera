data<-read.csv("hw1_data.csv")
data
##calculating average for solar for given conditions 
    ozo<-data[data$Ozone>31,,drop=FALSE]
    temp<-ozo[ozo$Temp>90,,drop=FALSE]
    temp<-na.omit(temp)
    avsolar<-mean(temp$Solar.R)
    avsolar
    