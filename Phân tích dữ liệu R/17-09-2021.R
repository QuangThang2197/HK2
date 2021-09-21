setwd('C:\\Users\\RED\\PycharmProjects\\CTDLGT_R')

library(nycflights13)
library(ggplot2)
library(dplyr)

#Ex1:

alaska <- flights %>% filter(carrier==c("AS"))

ggplot(alaska, aes(x = dep_delay, y = arr_delay)) + 
  geom_point(size=1)

#Ex2:

ewr <- weather %>% filter(origin==c("EWR"))

time <- ewr$time_hour

ggplot(aes(x = time_hour, y = temp), 
       data = subset(ewr, time < '2013/01/15 00:00:00' )) + 
  geom_line(size=0.5)

#Ex3:

ggplot(weather, aes(temp)) + 
  geom_histogram(size=0.5)

#Ex4: 

ggplot(weather, aes(factor(month), temp)) +
  geom_boxplot(size=0.5)

#Ex5:

ggplot(flights, aes(carrier)) + geom_bar()


