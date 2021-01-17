directions =  c(45)

 browser(anchoureData)

anchoureData <- function(da , pAnchor , directions , width ){
    
    raddirections = pi * directions/180
    directions = c(225,235,245)
    
    s = tan( raddirections )
    print(s)
    
    bout = list()
    
    i = 0 
    for(si in s )
    {
      i= i + 1
      if( si == 0 ){
        
        boudary1 = pAnchor[2] + width/2
        boudary2 = pAnchor[2] - width/2
        bout[[i]] = ( da[,2] > boudary2 ) & ( da[,2] > boudary1 )
        
        
      } else if( si > 1e3  ){
         
        boudary1 = pAnchor[1] + width/2
        boudary2 = pAnchor[1] - width/2
        bout[[i]] = ( da[,1] > boudary2 ) & ( da[,1] > boudary1 )
        
      } else {
        
        
        intercept  = pAnchor[2] - s * pAnchor[1]
        
        y = da[,1] * s + intercept
        boudary1 = y +  width/2
        boudary2 = y -  width/2
        
        bout[[i]] = ( da[,2] > boudary2 ) & ( da[,2] < boudary1 )
        #points( da[,1], boudary1,type = "l")
        #points( da[,1], boudary2,type = "l" ,col =2)
    
      }
      
      
    }
      
    
    return(bout)
  
  
} 
pAnchor = c(0,0)
da= df
width = 0.5


df = cbind( rnorm(1e4,5,1),rnorm(1e4,5,1) )
cl  = anchoureData(df , c(10,12 ) , c(225,235,245) , 0.5 )
sum(cl)/length(cl)
plot(df ,xlim = c(0,10) ,ylim = c(0,10),col = c(1,2)[ factor(cl ) ] ,pch = ".")



plot(0,0 ,xlim = c(0,10) ,ylim = c(0,10), type = "n")
i= 0
for(cll in cl){
  i=i+1
  print(rainbow(3)[i])
  points(df[ cll ,] ,  col =  rainbow(10)[i] , pch = 19)
  
}

df1 = df[cl,1]
d = density(df1,h=2)
plot(d)
