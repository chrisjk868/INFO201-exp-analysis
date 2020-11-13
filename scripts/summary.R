install.packages("tidyverse")
library("tidyverse")

co2 <- read.csv('https://raw.githubusercontent.com/chrisjk868/INFO201-exp-analysis/master/export_20201025_1759.CSV',stringsAsFactors = FALSE)

long_dataset <- gather(co2, key = country, value = co2_export,-X)
long_dataset_co2 <- na.omit(long_dataset)
colnames(long_dataset_co2)[1] <- "year"

# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()

net_co2_export <- long_dataset_co2 %>%
  group_by(country) %>%
  summarise(growth = max(co2_export) - min(co2_export))

summary_info$world_net_co2_export <- sum(net_co2_export$growth)

summary_info$co2_max_recent <- long_dataset_co2 %>%
  filter(co2_export == max(co2_export)) %>%
  filter(year == max(year)) %>%
  select(country, year, co2_export)

summary_info$co2_min_recent <- long_dataset_co2 %>%
  filter(co2_export == min(co2_export)) %>%
  filter(year == max(year)) %>%
  select(country, year, co2_export)

summary_info$co2_max_rate <- long_dataset_co2 %>%
  group_by(country) %>%
  summarise(growth = max(co2_export) - min(co2_export), duration = max(year) - min(year), growth_rate = growth / duration) %>%
  filter(growth_rate == max(growth_rate)) %>%
  select(country, growth_rate)

summary_info$co2_min_rate <- long_dataset_co2 %>%
  group_by(country) %>%
  summarise(growth = max(co2_export) - min(co2_export), duration = max(year) - min(year), growth_rate = growth / duration) %>%
  filter(growth_rate == min(growth_rate)) %>%
  select(country, growth_rate)
