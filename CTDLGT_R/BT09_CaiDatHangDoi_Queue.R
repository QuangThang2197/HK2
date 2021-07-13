

library(dequer)

q <- queue()
for (i in 1:3) pushback(q, i)

str(q)
pop(q)
str(q)
pop(q)
str(q)
pop(q)
str(q)
