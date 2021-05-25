setwd('C:\\Users\\RED\\R')
rikz2 <- read.table('RIKZ2.txt', header = TRUE)

par(mar=c(2,2,3,3))
boxplot(Richness ~ Beach, data = rikz2, ylim = c(-1, 24))





