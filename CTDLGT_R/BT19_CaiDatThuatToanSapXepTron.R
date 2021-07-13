merge<-function(a,b) {
  r<-numeric(length(a)+length(b))
  ai<-1; bi<-1; j<-1;
  for(j in 1:length(r)) {
    if((ai<=length(a) && a[ai]<b[bi]) || bi>length(b)) {
      r[j] <- a[ai]
      ai <- ai+1
    } else {
      r[j] <- b[bi]
      bi <- bi+1          
    }
  }
  r
}
mergesort<-function(A) {
  if(length(A)>1) {
    q <- ceiling(length(A)/2)
    a <- mergesort(A[1:q])
    b <- mergesort(A[(q+1):length(A)])
    merge(a,b)
  } else {
    A
  }
}
x<- c(-1,2,1,10,3,9,234,123,543,324)

mergesort(x)
