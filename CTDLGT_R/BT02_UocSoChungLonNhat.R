uscln <- function(a, b){
  if (a < 0 | b < 0){
    return('None exists') # khi 1 trong 2 so be hon 0 thi ko ton tai giai thua
  }
  if (b == 0){
    return(a)     # khi b = 0  thi chi con a nen giai thua la a
  }
  else {
    return(uscln(b, a %% b)) # uscln thi ta lay phan du cua a chia b
  }
}

uscln(24, 6)
