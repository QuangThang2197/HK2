setwd('C:\\Users\\RED\\R')
# Bai tap 1

BFDeaths <- read.table(file = "BirdFluDeaths.txt", 
                      sep="\t", 
                      header = TRUE)
names(BFDeaths)
str(BFDeaths)

Deaths <- rowSums(BFDeaths[,2:16])
names(Deaths)<-BFDeaths[,1]
Deaths

par(mfrow= c(2,2), mar= c(3,3,2,1))




pie(Deaths, main = "Standard pie chart")
pie(Deaths, main = "Grey color",
    col = gray(seq(0.4, 1.0, length=6)),
    clockwise = TRUE
)
pie(Deaths, main = "Rainbow color",
    col = rainbow(6),
    clockwise = TRUE
)




Deaths1 <- colSums(BFDeaths[,2:16])
Deaths1

par(mfrow= c(2,2), mar= c(3,3,2,1))

pie(Deaths1, main = "Standard pie chart")
pie(Deaths1, main = "Grey color",
    col = gray(seq(0.4, 1.0, length=6)),
    clockwise = TRUE
)
pie(Deaths1, main = "Rainbow color",
    col = rainbow(6),
    clockwise = TRUE
)

# Bai tap 2

Veg <- read.table(file = "Vegetation2.txt", 
                       sep="\t", 
                       header = TRUE)

Bent.M <-tapply(Veg$R, 
                INDEX=Veg$Transect, 
                FUN=mean)

Bent.sd <-tapply(Veg$R, 
                 INDEX=Veg$Transect, 
                 FUN=sd)

Benth.le <- tapply(Veg$R,
                   INDEX=Veg$Transect,
                   FUN=length)

Bent.se <- Bent.sd/sqrt(Benth.le)

stripchart(Veg$R~Veg$Transect,
           vert=TRUE,
           pch=1,
           method="jitter",
           jit=0.05,
           xlab="Transect",
           ylab="R")

points(1:8, Bent.M, pch=16,
       cex=1.5)
arrows(1:8, Bent.M,
       1:8, Bent.M+Bent.se,
       lwd=1.5,
       angle=90,
       length = 0.1)
arrows(1:8, Bent.M,
       1:8, Bent.M-Bent.se,
       lwd=1.5,
       angle=90,
       length = 0.1)

