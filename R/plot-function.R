setwd('C:\\Users\\RED\\R')

methods(plot)
help(plot)

Benthic <-read.table(file="RIKZ2.txt", header=TRUE)
Benthic$fBeach <- factor(Benthic$Beach)
plot(Benthic$Richness ~ Benthic$fBeach)

plot.new() #tao ra 1 trang moi de ve bieu do moi
win.graph  #tao 1 cua so va cho phep ve bieu do vao cua so do
windows    #tuong tu win.graph
savePlot   #luu file vao thiet bi cua window
locator #xac dinh cac diem minh chon tren bieu do de hien thi
matplot #dem du lieu dau vao va ve chung len bieu do
persp # ve bieu do 3D hinh hop
cut  # cho biet gia tri nam trong khoang nao
split# chia va gom cac gia tri co cung stt lai voi nhau