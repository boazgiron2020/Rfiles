library("stringr", lib.loc="C:/Program Files/R/R-3.1.3/library")



  
dataS <-read.table(filepath,sep = ";",fill  = TRUE)
dataString = as.character(dataS[,"V4"])


#Extract String with the ratios nad concentration from log
ExtractDatafromLog <- function(n) {
  #n = 31344
  filepath = "c:/Temp/Log.txt"
  dataS <-read.table(filepath,sep = ";",fill  = TRUE)
  dataString = as.character(dataS[,"V4"])
  
  theString1 = "Baseline"  
  theString2 = "Ratio = "
  

  
  str1 = rep(FALSE,length(dataString))
  str1[grep(theString1,dataString )] = TRUE 
  str2 = rep(FALSE,length(dataString))
  str2[grep(theString2,dataString )] = TRUE 
  selectStringsB  = dataString[str1 & str2]
  
  theString1 = "Sample"  
  theString2 = "Ratio = "
  
  str1 = rep(FALSE,length(dataString))
  str1[grep(theString1,dataString )] = TRUE 
  str2 = rep(FALSE,length(dataString))
  str2[grep(theString2,dataString )] = TRUE 
  selectStringsS  = dataString[str1 & str2]
  str3 = rep(FALSE,length(dataString))
  str3[grep("DOB =" ,dataString )] = TRUE
  selectStringsDOB  = dataString[str3]
  
  p=0
  patternslist1 =NULL
  patternslist1[[(p=p+1)]] = "(\\d+\\.\\d+)"
  pattern1 = paste(patternslist1, collapse="|", sep="")
  reDOB = c()
  for(i in 1:length(selectStringsDOB)){
    if ( length(grep("-",selectStringsDOB[i],perl = TRUE)) == 1 ) {
      reDOB = rbind(reDOB,-as.numeric(str_extract_all(selectStringsDOB,pattern1)[[i]]))
    }
    else {
      reDOB = rbind(reDOB,as.numeric(str_extract_all(selectStringsDOB,pattern1)[[i]]))
    }
  }
  
  #selectStrings  = dataString[grep(theString1,dataString ) & grep(theString2,dataString )]
  reb = c()#as.numeric(str_extract_all(selectStrings,pattern)[[1]])
  res = c()#as.numeric(str_extract_all(selectStrings,pattern)[[1]])
  patternslist = NULL
  p=0
  #patternslist[[(p=p+1)]] = "(\\d+)"
  #patternslist[[(p=p+1)]] = "(\\d+)"
  patternslist[[(p=p+1)]] = "(\\d+\\.\\d+)"
  patternslist[[(p=p+1)]] = "(\\d+\\.\\d+)"
  patternslist[[(p=p+1)]] = "(\\d+\\.\\d+)"
  pattern = paste(patternslist, collapse="|", sep="")
  
  
  
  for(i in 1:length(selectStringsB)){
    reb = rbind(reb,as.numeric(str_extract_all(selectStringsB,pattern)[[i]]))
  }
  
  for(i in 1:length(selectStringsS)){
    res = rbind(res,as.numeric(str_extract_all(selectStringsS,pattern)[[i]]))
  }
  
  

#}



  reb = reb[reb[,1] < 2.2,]
  
  ind  = c(1,3,5)
  indexb = ind
  
  for(i in 1:(dim(reb)[1]/3 - 1)){
    ind  = ind + 5
    indexb = c(indexb,ind)
  }
  
  
  ind  = c(2,4)
  indexs = ind
  
  for(i in 1:(dim(res)[1]/2 -1)){
    ind  = ind + 5
    indexs = c(indexs,ind)
  }
  
  
  maxy = max(c(max(reb[,1]) ,max(res[,1])) ) +0.01
  miny = min(c(min(reb[,1]) ,min(res[,1])) ) -0.01
  #miny = min(res[3:length(indexs),1]) -0.001
  #maxy = max(res[3:length(indexs),1]) +0.001
  plot(indexb,reb[,1],ylim = c(miny,maxy),main  = paste0( "CONCENTRATION", n) )
  points(indexs,res[,1],pch = 19)  
  
  maxy = max(c(max(reb[,3]) ,max(res[,3])) ) +0.001
  miny = min(c(min(reb[,3]) ,min(res[,3])) ) -0.001
  #miny = min(res[3:length(indexs),3]) -0.01
  #maxy = max(res[3:length(indexs),3]) +0.01
  plot(indexb,reb[,3],ylim = c(miny,maxy),main  = paste0( "RATIO ", n )  )
  points(indexs,res[,3],pch = 19)

reDOB

}

ExtractDatafromLog(1754)

runstring <- paste("C:/Projects/MPBA_MAIN/MPBATestResultViewer/bin/Debug/MPBATestResultViewer.exe",exdir)
system ("C:/Projects/MPBA_MAIN/MPBATestResultViewer/bin/Debug/MPBATestResultViewer.exe C:\\Temp\\1006\\Logs",wait = F)  
system ("C:/Projects/MPBA_MAIN/MPBATestResultViewer/bin/Debug/MPBATestResultViewer.exe C:\\algrithm\\Kufist\\Data",wait = F)  
}
system("C:/Users/boaz.BREATHID/Desktop/Release/MPBALoggerViewer.exe  C:/Temp/Yossi/pre/Logfile.mpba")
updateR()
