library(tidyr)
library(dplyr)
library(ggplot2)

co2 <- read.csv('https://raw.githubusercontent.com/chrisjk868/INFO201-exp-analysis/master/export_20201025_1759.CSV'
                ,stringsAsFactors = FALSE)
co2_total <- mutate(co2, total_emission = rowSums(co2[,2:221],na.rm = T))

chart1_plot <- ggplot(data = co2_total, mapping = aes(x = total_emission, y =
                                                 United.States.of.America)) +
  geom_smooth() +
  geom_point(color = co2_total$total_emission, shape = 2 ) +
  geom_text(mapping = aes(label = X),check_overlap = TRUE, size = 3, nudge_y = 150 ) +
  labs(
  title = "The relationship between the United States and global carbon emissions",
  x = "Global carbon emissions",
  y = "US carbon emissions"
)


