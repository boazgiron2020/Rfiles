library(memisc)
library(utils)

basicPath   = "C:/Temp/TryZip3"

is.zip <- function( filelist ) { grepl(".ZIP", filelist ) | grepl(".Zip", filelist ) |  grepl(".zip", filelist) }

is.L2 <- function( String ) { grepl("L2", String ) }
is.L2s <- function(string) { sapply(string,function(x) { grepl("L2",x ) } ) }

dirList = dir("X:/fracas/Systems",full.names = T)
dirList = dirList[ grepl("L2",dirList) ]

l = list()
ds = dirList[1]


#110919--------------------------------------------------

for(ds in dirList[7]){
  
  sitename = basename(ds)
  
  fs  = dir( ds , full.names = T )
  
  fif = file.info(fs)
  fsl = fs[fif$isdir]
  fs = fs[!fif$isdir]
  if( length( fsl ) > 0 ){
    
    fs_buff = NULL
    for(flsi in fsl[3]){
      
      dir_flsi = dir( flsi, full.names = T )
      fifi = file.info( dir_flsi )
      fslii = dir_flsi[!fifi$isdir]
      fs_buff = c( fs_buff , fslii )
      
    }
    
    fs = c(fs,fs_buff)
  } 
  
  
  fs = fs[is.zip( fs )]
  
  for( f in fs ){
    
    pathParts = strsplit(f,"/" ) 
    led = which( grepl("L2" ,pathParts[[1]]))[1]
    subD = pathParts[[1]][led]
    
    l  <- unzip(f, files = NULL, list = TRUE, overwrite = TRUE,
                junkpaths = FALSE, exdir = ".", unzip = "internal",
                setTimes = FALSE)
    
    loglist = l[ ( grepl("Logfile.mpba",l$Name) | grepl("logfile.mpba",l$Name) & !grepl("General",l$Name) & !grepl( "Launcher",l$Name )) , 1 ]
    loglist  = loglist[ as.numeric(unname( sapply( sapply( loglist ,   strsplit, "\\\\" ) ,function(x){ x[3]} ) ) ) >= 1e6 ]
    
    loglistGeneral = l[ ( grepl("Logfile.mpba",l$Name) | grepl("LogFile.mpba",l$Name) )  & !grepl("Launcher",l$Name) & grepl("General",l$Name) , 1 ]
    
    if( length(loglist) > 0 ){
      
      
      result  <- unzip(f, files = loglist, list = FALSE, overwrite = TRUE,
                       junkpaths = FALSE, exdir = file.path("C:/Temp/tryZip5",subD), unzip = "internal",
                       setTimes = FALSE)
      
      
    }
    
  }
  
}

p1 = 'X:/fracas/Systems/L209/Exalenz_Lab_SN_209_2017_11_13_12-27-27.zip'

