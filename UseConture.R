library(mvtnorm)

sigma <- matrix(c(4,2,2,3), ncol=2)
x <- rmvnorm(n=1000, mean=c(1,2), sigma=sigma)
y <- rmvnorm(n=200, mean=c(2,9), sigma=matrix(c(2,0,0,4), ncol=2))
df = rbind(x,y)
plot(df,pch =19,cex= 0.2)


r1 = range(df[,1] )
r1  = r1  + c(-1,1)

r2 = range(df[,2] )
r2  = r2  + c(-1,1)

#h <- kde2d(df[,1], df[,2], n = 50, lims = c( min(df[,1] ), max(df[,1]) , quantile(df[,2],c( 0.01,0.9999 ) ) ) )
#h <- kde2d( df[,1], df[,2], n = 50, lims = c( range(df[,1] ), range( df[,2] ) ) )
h <- kde2d( df[,1], df[,2], n = 200, lims = c( r1, r2  ) )


q = quantile(h$z,c(0.1,0.9999)) 
zseq = seq(0.01,q[2],length.out = 20) # orginal 200 date100320

#find contour
reo1 = contourLines(x = min(h$x) + diff(range(h$x))*seq(0, 1, length.out = nrow(h$z)),
                   y = min(h$y) + diff(range(h$y))*seq(0, 1, length.out = ncol(h$z)),
                   h$z, nlevels = nlevels,
                   #levels = pretty(range(z, na.rm = TRUE), nlevels),
                   levels = zseq)


reo2 <- GetDifferentCounter(reo1)


for(i in 1:length(num1)){
  
  points(reo1[[num1[i]]]$x,reo1[[num1[i]]]$y,"l",col = 2 , xlim = c(-1,3.5),ylim = c(-1,3e3))#,col = cl$cluster[1])
}
l1 = maxStrange(reo2)
l2 = l1[ sapply( l1 , function(x) length(x) >= 2 )]
reo3 = sapply(l2,function(x){x[1]})







plot( df ,pch = "." ,type = "n")

num1 = reo3[[1]]
for(i in 1:length(num1)){
  
  points(reo1[[num1[i]]]$x,reo1[[num1[i]]]$y,"l",col = 3 , xlim = c(-1,3.5),ylim = c(-1,3e3))#,col = cl$cluster[1])
}

num1 = reo3[[2]]

for(i in 1:length(num1)){
  
  points(reo1[[num1[i]]]$x,reo1[[num1[i]]]$y,"l",col = 2 , xlim = c(-1,3.5),ylim = c(-1,3e3))#,col = cl$cluster[1])
}

df <- data.frame(df,stringsAsFactors = F)
str(df)
plot( df$X1,df$X2 , pch = 19,  col = rainbow(2)[factor(cl)] )
cl = apply(df,1,function(input) point.in.polygon( input[ 1 ], input[ 2 ] ,reo1[[ reo3[1] ]]$x, reo1[[ reo3[1] ]]$y, mode.checked=FALSE) == 1 )
df1 = df[cl,]
points( df1 ,pch = "." ,col =3)
cl = apply(df,1,function(input) point.in.polygon( input[ 1 ], input[ 2 ] ,reo1[[ reo3[2] ]]$x, reo1[[ reo3[2] ]]$y, mode.checked=FALSE) == 1 )
df2 = df[cl,]``
points( df2 ,pch = "." ,col =2)



if(length(reo1) > 1){  
  # i =0  
  for(re1 in reo1[2:length(reo1)]){
    #i=i+1
    #i
    #re1 = reo1[[i]]
    #re1
    #points(re[[i]]$x,re[[i]]$y,"l",col = ifelse(isclose(re[[i]]),2,1))
    points(re1$x,re1$y,col = 3,"l" )# pch= 19
  }
  
}


