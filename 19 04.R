veg = read.table('Vegetation2.txt', header = TRUE)
str(veg)
plot(veg$BARESOIL, veg$R)
plot(veg$R, veg$BARESOIL)
plot(x = veg$BARESOIL, y = veg$R)
plot(R~BARESOIL, data = veg)
plot(x = veg$BARESOIL,  # bien x
     y = veg$R,       # bien y
     xlab = 'Exposed oil',   #tieu de cua x
     ylab = 'Species richness',  #tieu de cua y
     main = 'Scatter plot',  # tieu de cua tieu de
     xlim = c(min(veg$BARESOIL), max(veg$BARESOIL)),   # khoang gia tri cua x 0-45
     ylim = c(min(veg$R), max(veg$R)),  # khoang gia tri cua y 4-19
     pch = 3) 

plot(x = veg$BARESOIL,  # bien x
     y = veg$R,       # bien y
     xlab = 'Exposed oil',   #tieu de cua x
     ylab = 'Species richness',  #tieu de cua y
     main = 'Scatter plot',  # tieu de cua tieu de
     xlim = c(min(veg$BARESOIL), max(veg$BARESOIL)),   # khoang gia tri cua x 0-45
     ylim = c(min(veg$R), max(veg$R)),  # khoang gia tri cua y 4-19
     pch = veg$TransectName)  

veg$Time
# neu <=1980 thi pch = 1
# neu >1980 thi pch = 10

timegroup = veg$Time
timegroup[veg$Time<=1980] = 1
timegroup[veg$Time>1980] = 10

plot(x = veg$BARESOIL,  # bien x
     y = veg$R,       # bien y
     xlab = 'Exposed oil',   #tieu de cua x
     ylab = 'Species richness',  #tieu de cua y
     main = 'Scatter plot',  # tieu de cua tieu de
     xlim = c(min(veg$BARESOIL), max(veg$BARESOIL)),   # khoang gia tri cua x 0-45
     ylim = c(min(veg$R), max(veg$R)),  # khoang gia tri cua y 4-19
     pch = timegroup,
     col = 9)

x = 1:8
plot(x, col = x)

plot(x = veg$BARESOIL,  # bien x
     y = veg$R,       # bien y
     xlab = 'Exposed oil',   #tieu de cua x
     ylab = 'Species richness',  #tieu de cua y
     main = 'Scatter plot',  # tieu de cua tieu de
     xlim = c(min(veg$BARESOIL), max(veg$BARESOIL)),   # khoang gia tri cua x 0-45
     ylim = c(min(veg$R), max(veg$R)),  # khoang gia tri cua y 4-19
     pch = timegroup,
     col = 9,
     cex = 1.5)

cexsize = veg$Time
cexsize[veg$Time<=1980] = 1
cexsize[veg$Time>1980] = 3

plot(x = veg$BARESOIL,  # bien x
     y = veg$R,       # bien y
     xlab = 'Exposed oil',   #tieu de cua x
     ylab = 'Species richness',  #tieu de cua y
     main = 'Scatter plot',  # tieu de cua tieu de
     xlim = c(min(veg$BARESOIL), max(veg$BARESOIL)),   # khoang gia tri cua x 0-45
     ylim = c(min(veg$R), max(veg$R)),  # khoang gia tri cua y 4-19
     pch = timegroup,
     col = 9,
     cex = cexsize)


veg1 = loess(R~BARESOIL, data = veg)
fit = fitted(veg1)
lines(veg$BARESOIL, fit)
