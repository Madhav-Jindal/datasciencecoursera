pollutantmean <- function(directory,pollutant,id=1:332) {
  if(pollutant=='sulfate') {
      x=2  
    }
  if(pollutant=='nitrate') {
      x=3  
  }
  
    vLength = rep(1,length(id))
    sums=rep(1,length(id))
  
    for ( k in 1:length(id)) {
        if(id[k]<10){
          filenum<-paste("00",id[k],sep="")
        }
        else if( (id[k]>=10) & (id[k]<100)){
          filenum<-paste("0",id[k],sep="")
        }
        else {
          filenum<-paste(id[k],sep="")
        }
      filename<-paste(directory,filenum,".csv",sep="")
      my_data<-read.csv(filename)
      cdata<-my_data[,x]
      cldata<-na.omit(cdata)
      vLength[k] = length(cldata)
      sums[k] = sum(cldata)
    }
  storeLength = sum(vLength)
  totalsum = sum(sums)
  meanPollutant = totalsum/storeLength
  return(meanPollutant)
  
}