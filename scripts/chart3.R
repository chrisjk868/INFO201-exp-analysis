library(tidyr)
library(dplyr)
library(ggplot2)

co2 <- read.csv('https://raw.githubusercontent.com/chrisjk868/INFO201-exp-analysis/master/export_20201025_1759.CSV'
                ,stringsAsFactors = FALSE)
co2_us_cn_jp_gr_in <- select(co2, Year = X, United.States.of.America, China, Japan, Germany, India)
co2_cn <- select(co2, Year = X, China)

chart3_plot <- ggplot(data = co2_cn,) + 
  geom_histogram(aes(x = Year), binwidth = 2, fill = "red")+
  scale_x_continuous("Year")+
  scale_y_continuous("CO2", breaks = seq(0,11,000, by =100))+
  labs(title = "China carbon emissions")