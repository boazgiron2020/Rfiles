library("mosaic", lib.loc="C:/Program Files/R/R-3.1.3/library")
BasicDir = "W:/PUBage/OfirExperiment/NewPUBags/"
DeviceDirs = c("Device1","Device1008","Device1064")
DeviceTypes =c("co2_25","co2_4","co2_5")

paths =c()
Alldata = c()
for(i in 1:3){
  for(j in 1:3){
    currenPath  = paste0(BasicDir,DeviceDirs[i],"/",DeviceTypes[j],"/Results.csv")
    currenPath
    paths = c(paths,currenPath)
    CurrentFileData  = read.csv(currenPath)
    CurrentFileData$Device <- DeviceDirs[i]
    CurrentFileData$TestType <- DeviceTypes[j]
    Alldata <-rbind(Alldata,CurrentFileData)
  }
}
currenPath  = paste0(BasicDir,DeviceDirs[3],"/",DeviceTypes[1],"/Results.csv")



#write.csv(Alldata,"W:/PUBage/OfirExperiment/NewPUBags/AllResult.csv" )
Alldata<-read.csv("W:/PUBage/OfirExperiment/NewPUBags/AllResult.csv",header = TRUE )

dim(Alldata)
dim(CurrentFileData)
View(Alldata)
#===========================================================================

Alldata$Point <-factor(Alldata$Point)
Alldata$TestType <-factor(Alldata$TestType)
Alldata$M1.C12 <-as.numeric(as.character(Alldata$M1.C12)) 
Alldata$M2.C12 <-as.numeric(as.character(Alldata$M2.C12)) 
Alldata$M3.C12 <-as.numeric(as.character(Alldata$M3.C12))
Alldata$M4.C12 <-as.numeric(as.character(Alldata$M4.C12))
Alldata$M5.C12 <-as.numeric(as.character(Alldata$M5.C12))
Alldata$M1.Ratio <-as.numeric(as.character(Alldata$M1.Ratio)) 
Alldata$M2.Ratio <-as.numeric(as.character(Alldata$M2.Ratio)) 
Alldata$M3.Ratio <-as.numeric(as.character(Alldata$M3.Ratio))
Alldata$M4.Ratio <-as.numeric(as.character(Alldata$M4.Ratio))
Alldata$M5.Ratio <-as.numeric(as.character(Alldata$M5.Ratio))
Alldata$M1.Ratio.Std <-as.numeric(as.character(Alldata$M1.Ratio.Std)) 
Alldata$M2.Ratio.Std <-as.numeric(as.character(Alldata$M2.Ratio.Std))
Alldata$M3.Ratio.Std <-as.numeric(as.character(Alldata$M3.Ratio.Std))
Alldata$M4.Ratio.Std <-as.numeric(as.character(Alldata$M4.Ratio.Std))
Alldata$M5.Ratio.Std <-as.numeric(as.character(Alldata$M5.Ratio.Std))
str(AlldataA)

names(Alldata)


attach(Alldata)

#str(AlldataA$sel)

#Alldata <-within(AlldataA,selV <-  ( M1.C12 - M3.C12)   )
#Alldata <-within(AlldataA,sel <-  ( ( M1.C12 - M3.C12) < -0.0025 )   )

bwplot(DOB ~ Device,data = AlldataA,main ="Device1,1008,1064 DOBs")
plot(DOB ~ Device,data = AlldataA)



plot(DOB ~ TestType,data = Alldata)


A <-split(AlldataA,list(Device,Point))

length(A)

sr <-sapply(A,function(x){ mean(x$selV,na.rm = TRUE)} )

sr["Device1.2"]

srr <-as.data.frame(list(Name = names(sr),Values = sr ))

srr$Name  = NULL


tm <-names(sr)
sr <- sr
colnames(sr) = NULL

srr <-cbind(tm,sr)

length(sr)


mean(A[[1]]$selV)


names(AdA)

Ad1 <- Alldata[Device == "Device1",]
Ad2 <- Alldata[Device != "Device1",]

AdA <- AlldataA[Device == "Device1",]

sum(Device == "Device")

r1 <-hist(( Ad1$M1.C12 - Ad1$M3.C12),freq=TRUE,100,main = "Baseline Concentration different",xlab = "M1 M3 Concentration Diff",col  = 1,xmin = c(-0.2,0.2),add = TRUE)
r2 <-hist(( Ad2$M1.C12 - Ad2$M3.C12),freq=TRUE,100,main = "Baseline Concentration different",xlab = "M1 M3 Concentration Diff",col  = 2,xlim =c(-0.01,0.005),ylim  = c(0,400))
cols = c(rgb(0,0,1,8/9),rgb(1,0,0,8/9))

plot(r2,col=cols[2],main = "Baseline Concentration different",xlab = "M1 M3 Concentration Diff",xlim =c(-0.01,0.005),ylim  = c(0,400))
plot(r1,col=cols[1],add=T)
legend("topright", c("Device1008And1064","Device1"), col=cols[2:1], lwd=10)

legend(-0.0075,300,c(???Device1008 and 1064???,???Device1???),lty=c(1,1),col=cols) 

str(A)

A <- as.data.frame(selV1  = AlldataA$selV)#,Device1  = factor(AlldataA$Device))#,sel1 = factor(AlldataA$sel))


A <- as.data.frame(list( selV1 = AlldataA$selV,DeviceT =  factor(AlldataA$Device) ,sel1 <- AlldataA$sel))

