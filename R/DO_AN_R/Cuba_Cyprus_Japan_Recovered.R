setwd('C:\\Users\\RED\\R')

# DATA IMPORT
recoveredraw <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")

# DATA CLEANING: To create country level and global combined data
# Convert each data set from wide to long AND aggregate at country level
library(tidyr)
library(dplyr)

recovered <- recoveredraw %>% 
  gather(key="date", value="recovered", -c(Country.Region, Province.State, Lat, Long)) %>% 
  group_by(Country.Region, date) %>% 
  summarize(recovered=sum(recovered))

# Date variable
# Fix date variable and convert from character to date
recovered$date <- recovered$date %>% 
  sub("X", "", .) %>% 
  as.Date("%m.%d.%y")

# Create new variable: number of days
recovered <- recovered %>% 
  group_by(Country.Region) %>% 
  mutate(days = date - first(date) + 1)

# GRAPHS
library(ggplot2)

countryselection <- recovered %>% filter(Country.Region==c("Japan", "Cyprus", "Cuba"))
ggplot(countryselection, aes(x=days, y=recovered, colour=Country.Region)) + geom_line(size=1) +
  theme_classic() +
  labs(title = "Covid-19 Recovered Cases by Country", x= "Days", y= "Daily recovered cases (log scale)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(trans="log10")
