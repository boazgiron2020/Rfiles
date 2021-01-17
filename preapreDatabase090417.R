library(stringr)
source(tools.R)
#Functions---------------------------------------------------------------------------------------


calDOB <- function(ra1,le){
  ra1 = rax
  or = order(ra1$RatioTime)
  ra1=ra1[or,]
  abs12 = apply(ra1[ ,paste0("I12_.",(22-le):22) ],1,mean)/ra1$N12Avg
  abs13 = apply(ra1[ ,paste0("I13_.",(22-le):22) ],1,mean)/ra1$N13Avg
  YAT13 = data.frame(Y = ra1$C13_Y,A = ra1$C13_A, T = ra1$C13_T)[1,]
  YAT12 = data.frame(Y = ra1$New.C12_Y,A = ra1$New.C12_A, T = ra1$New.C12_T)[1,]
  coef <- ra1[,c("Coef_0","Coef_1","Coef_2","Coef_3")][1,]
  re = callculateRatio(abs12,abs13,YAT12,Yat13,coef)
  ratios = re[11:15]
  dt  = ra1$RatioTime - ra1$RatioTime[1]
  #dt  = ratiosExample$RatioTime - ratiosExample$RatioTime[1]
  dt = dt/max(dt)
  db = dt[c(1,3,5)]
  ds = dt[c(2,4)]
  rb = ratios[c(1,3,5)]
  model <- lm(rb ~ poly( db , 2 ) )
  Raselineinter = predict(model,data.frame(db = ds))
  DOBresult = mean( 1e3 * ( ratios[c(2,4)] - Raselineinter )/ Raselineinter ) 
  DOBresult
}


#----------------------Working-------------#----------------------Working-------------#----------------------Working-------------

abs12f = (matrix(m,2,5))[1,] -abs12
abs13f = (matrix(m,2,5))[2,] -abs13

abs12 = apply(ra1[ ,paste0("I12_.",(22-le):22) ],1,mean)/ra1$N12Avg
abs13 = apply(ra1[ ,paste0("I13_.",(22-le):22) ],1,mean)/ra1$N13Avg

YAT13 = data.frame(Y = ra1$C13_Y,A = ra1$C13_A, T = ra1$C13_T)[1,]
YAT12 = data.frame(Y = ra1$New.C12_Y,A = ra1$New.C12_A, T = ra1$New.C12_T)[1,]
coef <- ra1[,c("Coef_0","Coef_1","Coef_2","Coef_3")][1,]
buffDOBresult = NULL
for(i in 1:1000){
  
  abs12W = abs12 + rnorm(5,0,3e-5)
  abs13w = abs13 + rnorm(5,0,3e-5)
  re = callculateRatio(abs12W,abs13w,YAT12,Yat13,coef)
  ratios = re[11:15]
  dt  = ra1$RatioTime - ra1$RatioTime[1]
  #dt  = ratiosExample$RatioTime - ratiosExample$RatioTime[1]
  dt = dt/max(dt)
  db = dt[c(1,3,5)]
  ds = dt[c(2,4)]
  rb = ratios[c(1,3,5)]
  model <- lm(rb ~ poly( db , 2 ) )
  Raselineinter = predict(model,data.frame(db = ds))
  DOBresult = mean( 1e3 * ( ratios[c(2,4)] - Raselineinter )/ Raselineinter ) 
  buffDOBresult = c(buffDOBresult,DOBresult)
}

hist(buffDOBresult,50)

#--------------------------------------------------------------------------------------------------

#TODO 
#1. Complete Autozero building 
#--------------------------------------------------------------

#filepath = "X:\\RD\\Team Members\\Mor\\TestResultsCsv\\"
WorkinDir = "X:/RD/Team Members/Mor/Data/TestResultsCsv/"
WorkinOU =  "X:/RD/Team Members/Mor/Data/OuStatusFiles/"

#PatientTests Data ----

#loadTables
PatientTestsDataFilePath  = paste0( WorkinDir,"PatientTestsData.csv" )
PatientTestsData <- read.csv( PatientTestsDataFilePath,header = T )

systemDataFilePath  = paste0( WorkinDir,"SystemTestsData.csv" )
SystemTestsData.csv = read.csv( PatientTestsDataFilePath,header = T )

WarmUpsDataFilePath  = paste0( WorkinDir,"WarmUpsData.csv" )
WarmUpsData.csv = read.csv( WarmUpsDataFilePath,header = T )

AZ_DataPath  = paste0( WorkinDir,"AZ_Data.csv" )
AZ_Data.csv = read.csv( AZ_DataPath,header = T )

FillBagPath  = paste0( WorkinDir,"FillBagsData.csv" )
FillBagsData.csv = read.csv( FillBagPath,header = T )

CalibrationsDataFromMpbaPath  = paste0( WorkinDir,"CalibrationsDataFromMpba.csv" )
CalibrationsDataFromMpba.csv = read.csv( CalibrationsDataFromMpbaPath,header = T )


DOBsDataPath  = paste0( WorkinDir,"DOBsData.csv" )
DOBsData.csv = read.csv( DOBsDataPath, header = T )
colnames(DOBsData.csv)[grep("DobIndex",colnames(DOBsData.csv))] <- "DobNum"
DOBsData.csv$DobNum <- DOBsData.csv$DobNum + 1

DOBTimes_DataPath  = paste0( WorkinDir,"DOBTimes_Data.csv" )
DOBTimes_Data.csv = read.csv( DOBTimes_DataPath, header = T,row.names=NULL )
colnames(DOBTimes_Data.csv) <- c("DeviceNumber","TestNumber","DobNum","FillSampleStartTime","DilutionStartTime","FillSampleEndTime") 
DOBTimes_Data.csv$DeviceNumber <- as.numeric(as.character(DOBTimes_Data.csv$DeviceNumber))



RatiosDataPath  = paste0( WorkinDir,"RatiosData.csv" )
RatiosData.csv = read.csv( RatiosDataPath, header = T,row.names=NULL )
colnames(RatiosData.csv)[grep("DobIndex",colnames(RatiosData.csv))] <- "DobNum"
#Conver index to num
RatiosData.csv$DobNum <- RatiosData.csv$DobNum + 1

RatioTimes_DataPath  = paste0( WorkinDir,"RatioTimes_Data.csv" )
RatioTimes_Data.csv = read.csv( RatioTimes_DataPath, header = T,row.names=NULL )
colnames(RatioTimes_Data.csv) <- c("DeviceNumber","TestNumber","DobNum","RatioId","BagType","CleanBag","lockCell","MeasureEnd" ) 


#createIDs--------------------------------------------------------------------------------------------------------------------------------

# create Test ID----

PatientTestsData = within (PatientTestsData, stStartTime <- strptime( as.character(StartTime), "%d/%m/%Y %H:%M:%S" ) )
PatientTestsData = within(PatientTestsData,TestID <- paste0("Patient_",DeviceNumber,"_",TestNumber,"_",stStartTime,"_ID"))
PatientTestsData = within(PatientTestsData,TestID <- gsub("-","_",gsub(" ","_",gsub(":","_",TestID))))
PatientTestsData = within(PatientTestsData,WarmUpID <- rep("NA",dim(PatientTestsData)[1]))
PatientTestsData = within(PatientTestsData,CalibrationID <- rep("NA",dim(PatientTestsData)[1]))
PatientTestsData = within(PatientTestsData,SystemTestID <- rep("NA",dim(PatientTestsData)[1]))