AA <- within(A,DeviceT <- factor(DeviceT),sel1 <- factor(sel1) ) 

str(AA)
table(AA,sel1)

hist(Alldata$DOB,100)
text(-1.5,200,paste0("Mean = ",round(mean(Alldata$DOB),2)))
text(-1.5,150,paste0("STD = ",round(sd(Alldata$DOB),2)))


bwplot(DOB ~ Point,data = Alldata, xlab = "Point",main ="Device1,1008,1064 DOBs")
bwplot(DOB ~ Point | Device,data = Alldata, xlab = "Point",main ="Device1,1008,1064 DOBs")




tablere  = table(Alldata$Point)
sum(Alldata$Point == 4)/sum(Alldata$Point == 1)

meanDOBvsPoint = mean(DOB ~ Point , data = Alldata)
stdDOBvsPoint = sd(DOB ~ Point , data = Alldata)
plot(1:5,meanDOBvsPoint,pch = 19,cex = 2,xlab ="Point",ylab= "DOBs",main= "DOb Mean Vs Points")
plot(1:5,stdDOBvsPoint,pch = 19,cex = 2,xlab ="Point",ylab= "stdDOBs",main= "sdtDObs Vs Points")
plot(1:length(meanDOBvsPoint),meanDOBvsPoint,"b",main = "Mean Vs Point")
plot(1:length(meanDOBvsPoint),stdDOBvsPoint,"b",main = "STD Vs Point")



bwplot( ( M2.C12 - M4.C12 )  ~ Point,data = Alldata, xlab = "Point",main ="Alldata Diff M2 M4 Concentration")
bwplot( ( M1.C12 - M3.C12 )  ~ Point,data = Alldata, xlab = "Point",main ="Alldata Diff M1 M3 Concentration")
bwplot( ( M3.C12 - M5.C12 )  ~ Point,data = Alldata, xlab = "Point",main ="Alldata Diff M3 M5 Concentration")

bwplot( 1000*( M2.Ratio - M4.Ratio )  ~ Point,data = Alldata, xlab = "Point",main ="Alldata Diff M2 M4 Ratio",ylim = c(-5,5))
bwplot( 1000*( M1.Ratio - M3.Ratio )  ~ Point,data = Alldata, xlab = "Point",main ="Alldata Diff M1 M3 Ratio",,ylim = c(-5,5))
bwplot( 1000*( M3.Ratio - M5.Ratio )  ~ Point,data = Alldata, xlab = "Point",main ="Alldata Diff M3 M5 Ratio")



#check Change inthe concentration M1 M3
g <-factor( (Alldata$M1.C12 - Alldata$M3.C12) < -0.0025)
l <- split(Alldata,g)
lapply(l,function(x){mean(DOB ~ Point,data = x)} )

ax <-l[[2]]
rem <-mean((M1.C12 - M3.C12) ~ Point+Device,data = ax )
re <-mean(ax$DOB ~ ax$Point,na.rm = TRUE)

rem  = matrix(rem,5,3)
rownames(rem) <- paste0("Point",1:5)
colnames(rem) <- paste0("Device",c(1,1008,1064))

bwplot((M1.C12 - M3.C12) ~ Point | Device,data = ax, xlab = "Point",main ="Device1,1008,1064 DOBs")

str(ax$DOB) <- factor(as.numeric(ax$Point)) 

?within

re <-hist(( Alldata$M2.C12 - Alldata$M4.C12),freq=TRUE,50,main = "Sample Concentration different",xlab = "M2 M4 Concentration Diff")
re <-hist(( Alldata$M1.C12 - Alldata$M3.C12),freq=TRUE,50,main = "Baseline Concentration different",xlab = "M1 M3 Concentration Diff")
re <-hist(( Alldata$M3.C12 - Alldata$M5.C12),freq=TRUE,50,main = "Baseline Concentration different",xlab = "M3 M5 Concentration Diff")
dc = Alldata$M2.C12 - Alldata$M4.C12
plot(dc,Alldata$DOB,main = "DOB vs M2-M4 concentration different ",xlab  ="M2-M4",ylab ="DOBs",pch =19,cex =0.1,xlim =c(-0.005,0.015))  

dc1 = Alldata$M1.C12 - Alldata$M3.C12
plot(dc1,Alldata$DOB,main = "DOB vs M1-M3 concentration different ",xlab  ="M1-M3",ylab ="DOBs",pch =19,cex =0.1,xlim =c(-0.005,0.005),ylim =c(-1.5,1.5))  

 
bwplot( M3.Ratio.Std ~ Point,data = Alldata, xlab = "Point",main ="Alldata M3.Ratio.Std")
ttest13 = t.test(Alldata$M1.Ratio.Std-Alldata$M3.Ratio.Std)
bwplot( M5.Ratio.Std ~ Point,data = Alldata, xlab = "Point",main ="Alldata M5.Ratio.Std")
bwplot( M1.Ratio.Std ~ Point,data = Alldata, xlab = "Point",main ="Alldata M1.Ratio.Std")
ttest35  = t.test(Alldata$M5.Ratio.Std-Alldata$M3.Ratio.Std)
bwplot( M2.Ratio.Std ~ Point,data = Alldata, xlab = "Point",main ="Alldata M2.Ratio.Std")
bwplot( M4.Ratio.Std ~ Point,data = Alldata, xlab = "Point",main ="Alldata M4.Ratio.Std")

ttest42  = t.test(Alldata$M2.Ratio.Std-Alldata$M4.Ratio.Std)

