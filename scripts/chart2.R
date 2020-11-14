library(tidyr)
library(dplyr)
library(ggplot2)

co2 <- read.csv('https://raw.githubusercontent.com/chrisjk868/INFO201-exp-analysis/master/export_20201025_1759.CSV'
                ,stringsAsFactors = FALSE)

co2_us <- select(co2, Year = X, United.States.of.America)

chart2_plot <- ggplot(co2_us, aes(Year,United.States.of.America)) + 
  geom_bar(stat = "identity", fill = "darkblue") + 
  scale_x_continuous("Year")+ 
  scale_y_continuous("CO2", breaks = seq(0,7000, by =500))+ 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) + 
  labs(title = "US carbon emissions")