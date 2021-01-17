source( "X:/RD/Team Members/Boaz/Projects/tools/NewTools.R")
source( "X:/RD/Team Members/Boaz/Projects/tools/AbsorptionFit.R")

dirpath = "C:/Temp/tryZip2"
StringTrige = "Zero12  Zero13  I12 I13 Abs12   Abs13   C12 C13 Ratio"
String = "Correlation Results ="

ld = dir( dirpath ,full.names = T )
bu = NULL

for(ldi in ld){
  
  print( ldi )
  fl = dir(ldi, recursive = T,pattern = "logfile.txt",full.names = T)
  fl = fl[as.numeric(basename(dirname(fl))) >= 1e6]

  for(f in fl){ 
  
    print(f)  
    arrf = strsplit( f  , "/")[[1]]
    System = arrf[grepl("L2" , arrf )]
    Device = getNumFormString(arrf[grepl("Device" , arrf )])
    testnum = basename(dirname(f))
    
    re = findStringIndexInLog(f , StringTrige )
    
    if( !is.null(re) )
    {
      
      # numstring  = re$data[ ( re$rownum+1  ):( re$rownum + 5 ), ]$Message   
      # daArr  = t(sapply(numstring,getNumFormString) )
      # daArr = data.frame( daArr ,stringsAsFactors = F )
      # row.names(daArr) <- NULL
      # colnames(daArr) <- c( "Zero12",  "Zero13",  "I12", "I13", "Abs12",   "Abs13",   "C12", "C13" , "Ratio" )
      # yat13 = AbsorptionFit(as.numeric(daArr$C13),as.numeric(daArr$Abs13),200)
       
      HighCorrelationUndex = findStringIndexInLog(f , "High Correlation Results" )
      
      if( !is.null( HighCorrelationUndex$rownum ) ){
        
        HighCorrelationUValue = findStringInLog(f , "High Correlation Results" )
        s = HighCorrelationUValue$Message
        correaltionNum = getNumFormString( s)[1]
        startString = unlist(gregexpr(pattern = as.character( correaltionNum ), s ))
        correaltionNum = as.numeric( correaltionNum )
        correaltionNum = ifelse(trimws(substr( s,startString-2,startString-1)) =="-", -correaltionNum, correaltionNum    ) 
        da1 = HighCorrelationUndex$data[1:HighCorrelationUndex$rownum,]
        
      
        #df = data.frame( t(sapply(Absorptions,getNumFormString))[,c(2,4)],stringsAsFactors = F,row.names = NULL)
      
      
        C13  =  findStringInLog( da1 ,  "C13 =" )
        C13 = as.numeric( t(sapply(C13$Message,getNumFormString))[,4] )
      
        Absorptions =  findStringInLog( da1 ,  "Absorption12 =" )
        Abs12 = as.numeric( sub(",","", t(sapply(Absorptions$Message,getNumFormString))[,2] )  )
      
      
        Yat12 =  getNumFormString( findStringInLog( f ,  "Calibration calculated new YAT12 : " )$Message )[2:4]
        Yat12 = sub( "[()]" ,"" ,Yat12 ) 
        Yat12 = sub( "," ,"" ,Yat12 ) 
        Yat12 = as.numeric( Yat12 ) 
        C12 = getCon(Yat12, Abs12 )
        Ratios = C13/C12
        
        if(length( Ratios) == 5 ){
          
          rb = Ratios[c(1,3,5)]
          rs = Ratios[c(2,4)]
          x = c(1,3,5)
          y = rb
          model = lm( y ~ poly(x,2))
          
          #plot(x,y)
          inteBase = predict(model, newdata = data.frame(x = c(2,4 )) )
          DOB =  mean(1e3*(rs - inteBase)/inteBase)
          dc =   mean(C12[ c(2,4) ]) - mean(C12[ c(1,3,5) ])
          PostCorrealtion = DOB /  dc
        
        
        } else if(length( Ratios) == 3 ){
          
          
          rb = Ratios[c(1,3)]
          rs = Ratios[2]
          
          inteBase = mean( rb )
          DOB =  mean(1e3*( rs - inteBase )/ inteBase )
          dc =   C12[ 2 ] - mean(C12[ c(1,3) ])
          PostCorrealtion = DOB /  dc
          
        }
        
        g = getNumFormString( findStringInLog( f ,  "Post Calibration Dob Vs Concentration Correlation:" )$Message )
      
        #postcs = "Post Calibration Dob Vs Concentration Correlation: ResultType 0 , Slop / FSE -0.09795603 , P 0.5 , intercept  0.6499618 , Slop -0.0898601, DobRange 2.187043 "
        
        
        DataRange = as.numeric( g[length(g)] )
        Slop = as.numeric( sub(",","",g[length(g)-1] ) )
        
        bu = rbind( bu , c( System , Device , testnum ,  correaltionNum ,  Slop  , DataRange , PostCorrealtion ) )
      }
      
      #colnames(df) <- c("Abs12","Abs13")
      #C13 = getCon(yat13, as.numeric(df[,2]))
      #C13  =  findStringInLog( da1 ,  "C13 =" )
      #df = data.frame( t(sapply(Absorptions,getNumFormString))[,c(2,4)],stringsAsFactors = F,row.names = NULL)
      
    }
  }
  
  View(bu)
  
}

df1 = data.frame(bu,  stringsAsFactors = F )  



colnames(df1)  <- c("System", "Device","Test", "Triger Correlation","PostCalibratioSlop","PostCalibratioDeltaRange","PostCorrelation")
df1[,5] <- sapply(df1[,5],as.numeric)
df1$PostCorrelation <- round(df1$PostCorrelation ,2)  
df1$PostCalibratioDeltaRange <- round(df1$PostCalibratioDeltaRange ,2)
df1$PostCalibratioSlop <- round(df1$PostCalibratioSlop ,3)  
  
write.csv(df1,"X:/RD/Team Members/Boaz/Projects/CheckPostCalibrationCorrelation/PostCalibrationCorrelation.csv")

# correaltionNum = sub(",","",getNumFormString(re[1,2])[1])
# 
# startString = unlist(gregexpr(pattern = as.character( correaltionNum ), re[1,2] ))
# 
# #da = read.csv(f,header = T ,stringsAsFactors = F)
# correaltionNum = as.numeric( correaltionNum )
# correaltionNum = ifelse(trimws(substr( re[1,2],startString-2,startString-1)) =="-", -correaltionNum, correaltionNum    ) 
# 
# bu = rbind(bu ,c( System,Device,testnum, correaltionNum ) )
#     
# 
# b = abs( as.numeric(bu[,4])) > 16
# calibrationTeastnum <- as.numeric( bu[ b ,3 ]) 
# bu[ b , ]
# 
# 
# AbsorptionExample <- read.csv("X:/RD/Team Members/Boaz/Projects/CheckPostCalibrationCorrelation/AbsorptionExample.csv")
# 
# 
# 
# da = AbsorptionExample[,c("Abs13","C13")]
# yat13 = AbsorptionFit(da$C13,da$Abs13,200)
# 
# ci = seq(0,2.8,length.out = 100 )
# 
# 
# plot( ci , getAbs( yat13 , ci ),type = "l")
# points(da$C13,da$Abs ,cex =0.5 , col=2 , pch = 19)
#   