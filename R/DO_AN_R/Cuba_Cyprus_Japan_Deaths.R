setwd('C:\\Users\\RED\\R')

# DATA IMPORT
deathsraw <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")

# DATA CLEANING: To create country level and global combined data
# Convert each data set from wide to long AND aggregate at country level
library(tidyr)
library(dplyr)

deaths <- deathsraw %>% 
  gather(key="date", value="deaths", -c(Country.Region, Province.State, Lat, Long)) %>% 
  group_by(Country.Region, date) %>% 
  summarize(deaths=sum(deaths))

# Date variable
# Fix date variable and convert from character to date
deaths$date <- deaths$date %>% 
  sub("X", "", .) %>% 
  as.Date("%m.%d.%y")

# Create new variable: number of days
deaths <- deaths %>% 
  group_by(Country.Region) %>% 
  mutate(days = date - first(date) + 1)

# GRAPHS
library(ggplot2)

countryselection <- deaths %>% filter(Country.Region==c("Japan", "Cyprus", "Cuba"))
ggplot(countryselection, aes(x=days, y=deaths, colour=Country.Region)) + geom_line(size=1) +
  theme_classic() +
  labs(title = "Covid-19 Deaths Cases by Country", x= "Days", y= "Daily deaths cases (log scale)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(trans="log10")
