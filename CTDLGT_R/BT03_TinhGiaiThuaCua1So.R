

giaithua <- function(n){
  giai_thua = 1
  if (n < 0){
    return('None exists')
  }
  else if (n ==  0 | n == 1){
    return(giai_thua)
  }
  else {
    return(n * giaithua(n - 1))
  }
}

giaithua(3)
