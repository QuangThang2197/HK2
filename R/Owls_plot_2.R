setwd('C:\\Users\\RED\\R') # set working file
Owls <- read.table('Owls.txt', header = TRUE)  # extract file .txt

Owls$NestNight <- paste(Owls$Nest,  # name of Nest column
                        Owls$FoodTreatment,  # name of FoodTreatment column
                        sep = '_')  # combine name of 2 columns

AllNestsNights <- unique(Owls$NestNight) #Check how many NestNight
                                         #in dataset
N <- length(AllNestsNights) # length of AllNestsNights
for (i in 1:N){   # check lines of AllNestsNights
  NestNight.i <- AllNestsNights[i] # nest from 1 to N
  
  Owlsi <- Owls[Owls$NestNight == NestNight.i ,]  # check NestNight column
  YourFileName <- paste(NestNight.i, '.jpg', sep = '') # name the file
  jpeg(file = YourFileName)  # picture file (.jpeg)
  plot(x = Owlsi$ArrivalTime ,       # variable x
       y = Owlsi$NegPerChick,        # variable y
       xlab = 'Arrival Time',        # x name
       ylab = 'Sibling negotiation', # y name
       main = NestNight.i            # plot name
       )
  dev.off()                          # end
}