#create SystemTestID----
SystemTestsData.csv = within (SystemTestsData.csv, stStartTime <- strptime( as.character(StartTime), "%d/%m/%Y %H:%M:%S" ) )
SystemTestsData.csv = within(SystemTestsData.csv,SystemTestID <- paste0("SystemTest_",DeviceNumber,"_",TestNumber,"_",stStartTime,"_ID"))
SystemTestsData.csv = within(SystemTestsData.csv,SystemTestID <- gsub("-","_",gsub(" ","_",gsub(":","_",SystemTestID))))
SystemTestsData.csv = within(SystemTestsData.csv,AzID <- rep("NA",dim(SystemTestsData.csv)[1]))
#----

#create WarmupID----
WarmUpsData.csv <- within(WarmUpsData.csv,sEnd <- strptime(as.character(End), "%d/%m/%Y %H:%M:%S" ) )
WarmUpsData.csv = within(WarmUpsData.csv,WarmUpID <- paste0("WarmUp_",Device.Number,"_",sEnd,"_ID"))
WarmUpsData.csv = within(WarmUpsData.csv,WarmUpID <- gsub("-","_",gsub(" ","_",gsub(":","_",WarmUpID))))
WarmUpsData.csv = within(WarmUpsData.csv,AzID <- rep("NA",dim(WarmUpsData.csv)[1]))

#create AZ ID
AZ_Data.csv = within (AZ_Data.csv, sLockCellTime <- strptime( as.character(AZ.LockCell.Time), "%d/%m/%Y %H:%M:%S" ) )
AZ_Data.csv = within(AZ_Data.csv,AzID <- paste0("Az_",Device.Number,"_",Try.Number,"_",sLockCellTime,"_",IsSucceeded,"_ID"))
AZ_Data.csv = within(AZ_Data.csv,AzID <- gsub("-","_",gsub(" ","_",gsub(":","_",AzID))))
#write.csv(AZ_Data.csv,"C:/WorkingData/AzID.csv")


#create FillBag ID
FillBagsData.csv = within (FillBagsData.csv, sEndFillTime <- strptime( as.character(End.Fill), "%d/%m/%Y %H:%M:%S" ) )
FillBagsData.csv = within(FillBagsData.csv,FillID <- paste0("FillBag_",DeviceNumber,"_",TestNumber,"_",TestType,"_",sEndFillTime,"_",ResultCode,"_ID"))
FillBagsData.csv = within(FillBagsData.csv,FillID <- gsub("-","_",gsub(" ","_",gsub(":","_",FillID))))


CalibrationsDataFromMpba.csv = within (CalibrationsDataFromMpba.csv, sTime <- strptime( as.character(Time), "%d/%m/%Y %H:%M" ) )
CalibrationsDataFromMpba.csv = within(CalibrationsDataFromMpba.csv,CalibrationID <- paste0("Calibration_",Device.Number,"_",Test.Number,"_",sTime,"_ID"))
CalibrationsDataFromMpba.csv = within(CalibrationsDataFromMpba.csv,CalibrationID <- gsub("-","_",gsub(" ","_",gsub(":","_",CalibrationID))))
#write.csv(CalibrationsDataFromMpba.csv,"C:/WorkingData/CalibrationID.csv")


#DOBsData.csv = within (DOBsData.csv, sTime <- strptime( as.character(Time), "%d/%m/%Y %H:%M" ) )
DOBsData.csv = within(DOBsData.csv,DOBsDataID <- paste0("DOBsData_",DeviceNumber,"_",TestNumber,"_",DobNum,"_ID") )
DOBsData.csv = within(DOBsData.csv,DOBsDataID <- gsub("-","_",gsub(" ","_",gsub(":","_",DOBsDataID))))
#DOBsData.csv = within(DOBsData.csv,AzID <- rep("NA",dim(DOBsData.csv)[1]))


#Add RatioID
RatiosData.csv = within(RatiosData.csv,RatioID <- paste0("Ratio_",DeviceNumber,"_",TestNumber,"_",DobNum,"_",RatioIndex,"_ID") )
RatiosData.csv = within(RatiosData.csv,RatioID <- gsub("-","_",gsub(" ","_",gsub(":","_",RatioID))))
#Add DOBsdataID
RatiosData.csv = within(RatiosData.csv,DOBsDataID <- paste0("DOBsData_",DeviceNumber,"_",TestNumber,"_",DobNum,"_ID") )
RatiosData.csv = within(RatiosData.csv,DOBsDataID <- gsub("-","_",gsub(" ","_",gsub(":","_",DOBsDataID))))

RatioTimes_Data.csv = within(RatioTimes_Data.csv,RatioID <- paste0("Ratio_",DeviceNumber,"_",TestNumber,"_",DobNum,"_",RatioId,"_ID") )
RatioTimes_Data.csv = within(RatioTimes_Data.csv,RatioID <- gsub("-","_",gsub(" ","_",gsub(":","_",RatioID))))

RatioTimes_Data.csv = within(RatioTimes_Data.csv,DOBsDataID <- paste0("Ratio_",DeviceNumber,"_",TestNumber,"_",DobNum,"_ID") )
RatioTimes_Data.csv = within(RatioTimes_Data.csv,DOBsDataID <- gsub("-","_",gsub(" ","_",gsub(":","_",RatioID))))

RatiosData.csv = merge(RatiosData.csv,RatioTimes_Data.csv,by = "RatioID")
#write.csv(RatiosData.csv,"C:/WorkingData/RatiosDataPLus1.csv")



#connect DOB to time
DOBTimes_Data.csv[,which(is.na(colnames(DOBTimes_Data.csv)))] =NULL
DOBTimes_Data.csv = within(DOBTimes_Data.csv,DOBsDataID <- paste0("DOBsData_",DeviceNumber,"_",TestNumber,"_",DobNum,"_ID") )
DOBTimes_Data.csv = within(DOBTimes_Data.csv,DOBsDataID <- gsub("-","_",gsub(" ","_",gsub(":","_",DOBsDataID))))

#DOBTimes_Data.csv = within(DOBTimes_Data.csv,RatioID <- paste0("Ratio_",DeviceNumber,"_",TestNumber,"_",DobNum,"_",RatioId,"_ID") )
#DOBTimes_Data.csv = within(DOBTimes_Data.csv,RatioID <- gsub("-","_",gsub(" ","_",gsub(":","_",RatioID))))


#Add AZ to DOB
DOBsData.csv = merge(DOBsData.csv,DOBTimes_Data.csv,by = "DOBsDataID")

#uID = unique(DOBsData.csv$DOBsDataID)
#length(uID)

# Connect AZ to DOBs
#POSIXct_AZtime = as.POSIXct(as.character(AZ_Data.csv$AZ.Flash.Time),format = "%d/%m/%Y %H:%M:%S")
sp = split(DOBsData.csv,DOBsData.csv$DeviceNumber.x)

