data = read.delim("clipboard",header = TRUE,stringsAsFactors = FALSE)
dim(data)
as.character(data$Pt)
data = data.frame(data)

colnames(data)

#"Pt","FINAL.HVPG"
dataTest = data[,c("Pt","FINAL.HVPG","PDRdivPDRfitLength.30","Platelets.Clean","Creatinine","GGT")]

dataTest[,3:6] <- sapply(dataTest[,3:6],as.numeric) 

for(i in 3:ncol(dataTest)){
  dataTest[is.na(dataTest[,i]), i] <- mean(dataTest[,i], na.rm = TRUE)
}

dataTest$Result10 <- as.factor(ifelse(as.numeric(dataTest[,"FINAL.HVPG"]) >= 10,1,0))

dataTest = dataTest[!is.na(dataTest$Result10),]

Pt <- as.character(dataTest$Pt)

dataTestF = dataTest[(!(Pt %in%  as.character(data135$Pt))),]

dataTestF = dataTestF[!is.na(dataTestF$Result10),]

dim(dataTestF)


if(0){

write.csv(dataTest,"C:/Temp/data192.csv")

colnames(data)

str(data)

write.csv(data,"C:/Temp/data192.csv")

colnames(data)

data = read.csv("C:/Temp/data192.csv",header = TRUE , stringsAsFactors = FALSE,sep =",",na.strings = c("N/A","VALUE!"))

datas = data.frame(data[,c("Platelets.Clean","LengthPDRdivCPDR.30","INR", "FINAL.HVPG" )])

str(datas)

datas[,4] = as.numeric(datas[,4])

for(i in 1:ncol(datas)){
  datas[is.na(datas[,i]), i] <- mean(datas[,i], na.rm = TRUE)
}

ds <-datas[1:135,]

ds$result <- factor(ifelse(ds$FINAL.HVPG >= 10,1,0))

ds = data.frame(ds[,c("Platelets.Clean","LengthPDRdivCPDR.30","INR", "result" )])





library(randomForest)

rf = randomForest(result ~ . ,data = ds,ntree = 1000,mtry = 2)

rf$confusion

}