for(ds in dirList[4] ){
  
  #fiterSide zips
  fs  = dir(ds,full.names = T)
  
  fif = file.info(fs)
  fsl = fs[fif$isdir]
  fs = fs[!fif$isdir]
  if( length( fsl ) > 0 ){
    
    fs_buff = NULL
    for(flsi in fsl ){
      
      dir_flsi = dir( flsi, full.names = T )
      fifi = file.info( dir_flsi )
      fslii = dir_flsi[!fifi$isdir]
      fs_buff = c( fs_buff , fslii )
      
    }
    
    fs = c(fs,fs_buff)
  } 
  
  fs = fs[is.zip( fs )]
  
  df = NULL
  
  #run on site zips
  for( f in fs ){
    
    
    pathParts = strsplit(f,"/" ) 
    led = which( grepl("L2" ,pathParts[[1]]))[1]
    subD = pathParts[[1]][led]
    
    l  <- unzip(f, files = NULL, list = TRUE, overwrite = TRUE,
                junkpaths = FALSE, exdir = ".", unzip = "internal",
                setTimes = FALSE)
    
    
    #loglist = l[ ( grepl("Logfile.mpba",l$Name) | grepl("LogFile.mpba",l$Name) )  & !grepl("Launcher",l$Name) & grepl("General",l$Name) , 1 ]
    loglist = l[ grepl("ServiceLogFile",l$Name) , 1 ]
    
    if( length(loglist) > 0 ){
      
      
      result  <- unzip(f, files = loglist, list = FALSE, overwrite = TRUE,
                       junkpaths = FALSE, exdir = file.path("C:/Temp/tryZip6",subD), unzip = "internal",
                       setTimes = FALSE)
      
      
      for( re in result ){
        
        for(r in re){
          print(r)
          comanndString = paste0("C:\\ExalenzPrograms\\BreathIDViewers\\MPBABinViewer.exe ", r ," EXPORT" )
          system(comanndString,wait = T ) 
        }
      }
      
      f1 = sub( ".mpba",".txt" , result)
      Devices = NULL
      Times =   NULL 
      for(fi in f1){
        fi= f1[1]
        da  = read.csv( fi, header = T ,  sep = ";",stringsAsFactors = F)
        
        #da1 = da[1:10,][grepl( "Device" , da$Message[1:10] ),] 
        da1 = da[grepl( "DOB =" , da$Message),] 
        
        
        s = strsplit(da1$Message,":")[[1]]
        Devices = c( Devices ,as.numeric(substr(s[2],1,4)) )
        Time = substr( da1$Time,1,10 )
        Times = c( Times ,  Time )
      }
      
      zipfile = rep(f,length(Time))
      dfi = data.frame( Time , Devices , zipfile )
      dfi$site <- subD
      df = rbind( df ,dfi )
    
      
    }
    
  }
  
  
  f.d = "C:/Temp/tryZip5Results"
  f.n = paste0( subD , ".csv" )
  write.csv(df,file.path(f.d,f.n ) )
  
}


bu = NULL
for(d in dirList[5] ){
  
  filel = dir(d,full.names = T,recursive = T)
  filel = filel[is.zip( filel )]
  bu = c(bu,filel)
}


ind = which(grepl("/L210", bu ))
bu[]


s = seq(0,5,length.out = 100)