buff = NULL
for(spi in sp ) {
  
  Azdvice = AZ_Data.csv[spi$DeviceNumber.x[1] == AZ_Data.csv$Device.Number,]
  POSIXct_AZtime = as.POSIXct(as.character(Azdvice$AZ.Flash.Time),format = "%d/%m/%Y %H:%M:%S")
  DOBFillSampleEndTime = as.POSIXct(as.character(spi$FillSampleStartTime),format = "%d/%m/%Y %H:%M:%S")
  oAz = order(POSIXct_AZtime)
  POSIXct_AZtime = POSIXct_AZtime[oAz]
  AzdviceOr = Azdvice[oAz,]
  AZindexs = findInterval(DOBFillSampleEndTime,POSIXct_AZtime)
  AZIDs = AzdviceOr[AZindexs,]$AzID
  buff = rbind(buff,cbind(spi$DOBsDataID,AZIDs))
}  

colnames(buff) = c("DOBsDataID","AzID")
DOBsData.csv = merge(DOBsData.csv,buff,by = "DOBsDataID" )


# Connect Calibration to DOBs
buff = NULL
for(spi in sp ) {#spi  = sp[[1]]
  
  #spi = sp[[1]]
  
  Calibrationdvice = CalibrationsDataFromMpba.csv[spi$DeviceNumber.x[1] == CalibrationsDataFromMpba.csv$Device.Number,]
  POSIXct_Calibrationtime = as.POSIXct(as.character(Calibrationdvice$Time),format = "%d/%m/%Y %H:%M")
  oCal = order(POSIXct_Calibrationtime)
  DOBFillSampleEndTime = as.POSIXct(as.character(spi$FillSampleStartTime),format = "%d/%m/%Y %H:%M:%S")
  POSIXct_Calibrationtime = POSIXct_Calibrationtime[oCal]
  CalibrationdviceOr = Calibrationdvice[oCal,]
  Callibrationindexs = findInterval(DOBFillSampleEndTime,POSIXct_Calibrationtime)
  CalibrationIDs = CalibrationdviceOr[Callibrationindexs,]$CalibrationID
  buff = rbind(buff,cbind(spi$DOBsDataID,CalibrationIDs))
}  


as.character( CalibrationsDataFromMpba.csv[CalibrationsDataFromMpba.csv$Device.Number == 1118,]$Time)



colnames(buff) = c("DOBsDataID","CalibrationID")
DOBsData.csv = merge(DOBsData.csv,buff,by = "DOBsDataID" )
#write.csv(DOBsData.csv,"C:/WorkingData/DOBsDataPLus.csv")

#==========================================================================================================================================

DOBsData.csv = read.csv("W:/R/dataBase/WorkingData/DOBsDataPLus.csv",header = T)
RatiosData.csv = read.csv("W:/R/dataBase/WorkingData/RatiosDataPLus1.csv",header = T)
CalibrationsDataFromMpba.csv <- read.csv("W:/R/dataBase/WorkingData/CalibrationID.csv",header = T)
AZ_Data.csv <- read.csv("W:/R/dataBase/WorkingData/AzID.csv",header = T)



#==========================================================================================================================================
#connect points to ratio
AZ_Data.csv
sp = split(RatiosData.csv,list(as.factor(RatiosData.csv$DeviceNumber.x)))
sel = sample(1:length(sp),5)
pss = sp[sel]


#Number of rations
le = 0
for(spi in pss ) {
  le = le+length(spi$RatioID)
}
le
te = 0
for(spi in pss[1] ) {
  te = c(te ,spi$TestNumber.x)
}







paste0( unique(de1)[1:10], collapse = "_")
de1 = NULL
for(spi in sp ) {
  de1 = c(de1 ,spi$DeviceNumber.x)
}

useDevice = unique(de1)



sp = pss
WorkinOU = "X:/RD/Team Members/Mor/Data/OuStatusFiles/"
buff12 = NULL
buff13 = NULL
spiRatioID = NULL
startlock = NULL
nu = NULL
bu1 = NULL



#Device1373




DOBsData.csv1118  = DOBsData.csv[DOBsData.csv$DeviceNumber.x == 1118,]
hist(DOBsData.csv1118$DOB,30)
dim(DOBsData.csv1118)

DOBsData.csv1118data = DOBsData.csv1118$DOBsDataID[,c("DOBsDataID","DOB"),]



RatiosData.csv1118 <- RatiosData.csv[RatiosData.csv$DOBsDataID.x %in% unique(DOBsData.csv1118$DOBsDataID),]
colnames(RatiosData.csv1118)


RatiosData.csv1118_  = RatiosData.csv1118[,c("Absorption12","Absorption13","I12Avarage","I13Avarage","RatioID")]


spi  = sp$`1118`
testsNum = spi$TestNumber.x
tstart = as.POSIXct(as.character(spi$lockCell),format = "%d/%m/%Y %H:%M:%S")
tend = as.POSIXct(as.character(spi$MeasureEnd),format = "%d/%m/%Y %H:%M:%S")
pathOu = paste0(WorkinOU,"OU_",spi$DeviceNumber.x[1],"/")
fullpathfiles = dir(pathOu,full.names = T)
filesName = dir(pathOu,full.names = T)

DeviceData = NULL
for( fl in fullpathfiles ){#fl  = fullpathfiles[1]
  
  de = read.csv(fl,sep = ";",header = F )[,1:4]
  
  #Get Test Number-----------------
  rep1 = dim(de)[1]
  ssplit = strsplit(fl,"/")[[1]]
  ssplit = ssplit[length(ssplit)]
  ssplit = (strsplit(ssplit,"_")[[1]])[2]
  ssplit = (strsplit(ssplit,"[.]")[[1]])[1]
  
  #------------------
  
  repDevice = rep(spi$DeviceNumber.x[1],rep1)
  repTest = as.numeric(rep(ssplit,rep1))
  de = cbind(de, repDevice, repTest )
  colnames(de) <- c("Time","Index","I12","I13","Device","Test")
  DeviceData = rbind(DeviceData,de)
}

POSIXct_time = as.POSIXct(as.character(DeviceData$Time),format = "%d/%m/%Y %H:%M:%S")
ortime = order(POSIXct_time)
POSIXct_time = POSIXct_time[ortime]
DeviceDataOR = DeviceData[ortime,]
tstartIndex = findInterval(tstart,POSIXct_time)
tendIndex = findInterval(tend,POSIXct_time)
rangeIndex = cbind(tstartIndex,tendIndex,tstart)
dim(rangeIndex)
spi$RatioID <- as.character(spi$RatioID)
length(spi$RatioID)
buff12 = NULL
buff13 = NULL
spiRatioID = NULL
startlock = NULL

for(i in 1:dim(rangeIndex)[1]){
  
  
  bu12 = DeviceDataOR$I12[rangeIndex[i,1]:rangeIndex[i,2]]
  le = length(bu12)
  bu12 = c(rep(0,22 - le),bu12)
  
  bu13 = DeviceDataOR$I13[rangeIndex[i,1]:rangeIndex[i,2]]
  le = length(bu13)
  bu13 = c(rep(0,22 - le),bu13)
  
  buff12 = rbind(buff12,bu12)
  buff13 = rbind(buff13,bu13)
  spiRatioID = c(spiRatioID,spi$RatioID[i])
  startlock = c(startlock,rangeIndex[i,3])
}

