complete<-function(directory,id=1:332){
  ndata<-rep(1,length(id))
  cdata<-rep(1,length(id))
  for (k in 1:length(id)){
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
    cldata<-na.omit(my_data)
    ndata[k]<-id[k]
    cdata[k]<-nrow(cldata)
    }
  
  fdata<-data.frame(id=ndata,nobs=cdata)
  fdata
}