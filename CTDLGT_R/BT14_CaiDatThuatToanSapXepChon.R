vec <- sample(1:100)
sort <- function(x) {
  n<- length(x)
  for (i in 1:(n-1)) {
    for (j in (i+1):n) {
      if(x[j] < x[i]) {
        temp <-x[i]
        x[i] <- x[j]
        x[j] <- temp
      }
    }
  }
  return(x)
}

sort(vec)