dff = data.frame(RatioID = as.character(spiRatioID),I12_ = buff12,I13_ = buff13,RatioTime = startlock )
head(dff)

me  = merge(RatiosData.csv1118_,dff,by = "RatioID" )
colnames(me)

se = paste0("I12._",1:22)
par(mfrow = c(2,5))
cI12  = apply(me[,paste0("I12_.",8:22)],1,mean)
cI13  = apply(me[,paste0("I13_.",8:22)],1,mean)

me <- within(me,cI12  <- apply(me[,paste0("I12_.",8:22)],1,mean) )
me <- within(me,cI13  <- apply(me[,paste0("I13_.",8:22)],1,mean) )

diff12 = (me$I12Avarage - cI12)[w[1]]
diff13 = (me$I13Avarage - cI13)
w = which(max(diff12) == diff12)
plot(9:22,me[w[1],paste0("I12_.",9:22)])




me1118  = merge(me,DOBsData.csv1118,by = "RatioID")

me1 = merge(RatiosData.csv1118,DOBsData.csv1118,by.x = "DOBsDataID.x",by.y = "DOBsDataID")
me2  = merge(me1,dff,by = "RatioID" )

me2 <- within(me2,cI12  <- apply(me2[,paste0("I12_.",8:22)],1,mean) )
me2 <- within(me2,cI13  <- apply(me2[,paste0("I13_.",8:22)],1,mean) )

me3  = merge(me2,AZ_Data.csv,by = "AzID" )
me4  = merge(me3,CalibrationsDataFromMpba.csv,by = "CalibrationID" )


me4 <- within(me4,cA12  <- cI12/N12Avg )
me4 <- within(me4,cA13  <- cI13/N13Avg )


#write.csv(me4,"W:/DataBaseValidation/me4.csv")

mean(me4$cA12 - me4$Absorption12)
hist(me4$cA13 - me4$Absorption13)




#WORKIG LOCATION






cbind(as.character(me4$RatioID[1:20]),me4$cA12)

me4[as.character(me4$RatioID[1]) == as.character(me4$RatioID),]


me4 = read.csv("W:/DataBaseValidation/me4.csv",header = T)
me4_ = me4[!duplicated(me4), ]


le4 = dim(me4_)[1]
YAT13_ = data.frame(Y = me4_$C13_Y,A = me4_$C13_A, T = me4_$C13_T)
YAT12_ = data.frame(Y = me4_$New.C12_Y,A = me4_$New.C12_A, T = me4_$New.C12_T)
coef_ <- me4[,c("Coef_0","Coef_1","Coef_2","Coef_3")]
re =NULL
for(i in 1:le4 ){
  re = rbind(re,c(as.character(me4_$RatioID[i]),round(callculateRatio(me4_$cA12[i],me4_$cA13[i],YAT12_[i,],YAT13_[i,],coef_[i,] ),5 ) ) )
}


re <- data.frame(re)
colnames(re) <- c("RatioID","C13","C12","Ratiov")
me4_1 = merge(me4_,re,by = "RatioID")

cbind(me4_1$Ratio,as.numeric(as.character(me4_1$Ratiov)))[1:10,]
#par(mfrow = c(1,1))
hist(me4_1$Ratio - as.numeric(as.character(me4_1$Ratiov))*990 )

cbind(me4_1$C12.x,me4_1$C13.x,as.numeric(as.character(me4_1$C12.y)),as.numeric(as.character(me4_1$C13.y)) )[1:10,]


