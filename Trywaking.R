library(MASS)
a <- c( rnorm(500), rnorm(500 ,5,1))
b <- c(rnorm(500,0,2),rnorm(500 ,5,1))
f1 <- kde2d(a, b, n = 100)

re_kde2d  = kde2d(a, b, n=100, lims=c(1, 1, -4, -4))

sax = sample( c(1,-1),1000 ,replace = T )

getstep <- function(ti,bo){ 
  say = sample( c(1,-1),ti ,replace = T ,prob = c(0.55,0.45))
  ary = cumsum(say)
  ary[ary < 0]  = 0
  w = which( ary > bo )
  w = min(which( ary > 100))
  if( length(w) > 0){
    w = min(which( ary > 99))
    out = ary[1:w]
  } else {
    
    out  = NULL
  }
    
    
    return( out )
}

x = getstep(1e4,100)
y = getstep(1e4,100)

if( !is.null(x) & !is.null( y ) ){
  
  le = min(length(x),length(y))
  plot(x[1:le],y[1:le],type = "l")  
  h = apply( cbind(x[1:le],y[1:le]) ,1,function(x1) f1$z[x1[1],x1[2]])
  
  plot(x[1:le] , h)
  points(y[1:le] , h,col =2)
  
}


asin(8*pi/360)

0.07 *150




gr = expand.grid(f1$x, f1$y)


points(gr[9991,],pch= 19)

head(gr)


z0 = re_kde2d$z[1,1] - 0.002

#z0 <- kde2d(a, b, n=1, lims=c(1, 1, -4, -4))$z[1,1]



re = contourLines(f1,levels =  z0)
le = sapply(re , function(x) x$level)

range(le)


d = le - z0

w = which( min(d)==d)[1]


filled.contour(f1,col  = rainbow(10) )
points(a[1],b[1], pch  =19 , cex =3 )
polygon(re[[1]]$x,re[[1]]$y)


z0 <- kde2d(a, b, n=1, lims=c(1, 1, -4, -4))$z[1,1]

filled.contour(
  f1,
  plot.axes = {
    contour(f1, levels=z0, add=TRUE)
    abline(v=1, lty=3)
    abline(h=-4, lty=3)
    axis(1); axis(2)
  }
)