plot(s,exp(-exp(-x))

for(i in 1:length(bu))
{
  print(i)
  print(bu[i])
  
  pathParts = strsplit(bu[i],"/" ) 
  led = which( grepl("L2" ,pathParts[[1]]))[1]
  subD = pathParts[[1]][led]
  

  l  <- unzip(bu[i], files = NULL, list = TRUE, overwrite = TRUE,
              junkpaths = FALSE, exdir = ".", unzip = "internal",
              setTimes = FALSE)
  
  loglist = l[ grepl("Logfile.mpba",l$Name) | 
               ( !grepl("Launcher",l$Name) & grepl("General",l$Name) & grepl("LogFile.mpba",l$Name) ), 1 ]
  
  
  
  
  
  
  result  <- unzip(bu[i], files = loglist, list = FALSE, overwrite = TRUE,
                   junkpaths = FALSE, exdir = file.path("C:/Temp/tryZip3",subD), unzip = "internal",
                   setTimes = FALSE)
}


#create text files from logs



basicPath = "c:\\Temp\\tryZip3\\L208"

di = dir( basicPath , full.names = T, recursive = T )
di1 = di[ grepl("ogfile.mpba",di) ]
length(di1)



for(i in 1:length(di1)){
  print(di[i])
  comanndString = paste0("C:\\ExalenzPrograms\\BreathIDViewers\\MPBABinViewer.exe ", di[i] ," EXPORT" )
  system(comanndString,wait = T ) 
}


#runstring2 = paste0(runstring1,filepath," -search  SAVE_ALL_TEXT ",filempbalisttxt[i])




getZipFile <-  function(lin)
{
  lin = l2
  iDir = dir(lin,full.names = T)
  bfl = file_test("-f",iDir)
  DirFiles = iDir[ bfl ]
  bZip = is.zip( DirFiles )
  zipFilelist = DirFiles[ bZip ]
  dirsName = iDir[!bfl]
  ServiceCalls = dirsName[ grepl( "Service Calls" , dirsName ) ] 
  MonthlyLogs = dirsName[ grepl( "Monthly Logs" , dirsName ) ] 
  
  if( length(ServiceCalls) > 0 )
  {  
    filesdir <- dir(ServiceCalls,full.names = T,recursive = F)
    ServiceCallsFiles = filesdir[ is.zip( filesdir ) ]
    if( length(ServiceCallsFiles ) > 0 )
    {
      zipFilelist = c(zipFilelist, ServiceCallsFiles )
    }
    
  }
  
  if( length(ServiceCalls) > 0 )
  {
    filesdir <- dir(MonthlyLogs,full.names = T,recursive = F)
    
    MonthlyLogsFiles = filesdir[ is.zip( filesdir ) ]
    
    if( length(MonthlyLogsFiles ) > 0 )
    {
      zipFilelist = c( zipFilelist ,  MonthlyLogsFiles )
    }
  }
  
  return( zipFilelist )
}

dirList = dir("X:/fracas/Systems",full.names = T)
dirList = dirList[ grepl("L2",dirList) ]

#l2 = dirList[29]

for(l2 in dirList[7:length(dirList)]){
  
  zipFileListForl2 <-  getZipFile(l2)
  
  if( length(zipFileListForl2 ) > 0 ){

    for(zipf in  zipFileListForl2 )
    {
      zipf = gsub("\\\\","/",zipf)  
      sts = strsplit(zipf,"/")[[1]]
      le = length(sts)
      w = which(is.L2s(sts))
      
      if(le - w[1] == 1 ){
        
        exdir = file.path(basicPath , sts[w[1]] )
        
      } else if( le - w[1] == 2  ){
        
        exdir = file.path(basicPath , paste0( sts[w[1]], "/" , sts[w[1]+1]) )
      } 
      
            
      l  <- unzip(zipf, files = NULL, list = TRUE, overwrite = TRUE,
                  junkpaths = FALSE, exdir = ".", unzip = "internal",
                  setTimes = FALSE)
      
      #loglist = l[grepl("Logfile.mpba",l$Name),1]
      loglist = l[grepl("LogFile.mpba",l$Name) & grepl("General",l$Name),1]
      
      result  <- unzip(zipf, files = loglist, list = FALSE, overwrite = TRUE,
                       junkpaths = FALSE, exdir = exdir, unzip = "internal",
                       setTimes = FALSE)
      
      
    }
  }
}

rootPath = "C://Temp/tryZip"

createTxtLogFiles <-(rootPath){
  
  allfilePath = dir(rootPath,recursive = TRUE,full.names = T)
  
  #allfilePath = allfilePath[grepl("Logfile.mpba",allfilePath) & !grepl("L205",allfilePath) & !grepl("L204",allfilePath)]
  allfilePath = allfilePath[grepl("LogFile.mpba",allfilePath)]
}
  

allfilePath = dir(rootPath,recursive = TRUE,full.names = T)
allfilePath = allfilePath[grepl("General",allfilePath)]

allfilePathList = paste0( "C:/Temp/tryZip2/L", 243:260,"/" )

for(allfilePath in allfilePathList){

  allfilePath = dir(allfilePath,full.names = T,recursive = T)
  allfilePath = allfilePath[grepl("Logfile.mpba",allfilePath)]

  
  for(al in allfilePath){
    
    cmmandString = paste0("C:\\ExalenzPrograms\\BreathIDViewers\\MPBABinViewer.exe ", al ," EXPORT" ) 
    
    print( cmmandString )
  
    system( cmmandString  )  
    
  }
}

allfilePath = dir(rootPath,recursive = TRUE,full.names = T)

allfilelogtxt = allfilePath[grepl("logfile.txt",allfilePath)]


  


preOnefileServiceLogConvertToText <-function(filepath){
  
  #filempbalist = paste0(dir("C:/Temp/ServiceLogFile",full.names = T),"/Logs/ServiceLogFile.mpba")
  dn  =  dirname(filepath)
  bn = basename(filepath)
  strsplit("b.n","\.")
  
  runstring2 = paste0(runstring1,filepath," -search  SAVE_ALL_TEXT ",filempbalisttxt[i])
  system(runstring2,wait = T ) 
  filempbalisttxt = paste0(dir("C:/Temp/ServiceLogFile",full.names = T),"/ServiceLogFile.txt")
  runstring1 = "C:/4.4.3forBoazOnly_/MPBALoggerViewer.exe "
  i=0
  for(fl in filempbalist){
    i =i+1
    runstring2 = paste0(runstring1,fl," -search SAVE_ALL_TEXT ",filempbalisttxt[i])
    system(runstring2,wait = T ) 
    
  }
}

fn = "C:/Temp/tryZip/L228/ServiceCalls/DeviceNumber_1463/Logs/Tests/2632/Logfile.mpba "  
#ft = "C:/Temp/tryZip/L228/ServiceCalls/DeviceNumber_1463/Logs/Tests/2632/Logfile.txt "  
runstring2 = paste("C:/4.4.3forBoazOnly_/MPBALoggerViewer.exe ",fn,ft)


(22.7)*(0.0821)*(300)/1

system(runstring2,wait = T ) 

# preOnefileServiceLogConvertToText <-function(){
#   
#   filempbalist = paste0(dir("C:/Temp/ServiceLogFile",full.names = T),"/Logs/ServiceLogFile.mpba")
#   filempbalisttxt = paste0(dir("C:/Temp/ServiceLogFile",full.names = T),"/ServiceLogFile.txt")
#   runstring1 = "C:/4.4.3forBoazOnly_/MPBALoggerViewer.exe "
#   i=0
#   for(fl in filempbalist){
#     i =i+1
#     runstring2 = paste0(runstring1,fl," -search  SAVE_ALL_TEXT ",filempbalisttxt[i])
#     system(runstring2,wait = T ) 
#     
#   }
# }


######

if(FALSE){

  dirpath = "X:\\fracas\\Systems\\L204" 
  fl <- dir(dirpath,full.names = T)
  
  
  
  
  l  <- unzip(fl[1], files = NULL, list = TRUE, overwrite = TRUE,
        junkpaths = FALSE, exdir = ".", unzip = "internal",
        setTimes = FALSE)
  
  loglist = l[grepl("Logfile.mpba",l$Name),1]
  
  
  result  <- unzip(fl[1], files = loglist, list = FALSE, overwrite = TRUE,
              junkpaths = FALSE, exdir = "C:\\Temp\\tryZip", unzip = "internal",
              setTimes = FALSE)
}

fp <- "C:\\Temp\\tryZip\\L208\\DeviceNumber_1276\\Logs\\Tests\\21598\\Logfile.mpba"
strings = c("calibration","Calibration")

mpbaFilePath = fp

comanndString = paste0("C:\\ExalenzPrograms\\BreathIDViewers\\MPBABinViewer.exe ", mpbaFilePath ," EXPORT" )

system(comanndString)

extractStringsLine <- function(fp,strings)
{
  fd <- read.csv( fp ,sep = ";",header = F)  

View(fd[apply( sapply(strings,function(x) grepl(x,fd$V4) ),1 ,any ) ,] )

}

cutPath <- function(x){
  
  pathParts = strsplit(x,"/" ) 
  le = which( pathParts[[1]] ==  "Tests" )
  return(paste(pathParts[[1]][1:le],collapse = "/"))
}


cutPathD <- function(x){
  
  pathParts = strsplit(x,"/" ) 
  led = which( grepl("DeviceNumber_" ,pathParts[[1]]))
  return(paste(pathParts[[1]][led],collapse = "/"))
}

dirpath = "c:/Temp/tryZip" 
fl <- dir(dirpath,full.names = T,recursive = T)
flWithTest = fl[grepl("Test",fl) & grepl("logfile.txt",fl)]
cutfl = unlist(lapply(flWithTest,cutPathD))
sp  = split(flWithTest,cutfl)
t(table(cutfl))



x= "C:/Temp/tryZip/L204/DeviceNumber_1329/Logs/Tests/10205/Logfile.mpba"
getNumberOfTests <- function(x){ 
  pathParts = strsplit(x,"/" ) 
  le = which( pathParts[[1]] ==  "Tests" )
  led = which( grepl("DeviceNumber_" ,pathParts[[1]]))
  testpath = paste(pathParts[[1]][1:le],collapse = "/")
  return(cbind(c( pathParts[[1]][led],length(dir(testpath)))))
}

lapply(flWithTest , getNumberOfTests )
paste0(c("e","r"),collapse = "/")

getNumberOfTests(flWithTest[4])


dirpath = "c:/Temp/tryZip2" 

df <- dir(dirpath,recursive = T,full.names = T)

dftxt = df[grepl(".txt",df)]
dfmpba = df[grepl("Logfile.mpba",df)]
length(dftxt)
length(dfmpba)
dfmpba[1:100]


bn = as.numeric(basename(dirname(dftxt))) >= 1000000
dftxt[bn]

length(dftxt[1])
ba  = basename(dirname(dirname(dirname(dirname(dftxt)))))

sp = split(dftxt,ba)

df = data.frame(name = names(sp),NumberOfTest = unlist(unname(lapply(sp,length))))

bu1 = bu

(bu)

bu1[,1] = substr(bu1[,1],1,10)

#write.csv(df,"C:/Temp/tryZip/re.csv")
#write.table(bu1,"C:/Temp/tryZip/bu.csv",sep  = ',')

du1  = read.csv("C:/Temp/tryZip/bu.csv",header = T,stringsAsFactors = F)


dre  = read.csv("C:/Temp/tryZip/re.csv",header = T,stringsAsFactors = F)
me = merge(dre,du1,all.x = TRUE ,by = "Device")
View(me)
#write.table(me,"C:/Temp/tryZip/me.csv",sep  = ',')






dirname_dftxt =  dirname(dftxt)

dirname_dfmpba =  dirname(dfmpba)


dirname_dfmpba_noText <- dirname_dfmpba[!(dirname_dfmpba %in% dirname_dftxt)]
as.character(da$Time)

da <- read.csv(file.choose(),header = F,sep = ';')

a = as.character(da[,4])

da[1,]
a[346]

View(bu)

i=0


bu = NULL
for(tx in dftxt[bn] )
{
  i=i+1
  if( i %% 100 == 1  )
  {
    
    print(tx)  
    
  }
  
  da = read.csv( tx , sep = ";",header = T  )
  asMessage = as.character(da[,4])
  b =  grepl( "High Correlation Results = ", asMessage )# | grepl( "DoPerformShortCalibration: Test number is:" , asMessage )
  if( any(b) ){
    ti = as.character(da$Time)
    wb = which(b)
    for(w in wb){
      tio  = ti[w]
      M  = asMessage[w]  
      bu = rbind(bu , c(tio , M , tx))
    }
    
  }
    
    
}





budo = NULL
for(tx in dftxt[bn] )
{
  i=i+1
  if( i %% 100 == 1  )
  {
    
    print(tx)  
    
  }
  
  da = read.csv( tx , sep = ";",header = T  )
  asMessage = as.character(da[,4])
  b =  grepl( "DoPerformShortCalibration: Test number is:" , asMessage )
  if( any(b) ){
    ti = as.character(da$Time)
    wb = which(b)
    for(w in wb){
      tio  = ti[w]
      M  = asMessage[w]  
      budo = rbind(budo , c(tio , M , tx))
    }
    
  }

}

write.csv(budo,"C:/Temp/tryZip/budo.csv")
budo <- data.frame(budo)


budo$Date <- substr(budo$X1,1,10)
budo <- budo[,-1]
budo$Test <-  as.numeric(substr(budo$X2,45,50))
budo <- budo[,-1]
colnames(budo)[1] <- "Device"

colnames(budo)[2] = "CheckDate"
meall = merge(me,budo,all.x = T,by  = "Device")


meall$CheckDate <- as.Date(meall$CheckDate,"%d/%m/%Y")
meall$Date <- as.Date(meall$Date,"%d/%m/%Y")

meall$diff <- meall$Date - meall$CheckDate

meall$CalibrationDate <- meall$CheckDate

meall =  meall[,-which(colnames(meall) == "CheckDate")]

View(meall)

meall[meall$Date != meall$CalibrationDate, ]

meallDiffPositive =   meall[meall$diff > 0  & !is.na( meall$diff ) ,]
View(meallDiffPositive)
meallDiffPositive = meallDiffPositive[,-5]
write.csv(meallDiffPositive,"C:/Temp/tryZip/meallDiffPositive.csv")



sp =split(meall,meall$Device)


l = strsplit(as.character(budo$Device),"/")

(l[[1]])[5]

budo$Device <- as.numeric( lapply(l,function( x ) { substr( x[ 5 ] , 14 ,18 ) } ) )

bn = substr(basename(dirname(dirname(dirname(dirname(dftxt))))),12,15)

View(meall)

buu =NULL
for(tx in dftxt )
{
  i=i+1
  if( i %% 100 == 1  )
  {
    
    print(tx)  
    
  }

  da = read.csv( tx , sep = ";",header = T  )
  asDate = as.character(da[1,1])
  dates  =  substr(asDate,1,10)
  ba  = substr(basename(dirname(dirname(dirname(dirname(tx))))),14,17)
  tests  = basename(dirname(tx))
  buu = rbind(buu, c(ba,tests,dates))
  
}  

#write.csv(buu,"C:/Temp/tryZip/dates.csv")
  

buu = data.frame(buu)
  
dim(bu)

sp = split(buu,buu[,1])
as.Date(s, "%d/%m/%Y" )[as.Date(s,"%d/%m/%Y") > as.Date("20/02/2017","%d/%m/%Y")]


st = as.Date(s, "%d/%m/%Y" )

st = st[order(st)]

st[st >= as.Date("20/02/2017","%d/%m/%Y")]


s = as.character((sp[[1]])[,3])

md  = me[!is.na(me$Date),c("Device","Date")]

#-----------------------------------

bu1[,3]

getN<-function(x)
{
  s = x[3]
  s = strsplit(s,"/")[[1]]
  sb= grepl("DeviceNumber_" ,s  )
  out  = as.numeric(substr(s[sb],14,17))
  return(out)
}

getN(bu1[1,])

Device <- apply(bu1,1,getN)

Dates = bu1[,1]

Dates = substr(Dates,1,10)

df = data.frame( Device , Dates,stringsAsFactors = F ) 

colnames(buu) <- c("Device","Test","Dates")
f = df[1,]

f = df[1,]

buu = buu1 

buu$Device = as.numeric(buu$Device)
buu$Test = as.numeric(buu$Test)
buu$Dates = as.Date(buu$Dates,"%d/%m/%Y")

str(df)
head(buu)
buu = read.csv("C:/Temp/tryZip/dates.csv",header = T,stringsAsFactors = F)
buu$Dates = as.Date(buu$Date,"%d/%m/%Y")
colnames(buu) <- c("Device","Test","Dates")

buu$Dates <- as.Date(buu$Dates,"%d/%m/%Y")

df$Dates <- as.Date(df$Dates,"%d/%m/%Y")

d = f[1])





