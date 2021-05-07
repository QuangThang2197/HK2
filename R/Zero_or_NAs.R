setwd('C:\\Users\\RED\\R')
#6.3 Function
#6.3.1. Zeros and NAs
Veg <- read.table(file="Vegetation2.txt", header = TRUE)
names(Veg)
#Ham kiem tra xem trong cot co bao nhieu bien chua NAs
NAPerVariable <- function(X1){
  D1 <- is.na(X1)
  colSums(D1)
}
NAPerVariable(Veg)
CP <- read.table(file="CodParasite.txt", header = TRUE)
NAPerVariable(CP)
#Ham kiem tra bien zero (0)


ZeroPerVariable <- function(X1){
  D1= (X1==0)
  colSums(D1)
}
ZeroPerVariable(Veg)
ZeroPerVariable(CP)
ZeroPerVariable <- function(X1){
  D1= (X1==0)
  colSums(D1, na.rm = TRUE)
}
ZeroPerVariable(Veg)
ZeroPerVariable(CP)


#6.3.2 Ham co nhieu tham so
VariableInfo <-function(X1, Choice1){
  if (Choice1== "Zeros") {
    D1= (X1==0)
  }
  if (Choice1== "NAs") {
    D1 <- is.na(X1)
  }
  colSums(D1, na.rm=TRUE)
}
VariableInfo(CP,"Zeros")
VariableInfo(CP,"NAs")
#VariableInfo(CP,"thamso") #Tham so khong giong voi 
                           #gia tri cua chung ta
#VariableInfo(CP) #Dua ra 1 thong bao


VariableInfo_2 <-function(X1, Choice1="Zeros"){
  if (Choice1== "Zeros") {
    D1= (X1==0)
  }
  if (Choice1== "NAs") {
    D1 <- is.na(X1)
  }
  if (Choice1!= "Zeros" & Choice1 != "NAs") {
    print("You make a miss typo.You should choose: Zeros or NAs")
  }else{
    colSums(D1, na.rm=TRUE)
  }
}
VariableInfo_2(CP,"Zeros")
VariableInfo_2(CP,"NAs")
#VariableInfo_2(CP,"thamso")
VariableInfo_2(CP)

