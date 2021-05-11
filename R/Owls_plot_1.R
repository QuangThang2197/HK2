setwd('C:\\Users\\RED\\R') # set working file
Owls <- read.table('Owls.txt', header = TRUE) # extract file .txt

AllNest <- unique(Owls$Nest) #Check how many Nest in dataset
N <- length(AllNest)  # length of AllNest

sibl <- Owls$SiblingNegotiation
sibl[Owls$SiblingNegotiation<=17] <- 4 # set pch 
sibl[Owls$SiblingNegotiation>17] <- 3

for (i in 1:N){         # check lines of AllNest
  Nest.i <- AllNest[i]  # Nest from 1 to N
  A.i <- Owls[Owls$Nest == Nest.i, ]  # check Nest column
  YourFileName <- paste(Nest.i, '.jpg', sep = '') # name the file
  jpeg(file = YourFileName)  # picture file (.jpeg)
  plot(x = A.i$SiblingNegotiation,    # variable x
       y = A.i$ArrivalTime,           # variable y
       xlab = 'Sibling Negotiation',  # x name
       main = Nest.i,                 # plot name
       ylab = 'Arrival Time',         # y name
       pch=sibl)                      # pch
  dev.off()                           # end
}

