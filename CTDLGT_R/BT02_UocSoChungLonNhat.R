
uscln <- function(a, b){
  if (a < 0 | b < 0){
    return('None exists')
  }
  if (b == 0){
    return(a)
  }
  else {
    return(uscln(b, a %% b))
  }
}

uscln(24, 6)
