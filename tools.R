#YAT13 = data.frame(Y = 0.5,A = 0.5, T = 3)
#YAT12 = data.frame(Y = 5.2,A = 0.48, T = 4)
recalDOB <- function(ra1){
  #ra1 = sp[[70]]
  DOBresult = NULL
  ti = strptime( as.character( ra1$lockCell), "%d/%m/%Y %H:%M:%S" ) 
  or = order(ti)
  if ( length(or) == 5 ) {
    
    ti = ti[or]
    ti = as.numeric(ti - ti[1])
    dt  =  ti/max(ti)
    ra1=ra1[or,]
    abs12 = ra1$Absorption12
    abs13 = ra1$Absorption13
    YAT13 = data.frame(Y = ra1$C13_Y,A = ra1$C13_A, T = ra1$C13_T)[1,]
    YAT12 = data.frame(Y = ra1$New.C12_Y,A = ra1$New.C12_A, T = ra1$New.C12_T)[1,]
    coef <- ra1[,c("Coef_0","Coef_1","Coef_2","Coef_3")][1,]
    re = callculateRatio(abs12,abs13,YAT12,YAT13,coef)
    ratios = re[11:15]
    db = dt[c(1,3,5)]
    ds = dt[c(2,4)]
    rb = ratios[c(1,3,5)]
    model <- lm(rb ~ poly( db , 2 ) )
    Raselineinter = predict(model,data.frame(db = ds))
    DOBresult = mean( 1e3 * ( ratios[c(2,4)] - Raselineinter )/ Raselineinter ) 
    DOBresult
  }else{
    DOBresult = "N/A"
  }
  
  DOBresult
}

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



CalCon13 <- function(Abs,YAt13in){
  
  out  = -YAt13in$T*log((Abs - YAt13in$Y)/YAt13in$A)
  out
  
}



CalCon12 <- function(Abs12,YAt12inn,coef,C13){
  
  Abs12c = Abs12*( 1 + fCorrection(coef,C13)/100 )
  
  out  = -YAt12inn$T*log((Abs12c - YAt12inn$Y)/YAt12inn$A)
  out
  
}


fCorrection <- function(coefin,C13){
  
  if(length(coefin) > 3 )
    
    out =  sum(coefin * c(1,C13,C13^2,C13^3))
  
  else{
  
      out =  sum(coefin * c(1,C13,C13^2))
  }
  
  out
}

callculateRatio <-  function(abs12in,abs13in,YAT12in,Yat13in,coefin){
  
  C13 = CalCon13(abs13in,Yat13in)
  C12 = CalCon12(abs12in,YAT12in,coefin,C13)
  out = c(C13,C12,C13/C12)
  out
}






#df  = NULL

callculateDOB <- function(df){

  de = dim(df)
  
  if(de[1] == 5 )
  {
    
      baselines = df[c(1,3,5),]
      samples = df[c(1,3,5),]
      
      tb = baselines$times - baselines$times[1]
      ts = samples$times - samples$times[1]
      model  = lm(baselines$Ratios ~ poly(tb,2))
      interRatios = predict(model,as.dat.frame(tb = ts))
      out = mean( samples$Ratios - interRatios)/interRatios * 1e3
      out
  } 
  
}










