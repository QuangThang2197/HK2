setwd('C:\\Users\\RED\\R')

methods(plot)
help(plot)

Benthic <-read.table(file="RIKZ2.txt", header=TRUE)
Benthic$fBeach <- factor(Benthic$Beach)
plot(Benthic$Richness ~ Benthic$fBeach)

plot.new() # tạo ra 1 trang mới để vẽ biểu đồ mới
win.graph  # tạo 1 cửa sổ và cho phép vẽ biểu đồ vào cửa sổ đó
windows    # tương tự win.graph
savePlot   # lưu file vào thiết bị của window
locator    # xác định các điểm được chọn trên biểu đồ để hiển thị
matplot    # đem dữ liệu đầu vào và vẽ chúng lên biểu đồ
persp      # vẽ biểu đồ 3D hình hộp 
cut        # cho biết giá trị nằm trong khoảng nào
split      # chia và gom các giá trị có cùng stt lại với nhau