sum(buu$Device == d )

f = df[1,]
prepost1 = NULL
for(i in 1:dim(df)[1]){
  
  buDates =buu$Dates[buu$Device  == as.numeric( df[i,1] )]
  preb = df[i,2] - as.Date(buDates)
  prepost1 = rbind(prepost1 ,c(as.numeric(df[i,1]) , max(preb) ,-min(preb) ) )
  #prepost = rbind(prepost ,c(as.numeric(df[i,1]) , sum(preb) ,sum(!preb) ) )
  
}


meallNoNA  <-  meall[!is.na(meall$CalibrationDate),]


meallNoNADeviceCalibrationDate = meallNoNA[,c("Device","CalibrationDate")]

meallNoNADeviceCalibrationDate = meallNoNADeviceCalibrationDate[!duplicated(meallNoNADeviceCalibrationDate),]

i = 1


sp = split(meallNoNADeviceCalibrationDate,meallNoNADeviceCalibrationDate$Device)

s = sp[[1]]

ll = NULL
lld = NULL
i = 0 
for(s in sp){

  i = i+1
  buuDates  = buu$Dates[buu$Device ==s$Device[1]]
  cd = s$CalibrationDate[order(s$CalibrationDate)]
  fi  = findInterval(buuDates,cd)
  ll[[i]] = table(fi)
  spp = split(buuDates,fi)
  la = (lapply(spp,range))
  lld[[i]]  = lapply(la,diff)
  
}
all = NULL
for( j in 1:length(ll) ){
  
  all[[j]]  = cbind(tests = ll[[j]],days = unlist((lld[[j]])) )
}
  
