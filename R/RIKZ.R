setwd('C:\\Users\\RED\\R')
rikz = read.table('RIKZ.txt', header = TRUE)
names(rikz)
str(rikz)

species <- rikz[,2:76] # column 2 to 76 ([row, column]: [dong, cot])
names(species)
str(species)
# dimension of species
n <- dim(species) # co 45 dong va 75 cot
# how many species at position 1?
sum(species[1,],na.rm = TRUE)
# how many species at position 2?
sum(species[2,],na.rm = TRUE)

# n times (n==45) to check species at sites
TA <- vector(length = n[1])
for (i in 1:n[1]){
  TA[i] <- sum(species[i,], na.rm = TRUE)
  }
TA

# rowSums: calculate sum of row in columns
# na.rm = TRUE: eliminate NA value
TA02 <- rowSums(species, na.rm = TRUE)
TA02

sum(species[1,]>0,na.rm = TRUE) # there are 11 species 
                                # appearing at position 1
# species appearance at 45 positions
richness <- vector(length = n[1])
for (i in 1:n[1]){
  richness[i] <- sum(species[i,]>0, na.rm = TRUE)
  }
richness

richness02 <- rowSums(species>0, na.rm = TRUE)
richness02
RS <- rowSums(species, na.rm = TRUE)
RS
prop <- species/RS
prop
H <- -rowSums(prop * log(prop), na.rm = TRUE)

# function Index

Index.func <- function(species, choice){
  if (choice == 'Richness'){
    Index <- rowSums(species>0, na.rm = TRUE)
    Index
  }
  if (choice == 'Total Abundance'){
    Index <- rowSums(species, na.rm = TRUE)
    Index
  }
  if (choice == 'Shannon'){
    RS <- rowSums(species, na.rm = TRUE)
    prop <- species/RS
    Index <- -rowSums(prop * log(prop), na.rm = TRUE)
  }
  list(Index=Index, MyChoice= choice)
}

Index.func(species = species, choice = 'Richness')


