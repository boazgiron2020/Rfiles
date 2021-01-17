bd = "X:/fracas/Systems"
re <-list.files(bd)
#re = is.numeric(as.numeric(re))
re = as.numeric(re[!is.na(as.numeric(re)) | is.numeric(re)])
re = re[( re > 999 ) & (9999 > re)]

paths<-c()
for (i in 1:length(re)){
  #Create Path
  paths <-c(paths , paste0(bd,"/",as.character(re[i]),"/Production") )  
}

exdir = "c:/Temp"

ParamDataBase = c()
for (i in 1:length(paths) ){ 
  
#for (i in 1:20 ){
  zipfiles <-list.files(paths[i])
  #zipfiles <-list.files(paths[2])
  
  i 
  
  if( length(zipfiles) > 0  ) {  
    zipfiles = zipfiles[grepl(".Zip",zipfiles) | grepl(".zip",zipfiles)]
    
    if( length(zipfiles) > 0  ) {
      for (j in 1:length(zipfiles) ){
        ezip <- paste0( paths[i],"/",zipfiles[j] )
        ezip
        #ezip <- paste0( paths[2],"/",zipfiles[1] )
        #out <-unzip(ezip, files = "Tests/*", list = T, overwrite = TRUE, junkpaths = FALSE, exdir = "c:/Temp", unzip = "internal", setTimes = FALSE)
        #efiles = out$Name[grepl("Tests/",out$Name)]
        #exdir = paste0("c:/Temp/",re[i],"/",zipfiles[j])
       
        
        unzip(ezip, files = "Diagnostics.mpba", list = F, overwrite = TRUE, junkpaths = FALSE, exdir, unzip = "internal", setTimes = FALSE)
        #unzip(ezip, files = efiles, list = F, overwrite = TRUE, junkpaths = FALSE, exdir, unzip = "internal", setTimes = FALSE)
        #system ("C:/Projects/MPBA_MAIN/MPBATestResultViewer/bin/Debug/MPBATestResultViewer.exe C:/Temp/1002/Logs", intern = F,wait = F)
        runstring <- "C:/Users/boaz.BREATHID/Desktop/LatestUtils_28Dec2014/MPBABinViewer.exe C:/Temp/Diagnostics.mpba EXPORT" 
        #runstring <- paste("C:/Projects/MPBA_MAIN/MPBATestResultViewer/bin/Debug/MPBATestResultViewer.exe",exdir)
        #system ("C:/Projects/MPBA_MAIN/MPBATestResultViewer/bin/Debug/MPBATestResultViewer.exe C:\\Temp\\1006\\Logs",wait = F)  
        #system ("C:/Projects/MPBA_MAIN/MPBATestResultViewer/bin/Debug/MPBATestResultViewer.exe C:\\algrithm\\Kufist\\Data",wait = F)
        if (file.exists("C:/Temp/Diagnostics.mpba")){
          system(runstring,wait  = T)
          Sys.sleep(1)
          filedata <-read.table("C:/Temp/Diagnostics.txt",sep=";")
          Sys.sleep(1)
          if (file.exists("C:/Temp/Diagnostics.mpba")) file.remove("C:/Temp/Diagnostics.mpba")
          #filedatab <-filedata 
          filedata =  filedata[2:dim(filedata)[1],]
          filedata$V4 <- as.numeric(as.character(filedata$V4))
          filedata$V1 <-as.POSIXct(filedata[,1],format="%d/%m/%Y  %H:%M:%S")
          filedata$V5 <- NULL
          colnames(filedata) = c("Time","TestWarmup","ParamType","ParamValue")
          filedata <- data.frame(filedata)
          filedata$Device <- re[i]
          filedata$fileName <- ezip
          if ( is.null( dim(ParamDataBase) ) ){
            ParamDataBase = filedata
          }
          else{
            ParamDataBase = rbind( ParamDataBase,filedata)
          }
          #View(filedata)
          
        }
               
      }
    }
  }
}



dim(ParamDataBase)
write.csv(file="C:/Temp/ParamDataBase.csv", x=ParamDataBase)

unique(ParamDataBase$Device)
se <-grepl("CalculateRatioC12",ParamDataBase$ParamType)
View(ParamDataBase[se,])
hist(ParamDataBase[se,]$ParamValue,100)

mean(ParamDataBase[se,]$ParamValue)
