x= 1:23
y = 1:20
z= 7

ftyp1  <- function(x1){ sum(x1) }
ftyp2  <- function(y1){diff(y1)}
ftypxyxyxxy <- function(z){z}
#===========================================================

x1 = "type1 = ftyp1(x)"
x2 = "type2 = ftyp2(y)"
x3 = "typex = ftypxyxyxxy(z)"

x1 = "1 = ftyp1(x)"
x2 = "2 = ftyp2(y)"
x3 = "3 = ftypxyxyxxy(z)"


arrayOffunctions = c(x1,x2,x3)
arraysub = c(x1sub,x2sub,x3sub)
eval(parse( text =  paste0("genericfunc <- function( selectType ) { switch( selectType , ", paste(arrayOffunctions,collapse = ","), ") } "  ) ) )
selectType = "type1"  
selectType = 2  
genericfunc( selectType )



if(FALSE){

function;type1 = ftyp1(x)
function;type2 = ftyp2(y)

ty1 = "ftyp1(x)"
ty2 = "ftyp2(y)"


x.fs = "x.f <- function(x){x^2}"
rm(x.f)
eval(parse(text = x.fs))

t1 = "xx"

switch(t1,"xx" = ftyp1(x) ,"yy" = ftyp2(y) )
  
s = paste0( "switch( selectType , " , x1 , x2  , ")" ) 

selectType = 2  
eval(parse(text = s ))


function,ty1, ftyp1(x)
function,ty2, ftyp1(y)
typex,ty1,ty2
typex = 1
re = genericfunction(typex)()


genericfunction <-function(type){
  
  if( type == 1){
    
    eval(parse(text = ty1))
    
  } else {
    
    eval(parse(text = ty2))
    
  }
}





fx <- function(){ return( ftyp1(x) ) }
fy <- function(){ return( ftyp2(y) ) }


function,type1,f1 <- function(x = c(1,2)) { sum(x) }
function,type1,f1 <- function(x = c(1,2)) { sum(x) }
function,type2,f2 <- function(y =c(2,5,7) ) { diff(y) }

genericfunction <-function(type){

  if( type == 1){
    
    return( fx )  
    
  } else {
    
    return(fy)
    
  }
}



genericfunction(1)

}