names(all) = names(sp)

allA  = NULL

for(k in 1:length(all)){
  
  
  li = cbind(rep(names(sp)[k],dim(all[[k]])[1]),all[[k]])
  colnames(li) =  c("Device","tests","days")
  allA = rbind(allA,li)
  
  
}
  
write.csv(allA,"C:/Temp/tryZip/allA.csv")

allA = data.frame(allA)
allA$days <- as.numeric(as.character(allA$days))

allA <- allA[as.numeric(allA$days)> 0,]


meall$Device[ !(meall$Device  %in% names(sp)) ] 


mean(allA$days[allA$days > 50])
median(allA$days[allA$days > 100])


allA$days[order(allA$days)]

quantile(allA$days,0.5)
o1 = NULL
for(o in 1:1000)
  o1  =c(o1,sum(rpois(496,1/130)))
sum(o1)/1000

(1- ppois(1,1/130))

rpois(496,1/130)

130/496

qpois(0.1,2146)


d = seq(1,300)

d1 = seq(1,10000)

plot(1- exp(-d1/2146),type  = "l",
     ylab = "Probabilty for  at least one event" , xlab = "Days",main = "Probabilty for  at least one calibration demand event" )


points(1- exp(-d1/1000),type  = "l",col = 2 ,
     ylab = "Probabilty for  at least one event" , xlab = "Days",main = "Probabilty for  at least one calibration demand event" )
