setwd('C:\\Users\\RED\\R')
veg = read.table('vegetation2.txt', header = TRUE)
panel.lm= function(x,y,...){
  tmp <- lm(y~x, na.action = na.omit)
  abline(tmp)
  points(x, y,...)
}
coplot(R ~ ROCK| as.factor(Transect),
       pch=19, panel = panel.lm, data=veg)

