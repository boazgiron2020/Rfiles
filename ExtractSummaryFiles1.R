#da  = read.csv("W:/Mor/ResultTable2.csv",header = TRUE)
library(stringr)
library(mosaic)
library(reshape2)

#CONSTANT   #============================
#pattern<- "(\\d+\\.\\d+)"
#patternD<- "(\\d+)" 
#FUNCTIONS    ===========================

ArrangeAndDOB <- function(x){
  
  d = t(melt(x,id = c("Point")))
  dname = d[2,]
  d = as.numeric(d[3,])
  d = data.frame(matrix(d,1,length(d)))
  dname  = paste0("M",rep(1:3,length(dname)/3),".",dname)
  colnames(d)  = dname
  d$Point
  d
}

dobf = function(input){
  
  #input = sda[1]
  input = as.data.frame(input)
  xl = input[,10] - input[1,10]
  y1 = input[c(1,3),2]
  x1 = xl[c(1,3)]
  df2 = data.frame(x = x1,y = y1)
  model = lm(y ~ x , data = df2 )
  rBaseline = predict(model,x = xl[2])[2]
  DOBout  = -round(1e3 * as.numeric((input[2,2] -  rBaseline ) / rBaseline ),3)
  DOBout
}
#Main   =================================

dirpath = "W:/Mor/Tests"
testpath <- dir(dirpath,full.names = TRUE)
testpath = paste0(testpath,"/summary.txt")

#main
allfilesData = c()
for ( ff in testpath){
  print(ff)
  testNumber = as.numeric(str_extract_all(ff,"(\\d+)")[[1]])
  da1 = read.delim(ff)
  da1 = da1[,-1]
  da1[,10] <- apply(da1,1, function(x){as.numeric(str_extract_all(as.character(x[10]),pattern<- "(\\d+\\.\\d+)")[[1]])})
  da1 = da1[-(1:5),]
  da1$Point <- as.factor(rep(1:(dim(da1)[1]/3),each  = 3))
  sda = split(da1,da1$Point)
  

  if(length(sda)== 22 ){
    
    dff = sapply(sda,ArrangeAndDOB)
    dfnames = rownames(dff)
    dff = as.matrix(unlist(dff))
    rownames(dff) = NULL
    dff = data.frame(matrix(dff,ncol  = 30 ,byrow = T))
    colnames(dff) = dfnames
    dff$DOB  = sapply(sda,dobf)
    dff$Point = factor(as.numeric(rownames(dff)))
    rownames(dff) = NULL
    dff$Test = rep(testNumber,length(dff$Point))
    #if (is.null(dim(allfilesData))){
    #  allfilesData = dff
    #}
    #else{
      allfilesData  = rbind(allfilesData,dff)
    #}
  }
}


#str(allfilesData)
#View(allfilesData)

write.csv(allfilesData,"W:/Mor/ResultTable6.csv") 


