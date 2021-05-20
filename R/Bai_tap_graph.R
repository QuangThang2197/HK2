setwd('C:\\Users\\RED\\R')
# Bai tap 1

BFDeaths <- read.table(file = "BirdFluDeaths.txt", 
                      sep="\t", 
                      header = TRUE)
names(BFDeaths)
str(BFDeaths)

Deaths <- colSums(BFDeaths[,2:16])
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


# Bai tap 2

Veg <- read.table(file = "Vegetation2.txt", 
                       sep="\t", 
                       header = TRUE)

Veg.M <-tapply(Veg$R, 
               INDEX=Veg$Transect, 
               FUN=mean)

Veg.sd <-tapply(Veg$R, 
                INDEX=Veg$Transect, 
                FUN=sd)

Veg.le <- tapply(Veg$R,
                 INDEX=Veg$Transect,
                 FUN=length)

Veg.se <- Veg.sd/sqrt(Veg.le)

stripchart(Veg$R~Veg$Transect,
           vert=TRUE,
           pch=1,
           method="jitter",
           jit=0.05,
           xlab="Transect",
           ylab="R")

points(1:8, Veg.M, pch=16,
       cex=1.5)
arrows(1:8, Veg.M,
       1:8, Veg.M+Veg.se,
       lwd=1.5,
       angle=90,
       length = 0.1)
arrows(1:8, Veg.M,
       1:8, Veg.M-Veg.se,
       lwd=1.5,
       angle=90,
       length = 0.1)