(me4_1$Ratio - as.numeric(as.character(me4_1$Ratiov))[1:10,]





#write.csv(me4,"W:/DataBaseValidation/me4.csv")
#me4 = read.csv("W:/DataBaseValidation/me4.csv",header = T)








#WORKIG Zone -----------------------------WORKIG LOCATION----------------------------------WORKIG LOCATION----------------------------------------WORKIG LOCATION 


for(spi in sp ) {
  
  testsNum = spi$TestNumber.x
  tstart = as.POSIXct(as.character(spi$lockCell),format = "%d/%m/%Y %H:%M:%S")
  tend = as.POSIXct(as.character(spi$MeasureEnd),format = "%d/%m/%Y %H:%M:%S")
  pathOu = paste0(WorkinOU,"OU_",spi$DeviceNumber.x[1],"/")
  fullpathfiles = dir(pathOu,full.names = T)
  filesName = dir(pathOu,full.names = T)
  
  DeviceData = NULL
  for( fl in fullpathfiles ){#fl  = fullpathfiles[1]
    
    de = read.csv(fl,sep = ";",header = F )[,1:4]
    
    #Get Test Number-----------------
    rep1 = dim(de)[1]
    ssplit = strsplit(fl,"/")[[1]]
    ssplit = ssplit[length(ssplit)]
    ssplit = (strsplit(ssplit,"_")[[1]])[2]
    ssplit = (strsplit(ssplit,"[.]")[[1]])[1]
    
    #------------------
    
    repDevice = rep(spi$DeviceNumber.x[1],rep1)
    repTest = as.numeric(rep(ssplit,rep1))
    de = cbind(de, repDevice, repTest )
    colnames(de) <- c("Time","Index","I12","I13","Device","Test")
    DeviceData = rbind(DeviceData,de)
  }
  
  
  #View(DeviceData)
  #tt = as.POSIXct(as.character(DeviceData$Time),format = "%d/%m/%Y %H:%M:%S") 
       
  
  POSIXct_time = as.POSIXct(as.character(DeviceData$Time),format = "%d/%m/%Y %H:%M:%S")
  ortime = order(POSIXct_time)
  POSIXct_time = POSIXct_time[ortime]
  DeviceDataOR = DeviceData[ortime,]
  
  tstartIndex = findInterval(tstart,POSIXct_time)
  tendIndex = findInterval(tend,POSIXct_time)
  rangeIndex = cbind(tstartIndex,tendIndex,tstart)
  
  
  spi$RatioID <- as.character(spi$RatioID)
  
  for(i in 1:dim(rangeIndex)[1]){
    
  
    bu12 = DeviceDataOR$I12[rangeIndex[i,1]:rangeIndex[i,2]]
    le = length(bu12)
    bu12 = c(rep(0,22 - le),bu12)
    
    bu13 = DeviceDataOR$I13[rangeIndex[i,1]:rangeIndex[i,2]]
    le = length(bu13)
    bu13 = c(rep(0,22 - le),bu13)
    
    buff12 = rbind(buff12,bu12)
    buff13 = rbind(buff13,bu13)
    spiRatioID = c(spiRatioID,spi$RatioID[i])
    startlock = c(startlock,rangeIndex[i,3])
  }
  
}
  

dff = data.frame(RatioID = as.character(spiRatioID),I12_ = buff12,I13_ = buff13,RatioTime = startlock )
head(dff)






#uniqueRatiosDataDevice = unique(RatiosData.csv$DeviceNumber.x)


#----------------------Working-------------#----------------------Working-------------#----------------------Working-------------

uniqueRatiosDataDOBsDataID.x = unique(RatiosData.csv$DOBsDataID.x)
DOBExample = RatiosData.csv[RatiosData.csv$DeviceNumber.x == 1118,]
uniqueDOBExampleDOBsDataID.x = unique(RatiosData.csv$DOBsDataID.x)
ratiosExample = as.character(DOBExample$RatioID)
RatioExample  = RatiosData.csv[as.character(RatiosData.csv$DOBsDataID.x) %in% as.character(uniqueDOBExampleDOBsDataID.x[1]),]
ddf1 = dff[as.character(dff$RatioID) %in% RatioExample$RatioID,]




RatiosData.csvPart = data.frame(RatioID = RatiosData.csv$RatioID,DOBsDataID  = RatiosData.csv$DOBsDataID.x)
DOBsData.csvPart  = data.frame(CalibrationID = DOBsData.csv$CalibrationID,AzID = DOBsData.csv$AzID,DOBsDataID = DOBsData.csv$DOBsDataID)



ratioWithAll1118  = ratioWithAll[ratioWithAll$Device.Number == 1118,]
uniquratioWithAll1118DOBsDataID = as.character(unique(ratioWithAll1118$DOBsDataID))
ratiosExample = ratioWithAll1118[ratioWithAll1118$DOBsDataID  == uniquratioWithAll1118DOBsDataID[2],]
ratiosExample$RatioTime - ratiosExample$RatioTime[1]

r1118 = ratioWithAll1118[2,]
dob1118 = DOBsData.csv[as.character(uniqueDOBExampleDOBsDataID.x[1]) == as.character(DOBsData.csv$DOBsDataID),]
dob1118$DOB

rax = ratioWithAll1118[as.character(r1118$DOBsDataID) == ratioWithAll1118$DOBsDataID,]

calDOB(rax,10)


ra1 = ratiosExample
as.character(ra1$RatioID)

dobresults = calDOB(ra1,10)


as.character( ratiosExample$DOBsDataID )
as.character( ra1$DOBsDataID )




#-----------------------------------------------------------------------------------------------




#Rat = RatiosData.csvPart[as.character(RatiosData.csvPart$DOBsDataID) == "DOBsData_1118_2_1_ID",]
#Rat1  = RatiosData.csv[as.character(RatiosData.csv$RatioID) %in% as.character(Rat$RatioID),]
#g = as.numeric(as.POSIXct(as.character(Rat1$lockCell),format = "%d/%m/%Y %H:%M:%S"))
#g- g[1]

dfWithDOB  = merge(RatiosData.csvPart,dff)
dfWithDOB = merge(dfWithDOB,DOBsData.csvPart) 


#3colnames(DOBsData.csv )
#colnames(df )
#colnames(dfWithDOB )


AZ_Data.csvpart = AZ_Data.csv[,c("N12Avg","N13Avg", "AzID")]
dfWithDOBWithAutozero = merge(dfWithDOB,AZ_Data.csvpart) 

#colnames(dfWithDOBWithAutozero)


ratioWithAll  = merge(dfWithDOBWithAutozero,CalibrationsDataFromMpba.csv)
#write.csv(ratioWithAll,"C:/WorkingData/ratioWithAll.csv")

#colnames(ratioWithAll)

#ratios <- split(ratioWithAll,ratioWithAll$DOBsDataID)


DOBsDataIDs = unique(ratioWithAll[,"DOBsDataID"])
arrayDOb = NULL
for(DO in  DOBsDataIDs ){ 

    ra1 = ratioWithAll[DO == ratioWithAll[,"DOBsDataID",],]
    arrayDOb = rbind(arrayDOb,c(calDOB(ra1,10), as.character(ra1$DOBsDataID[1]) ))
    
}


arrayDOb = arrayDOb[1:500,]

hist(as.numeric(arrayDOb[,1]),100)

arrayDOb = data.frame(Dobv = arrayDOb[,1],DOBsDataID = arrayDOb[,2])

orignalDOB = NULL
for( dobid in arrayDOb$DOBsDataID)
{
  
  orignalDOB = c(orignalDOB,DOBsData.csv$DOB[as.character( DOBsData.csv$DOBsDataID ) == dobid])
  
}

arrayDOb = cbind(arrayDOb,orignalDOB)

hist(orignalDOB,100)


hist(as.numeric(arrayDOb$Dobv))

apply(ra1[ ,paste0("I12_.",(22-le):22) ],1,mean) - apply(ra1[ ,paste0("I13_.",(22-le):22) ],1,mean)


ra2 = ra1[,paste0("I12_.",1:22)]
ra3 = ra2[],(22-le) : 22] 

if(FALSE){
  
  ra2  = ra1[,paste0("I12_.",1:22)]
  
  for(i in 1:dim(ra2)[1]){
    
    sind = min(which(ra2[i,] != 0))
    ra3 = ra2[sind,length(ra2[i,])]
    
  }
  
  ra4  = ra1[,paste0("I13_.",1:22)]
  
  for(i in 1:dim(ra2)[1]){
    
    sind = min(which(ra4[i,] != 0))
    ra5 = ra4[sind,length(ra4[i,])]
    
  }
}











####End----------------  End----------------End----------------End----------------End----------------End----------------End----------------End----------------
  
  testsNum = spi$TestNumber.x
  tno = 0
  for(tn  in  testsNum){
    #tn = testsNum[1]
    if(tn !=tno)
      fn = paste0(pathOu,"OU_",tn,".csv")
      if(file.exists(fn) ){
        f_ou_data = read.csv(fn,header = F)
        tno  = tn
        POSIXct_time = as.POSIXct(as.character(f_ou_data$Time),format = "%d/%m/%Y %H:%M:%S")
        ortime = order(POSIXct_time)
        POSIXct_time = POSIXct_time[ortime]
        f_ou_dataOR = f_ou_data[ortime,]
      }
    
      tstartIndex = findInterval(tstart,POSIXct_time)
      tendIndex = findInterval(tend,POSIXct_time)
      rangeIndex = cbind(tstartIndex,tendIndex)
      
      
  }
  
  
  
  
  
  
  
  fn = paste0(WorkinOU,"OU_",spi$DeviceNumber.x[1],".csv")
  if(file.exists(fn) ){
    f_ou_data = read.csv(fn,header = T)
    POSIXct_time = as.POSIXct(as.character(f_ou_data$Time),format = "%d/%m/%Y %H:%M:%S")
    ortime = order(POSIXct_time)
    POSIXct_time = POSIXct_time[ortime]
    tstartIndex = findInterval(tstart,POSIXct_time)
    tendIndex = findInterval(tend,POSIXct_time)
    f_ou_dataOR = f_ou_data[ortime,]
    rangeIndex = cbind(tstartIndex,tendIndex)
    nu = c(nu ,dim(rangeIndex)[1])
    
    for(i in 1:dim(rangeIndex)[1]){
      bu12 = f_ou_dataOR$I12[rangeIndex[i,1]:rangeIndex[i,2]]
      le = length(bu12)
      bu12 = c(rep(0,22 - le),bu12)
      
      bu13 = f_ou_dataOR$I13[rangeIndex[i,1]:rangeIndex[i,2]]
      le = length(bu13)
      bu13 = c(rep(0,22 - le),bu13)

      buff12 = rbind(buff12,bu12)
      buff13 = rbind(buff13,bu13)
      spiRatioID = c(spiRatioID,spi$RatioID[i])
    }
    
  }
  else{
      
      bu1 = c(bu1,spi$DeviceNumber.x[1])
    
  }
}  



