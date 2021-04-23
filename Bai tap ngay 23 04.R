#Bai tap
# Su dung Temperature.xls, co chua du lieu o 31 tram thoi tiet 
# Su dung du lieu nhiet do (temperature) va thoi gian (time) 
# de ve bieu do plot o 31 tram
# luu duoi dang jpeg

A = readxl::read_xls('Temperature.xls')
unique(A)
str(A)
names(A)

AllStation <- unique(A$Station)

for (i in 1:30){
  Station.i <- AllStation[i]
  A.i <- A[A$Station == Station.i, ]
  YourFileName <- paste(Station.i, '.jpg', sep = '')
  jpeg(file = YourFileName)
  plot(y = A.i$Temperature,
       x = A.i$Year,
       ylab = 'Temperature', 
       main = Station.i, 
       xlab = 'Times')
  dev.off()
}

