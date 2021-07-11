setwd('C:\\Users\\RED\\R')

# DATA IMPORT
confirmedraw <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")

# DATA CLEANING: To create country level and global combined data
# Convert each data set from wide to long AND aggregate at country level
library(tidyr)
library(dplyr)

confirmed <- confirmedraw %>% 
  gather(key="date", value="confirmed", -c(Country.Region, Province.State, Lat, Long)) %>% 
  group_by(Country.Region, date) %>% 
  summarize(confirmed=sum(confirmed))

# Date variable
# Fix date variable and convert from character to date
confirmed$date <- confirmed$date %>% 
  sub("X", "", .) %>% 
  as.Date("%m.%d.%y")

# Create new variable: number of days
confirmed <- confirmed %>% 
  group_by(Country.Region) %>% 
  mutate(days = date - first(date) + 1)

# GRAPHS
library(ggplot2)

countryselection <- confirmed %>% filter(Country.Region==c("Romania", "Qatar", "Russia"))
ggplot(countryselection, aes(x=days, y=confirmed, colour=Country.Region)) + geom_line(size=1) +
  theme_classic() +
  labs(title = "Covid-19 Confirmed Cases by Country", x= "Days", y= "Daily confirmed cases (log scale)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(trans="log10")