df = data.frame(RatioID = as.character(spiRatioID),I12_ = buff12,I13_ = buff12)
View(df)
write.csv(df,paste0(WorkinDir,"RatioWithSignals.csv"))



#merge Data---------

#merge Time in DOBsdata
#DOBsData.csv <-  merge(DOBsData.csv,DOBTimes_Data.csv,by = c("DeviceNumber", "TestNumber", "DobNum" ))

RatiosDataInf.csv <-  merge(RatiosData.csv,RatioTimes_Data.csv,by = c("RatioID" ))
DOBsData1 = DOBsData.csv[,c("DOBsDataID","DOB")]
DOBsDataRatiosDataInf <-  merge(DOBsData1,RatiosDataInf.csv,by = c("DOBsDataID"))
View(DOBsDataRatiosDataInf)



#insert DOBID to DOBsDataID
#cl  = c(colnames(RatiosData.csv) , "DOBsDataID","IsValid" )
DOBsDatwithRatios <-  merge(DOBsData.csv,RatiosDataInf.csv,by = c("DeviceNumber", "TestNumber", "DobNum" ))

colnames(DOBsData.csv)

#head(DOBsDatwithRatios)
RatiosData.csv  <- cbind(RatiosData.csv,DOBsDatwithRatios$DOBsDataID,DOBsDatwithRatios$IsValid )
colnames(RatiosData.csv) <- cl 


#run Example
DOBinf = DOBsData.csv[,c("DOBsDataID","DOB")]
Rb <-  merge(x = RatiosData.csv,y = DOBinf,by = c("DOBsDataID"))
#rb1 = Rb[Rb$DOBsDataID == DOBsData.csv$DOBsDataID[1],]
write.csv(Rb,"C:/Temp/Rb1.csv")
Rb = Rb[Rb$IsValid == "True",]


Rb  = read.csv("C:/Temp/Rb1.csv",nrows = 2,header = T)
cl = colnames(Rb)

Rb  = read.csv("C:/Temp/Rb1.csv",skip = 2e3,nrows = 1e3,header = F)
Rb  = read.csv("C:/Temp/Rb1.csv",nrows = 1001,header = F)
colnames(Rb) <- cl
Rb = Rb[Rb$IsValid == "True",]

Rb = DOBsDataRatiosDataInf[1:1000,]
dim(DOBsDataRatiosDataInf)
li = NULL
uID = unique(DOBsDataRatiosDataInf$DOBsDataID)[1:300]
numberofRatioPerMeasurment = 5






for(di in uID){
  #di = uID[1]
  Rbx = Rb[Rb$DOBsDataID == di,]
  DeviceN = unique(as.character(Rbx$DeviceNumber.x))
  TestN  = as.character(Rbx$TestNumber.x)[1]
  DOBv  = Rbx$DOB[1]
  fn = paste0(WorkinOU,"OU_",DeviceN,".csv")
  if(file.exists(fn) ){
    f_ou_data = read.csv(fn,header = T)
    f_ou_dataTest = f_ou_data[f_ou_data["Test.Number"] == TestN,]
    POSIXct_time = as.POSIXct(as.character(f_ou_dataTest$Time),format = "%d/%m/%Y %H:%M:%S")
    POSIXct_lock_time = as.POSIXct(as.character(Rbx$lockCell),format = "%d/%m/%Y %H:%M:%S")
    POSIXct_meausred_time  = as.POSIXct(Rbx$MeasureEnd,format = "%d/%m/%Y %H:%M:%S")
    dilock = findInterval(POSIXct_lock_time,POSIXct_time)
    dimeau = findInterval(POSIXct_meausred_time,POSIXct_time)
    rangeInd = cbind( dilock, dimeau )
    newrerow = NULL
    for(i in 1:dim(rangeInd)[1]){
      i12i13 = f_ou_dataTest[rangeInd[i,1]:rangeInd[i,2],c( "I12", "I13" )]
      mec = apply(i12i13,2,mean)
      meansv =  (matrix(rep(mec,each = dim(i12i13)[1]),,2))
      i12i13n  = (i12i13 - meansv )
      i12i13n = c(i12i13n[,1],i12i13n[,2]) #length(i12i13n)
      newrerow  = c(newrerow,i12i13n)
      
    }
    
    newrerow = c(newrerow,DOBv)
  }
 
  li = rbind(li,newrerow) 
}  
  
dim(li)




write.csv(li,"X:/RD/Team Members/Mor/Data/li.csv")
write.csv(DOBsDataRatiosDataInf,"X:/RD/Team Members/Mor/Data/DOBsDataRatiosDataInf.csv")

le = dim(li)[1]
se = dim(li)[2]
li1 = li 
colN = c(paste0("V",1:(se-1)),"DOB")


  
colnames(li) <- colN
lidb <- as.data.frame(li,row.names = F)

hist(lidb$DOB,100)


trainInd = sample(1:le , 0.7*le )
train = lidb[trainInd,]
test = lidb[-trainInd,]


getpointsdat <-function(rb1){
  
  #rb1 = sp[[1]]
  fbs = NULL
  newrerow = NULL
  
  DeviceN = unique(rb1$DeviceNumber)
  TestN  = unique(rb1$TestNumber)
  DobN  = rb1$DobN[1]
  #rb1$IsValid[1] == True
  
  
  fn = paste0(WorkinOU,"OU_",DeviceN,".csv")
  if(file.exists(fn) ){
    f_ou_data = read.csv(fn,header = T)
    f_ou_dataTest = f_ou_data[f_ou_data["Test.Number"] == TestN,]
    
    
    
    #as.POSIXct_lock_time  = as.POSIXct(rb1[,"lockCell"],format = "%d/%m/%Y %H:%M:%S")
    ind = (((DobN-1)*5 + 1 ):(DobN * 5))
    POSIXct_lock_time = as.POSIXct(as.character(rb1$lockCell),format = "%d/%m/%Y %H:%M:%S")
    if ( length(POSIXct_lock_time) == 5 ){
      POSIXct_meausred_time  = as.POSIXct(rb1$MeasureEnd,format = "%d/%m/%Y %H:%M:%S")
      
      POSIXct_time = as.POSIXct(f_ou_dataTest[,"Time"], format = "%d/%m/%Y %H:%M:%S")
      #as.POSIXct_meausred_time  = as.POSIXct(rb1[,"MeasureEnd"],format = "%d/%m/%Y %H:%M:%S")
      dilock = findInterval(POSIXct_lock_time,POSIXct_time)
      dimeau = findInterval(POSIXct_meausred_time,POSIXct_time)
      
      rangeInd = cbind( dilock, dimeau )
    
      #TestData
      if ( !is.null(dim(rangeInd))){
        for(i in 1:dim(rangeInd)[1]){
        
          i12i13 = f_ou_dataTest[rangeInd[i,1]:rangeInd[i,2],c( "I12", "I13" )] #dim(i12i13n)
          mec = apply(i12i13,2,mean)
          meansv =  (matrix(rep(mec,each = dim(i12i13)[1]),,2))
          #plot((i12i13- meansv)[,1])
          i12i13n  = (i12i13 - meansv )
          i12i13n = c(i12i13n[,1],i12i13n[,2]) #length(i12i13n)
          newrerow  = c(newrerow,i12i13n)
        
        }
      
        newrerow  = c(newrerow,rb1$DOB[1])
      }
      
      print(paste0(DeviceN,"_",TestN,"_",DobN))
      
    }
  
    
  }else{
    
    fbs = c(fbs,fn)
  }
  
  list(da = newrerow,missingFiles = fbs)
}

