corr<-function(directory,threshold=0){
  ndata<-rep(1,332)
  cdata<-rep(1,332)
  j<-1
  for (k in 1:332){
    if(k<10){
      filenum<-paste("00",k,sep="")
    }
    else if( (k>=10) & (k<100)){
      filenum<-paste("0",k,sep="")
    }
    else {
      filenum<-paste(k,sep="")
    }
    filename<-paste(directory,filenum,".csv",sep="")
    my_data<-read.csv(filename)
    cldata<-na.omit(my_data)
    if(nrow(cldata)>threshold)
    { 
      ndata[j]<-cor(cldata$nitrate,cldata$sulfate)
      j<-j+1
    }
    else{
      ndata[j]<-c(NA)
      j<-j+1
    }
    
  }
  
  cleandata<-na.omit(ndata)
  cleandata
}