legend("bottomright",c("Result","Simulate 1000"), col = c(1,2), pch = 19)


plot(1- exp(-d/2146),type  = "l",lwd  = 2,
     ylab = "Probabilty for  at least one event" , xlab = "Days",main = "Probabilty for  at least one calibration demand event" )


y = 1- exp(-d/2146)
model = lm(y ~ d)
abline( model, col = 2 ,lwd = 2 , lty = 2 )
legend("bottomright",c("Result","LinearFit"), col = c(1,2), pch = 19)

p  = c(0.3,1,2.5,5)/100
cb = cbind(-2146 * log( 1 - p ),-2146 *2 * log( 1 - p ) )

apply(cb ,1,function(x) x[1]/x[2] )

d = seq(1,300,length.out = 10000 )

1- exp(-7/2146)


alfa <- function(n)
{
   return(n * (n+1) / 2 )
  
}

gaFirst = 4 / sum ( allA$days ) )

gaSecond = 4 / sum ( apply( data.frame( x = allA$days ) , 1 , alfa ) )

d = 1:300
plot( ga * d^2/2 ,type = "l",col = 3 ,ylab = "Probabilty",xlab ="Days",main = "model P(D) = Const * D Accumulate Probabilty for 1 Event")
abline( h = 0.01,lwd = 2 , lty =2 ,col =2)
abline( v = 84,lwd = 2 , lty = 2 ,col = 4)

allA <- read.csv("C:\\Temp\\tryZip\\allA.csv") 
allA$days

sqrt(2/3)

plot(1 - exp(-gaFirst*(1:1000)),type = "l",col = 3 ,ylab = "Probabilty",xlab ="Days",main = "model P(D) = Const Accumulate Probabilty for 1 Event")
abline( h = 0.01,lwd = 2 , lty =2 ,col =2)
abline( v = 21,lwd = 2 , lty = 2 ,col = 4)
0.01/gaFirst