#---

PatientTestsData$AzID <- as.character(PatientTestsData$AzID)
#Connect IDs---------

#insert AzID to Patientdata----
#dv = 1141

udv = unique(PatientTestsData$DeviceNumber)
udv = udv[udv != 0]
for(dv in udv)){
  
  dv  = udv[1]
  pa = PatientTestsData[PatientTestsData$DeviceNumber == dv,]
  pa <- pa[order(pa$stStartTime),]
  Sy = AZ_Data.csv[AZ_Data.csv$Device.Number == dv,]
  Sy <- Sy[order(Sy$sLockCellTime),]
  if ((dim(Sy)[1] != 0 ) & (dim(pa)[1] != 0 )){
    id = findInterval(pa$stStartTime,Sy$sLockCellTime)
    id  = ifelse(id == 0,1,id )
    pa[,"AzID"] = Sy$AzID[id]
  }
  
  
  
  ff = data.frame(TestID = pa$TestID,AzID = pa$AzID)
  PatientTestsData <- merge(x = PatientTestsData,y = ff,by = "TestID", all.x = TRUE)
  PatientTestsData[PatientTestsData$DeviceNumber == dv,"AzID.x"]  =  as.character(PatientTestsData[PatientTestsData$DeviceNumber == dv,"AzID.y"])
  PatientTestsData[,"AzID.y"] <-  NULL
  colnames(PatientTestsData)[which(names(PatientTestsData) == "AzID.x")] <- "AzID"
  
} 




#insert SystemTestID to Patientdata----
for(dv in unique(PatientTestsData$DeviceNumber)){
  
  pa = PatientTestsData[PatientTestsData$DeviceNumber == dv,]
  pa <- pa[order(pa$stStartTime),]
  Sy = SystemTestsData.csv[SystemTestsData.csv$DeviceNumber == dv,]
  Sy <- Sy[order(Sy$stStartTime),]
  if ((dim(Sy)[1] != 0 ) & (dim(pa)[1] != 0 )){
    id = findInterval(pa$stStartTime,Sy$stStartTime)
    id  = ifelse(id == 0,1,id )
    pa[,"SystemTestID"] = Sy$SystemTestID[id]
  }
  
  
  
  ff = data.frame(TestID = pa$TestID,SystemTestID = pa$SystemTestID)
  PatientTestsData <- merge(x = PatientTestsData,y = ff,by = "TestID", all.x = TRUE)
  PatientTestsData[PatientTestsData$DeviceNumber == dv,"SystemTestID.x"]  =  as.character(PatientTestsData[PatientTestsData$DeviceNumber == dv,"SystemTestID.y"])
  PatientTestsData[,"SystemTestID.y"] <-  NULL
  colnames(PatientTestsData)[which(names(PatientTestsData) == "SystemTestID.x")] <- "SystemTestID"
  
} 

#-------------------- 


