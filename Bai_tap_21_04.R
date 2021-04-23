# 1000 datasets, moi dataset can lam 1 bieu do va luu no duoi dang file jpeg

#for (i is from 1 to 1000)
#end of loop
#while (i < 1000){}
#do{} until(i = 1000)


owls <- read.table('Owls.txt', header = TRUE)
names(owls)
str(owls)
unique(owls)

#Ve bieu do tung loai Nest
owls.ATV <- owls[owls$Nest == 'AutavauxTV', ]
plot(x = owls.ATV$ArrivalTime, 
     y = owls.ATV$NegPerChick, 
     xlab = 'ArrivalTime', 
     main = 'AutavauxTV', 
     ylab = 'Negotiation behavior')

paste(owls.ATV, '.jpg', sep = '')

AllNest <- unique(owls$Nest)
for (i in 1:27){
  Nest.i <- AllNest[i]
  owls.i <- owls[owls$Nest == Nest.i, ]
  YourFileName <- paste(Nest.i, '.jpg', sep = '')
  jpeg(file = YourFileName)
  plot(x = owls.i$ArrivalTime,
       y = owls.i$NegPerChick,
       xlab = 'Arrival Time', 
       main = Nest.i, 
       ylab = 'Negotiation behavior')
  dev.off()
}

#Bai tap
# Su dung Temperature.xls, co chua du lieu o 31 tram thoi tiet 

# Su dung du lieu nhiet do (temperature) va thoi gian (time) de ve bieu do plot o 31 tram
# luu duoi dang jpeg
