library(tidyr)
library(dplyr)
library(ggplot2)

co2 <- read.csv('https://raw.githubusercontent.com/chrisjk868/INFO201-exp-analysis/master/export_20201025_1759.CSV'
                ,stringsAsFactors = FALSE)
co2_total <- mutate(co2, Total_Emission = rowSums(co2[,2:221],na.rm = T))
chart1_plot <- ggplot(data = co2_total) +
  geom_smooth(mapping = aes(x = Total_Emission, y =
                              United.States.of.America)) + 
  labs(
    title = "The relationship between the United States and global carbon emissions",
    x = "Global carbon emissions", 
    y = "US carbon emissions"
  )