if(FALSE){



files = dir(filepath,full.names = T)

files = dir(filepath,full.names = T)
file = dir(filepath,full.names = F)

CalibrationData <- read.csv(files[1],header = T)
CalibrationData = within(CalibrationData,CalibrationID <- paste0(DeviceNumber,"_",TestNumber) )

#Function---- 

getCal <- function(x) { 
  sle = x  >  SystemTestsData.csv$stStartTime
  if ( sum(sle) > 0 ){
    out  = min(which(sle))  - 1 
  } else {
    
    out = -1
  }
  if (out == 0 ) out = 1
  
  SystemTestsData.csv$SystemTestID[out]
}

preWarmID <- function(WarmUpsData.csv1){
  paste0(as.character("WarmUp",WarmUpsData.csv1["Device.Number"]),"_",gsub("-","_",gsub(" ","_",gsub(":","_",WarmUpsData.csv1["sEnd"]))),"ID")
}

preAutoZeroID <- function(AutoZerData.csv1){
  paste0("AutoZero_",as.character(AutoZerData.csv1["Device.Number"]),"_",gsub("-","_",gsub(" ","_",gsub(":","_",AutoZerData.csv1["AZFlashTime"]$AZFlashTime))),"ID")
}


as.character((AutoZerData.csv1["AZFlashTime"])
gsub(":","_",as.character(AutoZerData.csv1["AZFlashTime"]))

#----

#DOB data----

DOBsdata <- read.csv(files[2],header = T)
DOBsdata = within(DOBsdata,DOBID <- paste0(DeviceNumber,"_",TestNumber,"_",DobIndex))
DOBsdata = within(DOBsdata,TestID <- paste0(DeviceNumber,"_",TestNumber))
DOBsdata[,c("DeviceNumber","TestNumber")] = NULL
#----

meregeTests = merge(PatientTestsData,DOBsdata,by = "TestID")
meregeTests = merge(meregeTests[meregeTests$TestID == "1112_19",],FillBagsData,by  = "DOBID" )

length(colnames(meregeTests))

meregeTests1 = merge(meregeTests,RatiosData.csv,by  = "DOBID" )


#example Get ration from test----
sel = unlist(sapply(meregeTests1$RatioID,function(x){(str_split(x,"_")[[1]])[3]})) == "0"
sel1 = unlist(sapply(meregeTests1$RatioID,function(x){(str_split(x,"_")[[1]])[3]})) == "1"
mean(meregeTests1[sel,]$Ratio)
mean(meregeTests1[sel1,]$Ratio)
hist(meregeTests1[meregeTests1$RatioIndex == 1,]$Ratio)

RatiosData.csv[RatiosData.csv$DOBID %in% meregeTests$DOBID,]










WarmUpsData.csv$WarmUpID <- apply(WarmUpsData.csv,1,preWarmID)


colnames(WarmUpsData.csv)








#prepare location for SystemID and WarmupID
PatientTestsData = within(PatientTestsData,SystemTestID <- rep("NA",dim(PatientTestsData)[1]))
PatientTestsData = within(PatientTestsData,WarmUpID <- rep("NA",dim(PatientTestsData)[1]))



df = data.frame(PatientTestsData$stStartTime)
unique (sapply( df$PatientTestsData.stStartTime,getCal ))

PatientWithSystemTest <-unique(PatientTestsData$DeviceNumber[unique(PatientTestsData$DeviceNumber) %in% unique(SystemTestsData.csv$DeviceNumber)])


selP =  PatientTestsData$DeviceNumber %in% PatientWithSystemTest

PatientTestsData[selP,]

#Ratio ----
assign(file[5], read.csv(files[5],header = T))
dim(RatiosData.csv)
colnames(RatiosData.csv)
RatiosData.csv = within(RatiosData.csv,RatioID <- paste0(DeviceNumber,"_",TestNumber,"_",DobIndex,"_",RatioIndex))
RatiosData.csv = within(RatiosData.csv,DOBID <- paste0(DeviceNumber,"_",TestNumber,"_",DobIndex))
RatiosData.csv = within(RatiosData.csv,TestID <- paste0(DeviceNumber,"_",TestNumber))
RatiosData.csv[,c("DeviceNumber","TestNumber","DobIndex")] = NULL
#----


#SystemTests Data ---- 

colnames(SystemTestsData.csv)
#----

#create SystemTestID
SystemTestsData.csv = within (SystemTestsData.csv, stStartTime <- strptime( as.character(StartTime), "%d/%m/%Y %H:%M:%S" ) )
SystemTestsData.csv = within(SystemTestsData.csv,SystemTestID <- paste0("N_",DeviceNumber,"_",TestNumber,"_",stStartTime,"_ID"))
SystemTestsData.csv = within(SystemTestsData.csv,SystemTestID <- gsub("-","_",gsub(" ","_",gsub(":","_",SystemTestID))))
#SystemTestsData.csv = within (SystemTestsData.csv, SystemTestID <- paste0(DeviceNumber,"_",TestNumber) )

df = with(SystemTestsData.csv,data.frame(cbind(SystemTestID,startTime)))


#WarmUps Data ----------------------------------------------------------

#load Data

WarmUpsDataFilePath  = paste0(WorkinDir,"WarmUpsData.csv")
WarmUpsData.csv = read.csv(WarmUpsDataFilePath,header = T)

#create warmID----
WarmUpsData.csv <- within(WarmUpsData.csv,sEnd <- strptime(as.character(End), "%d/%m/%Y %H:%M:%S" ) )
WarmUpsData.csv$WarmUpID <- apply(WarmUpsData.csv,1,preWarmID)

#-----


#Autozero----------------

colnames(AZ_Data.csv)
AZ_Data.csv = read.csv("X:/RD/Team Members/Mor/Data/TestResultsCsv/AZ_Data.csv",header = T)
AZ_Data.csv <- within(AZ_Data.csv,AZFlashTime <- strptime(as.character(AZ.Flash.Time), "%d/%m/%Y %H:%M:%S" ) )
AZ_Data.csv$AZDataID <- apply(AZ_Data.csv,1,preAutoZeroID)





#--------


length(unique(WarmUpsData.csv$Device.Number))/length(unique(PatientTestsData$DeviceNumber))

#WORKING sAPCE

#insert SystemTestID to Patientdata----

for(dv in unique(PatientTestsData$DeviceNumber)){
  
  pa = PatientTestsData[PatientTestsData$DeviceNumber == dv,]
  pa <- pa[order(pa$stStartTime),]
  Sy = SystemTestsData.csv[SystemTestsData.csv$DeviceNumber == dv,]
  Sy <- Sy[order(Sy$stStartTime),]
  if ((length(Sy) != 0 ) & (length(pa) != 0 )){
    
      id = findInterval(pa$stStartTime,Sy$stStartTime)
      id  = ifelse(id == 0,1,id )
      pa[,"SystemTestID"] = Sy$SystemTestID[id]
  }
  
  ff = data.frame(TestID = pa$TestID,SystemTestID = pa$SystemTestID)
  PatientTestsData <- merge(x = PatientTestsData,y = ff,by = "TestID", all.x = TRUE)
  PatientTestsData[PatientTestsData$DeviceNumber == dv,"SystemTestID.x"]  =  as.character(PatientTestsData[PatientTestsData$DeviceNumber == dv,"SystemTestID.y"])
  PatientTestsData[,"SystemTestID.y"] <-  NULL
  colnames(PatientTestsData)[which(names(PatientTestsData) == "SystemTestID.x")] <- "SystemTestID"

} 


#insert AutozeroID to Patientdata----

for(dv in unique(PatientTestsData$DeviceNumber)){
  
  pa = PatientTestsData[PatientTestsData$DeviceNumber == dv,]
  pa <- pa[order(pa$stStartTime),]
  Sy = AZ_Data.csv[SystemTestsData.csv$DeviceNumber == dv,]
  Sy <- Sy[order(Sy$stStartTime),]
  if ((length(Sy) != 0 ) & (length(pa) != 0 )){
    
    id = findInterval(pa$stStartTime,Sy$stStartTime)
    id  = ifelse(id == 0,1,id )
    pa[,"SystemTestID"] = Sy$SystemTestID[id]
  }
  
  ff = data.frame(TestID = pa$TestID,SystemTestID = pa$SystemTestID)
  PatientTestsData <- merge(x = PatientTestsData,y = ff,by = "TestID", all.x = TRUE)
  PatientTestsData[PatientTestsData$DeviceNumber == dv,"SystemTestID.x"]  =  as.character(PatientTestsData[PatientTestsData$DeviceNumber == dv,"SystemTestID.y"])
  PatientTestsData[,"SystemTestID.y"] <-  NULL
  colnames(PatientTestsData)[which(names(PatientTestsData) == "SystemTestID.x")] <- "SystemTestID"
  
} 



#insert WarmupID to Patientdata----
undv = unique(PatientTestsData$DeviceNumber)
undv = undv[undv != 0]
#dv  = undv[1:2]

for(dv in undv){
  
  pa = PatientTestsData[PatientTestsData$DeviceNumber == dv,] #View(pa)
  pa <- pa[order(pa$stStartTime),]
  Sy = WarmUpsData.csv[WarmUpsData.csv$Device.Number == dv,]
  Sy <- Sy[order(Sy$sEnd),]
  if ((length(Sy) != 0 ) & (length(pa) != 0 )){
    
    id = findInterval(pa$stStartTime,Sy$sEnd)
    id  = ifelse(id == 0,1,id )
    pa[,"WarmUpID"] = Sy$WarmUpID[id]
  }
  
  ff = data.frame(TestID = pa$TestID,WarmUpID = pa$WarmUpID)
  PatientTestsData <- merge(x = PatientTestsData,y = ff,by = "TestID", all.x = TRUE)
  PatientTestsData[PatientTestsData$DeviceNumber == dv,"WarmUpID.x"]  =  
                   as.character(PatientTestsData[PatientTestsData$DeviceNumber == dv,"WarmUpID.y"])
  PatientTestsData[,"WarmUpID.y"] <-  NULL
  colnames(PatientTestsData)[which(names(PatientTestsData) == "WarmUpID.x")] <- "WarmUpID"
  
} 





#Working Examples
wa = WarmUpsData.csv[WarmUpsData.csv$WarmUpID  %in% PatientTestsData[PatientTestsData$DeviceNumber %in% c(1051),"WarmUpID"],c("sEnd","Duration.min.")]


sum(is.na(PatientTestsData$WarmUpID))/dim(PatientTestsData)[1]

wa

plot(wa[order(wa$sEnd),"Duration.min."])


colnames(WarmUpsData.csv)

hist(wa$Duration.min.)
#----

PatientTestsData$WarmUpID


const {{ T1 = true; F1 = false; }}

PatientTestsData[,c("WarmUpID","TestID")]

PatientTestsData[PatientTestsData$TestID == "1112_85",c("WarmUpID","TestID")]




}