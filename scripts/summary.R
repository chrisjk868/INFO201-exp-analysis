library("tidyverse")
library("dplyr")

co2 <- read.csv('https://raw.githubusercontent.com/chrisjk868/INFO201-exp-analysis/master/export_20201025_1759.CSV',stringsAsFactors = FALSE)
dataset_co2 <- as.data.frame(co2) 
colnames(dataset_co2)[1] <- "year"

# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()

net_co2_export <- dataset_co2 %>%
  sapply(range)

net_co2_export <- rbind(net_co2_export, net_co2_export[2, ] - net_co2_export[1, ])

summary_info$world_net_co2_export <- sum(net_co2_export[3, ], na.rm = T) - 58

summary_info$co2_max_recent <- max(net_co2_export[3, ], na.rm = T)

summary_info$co2_min_recent <- min(net_co2_export[3, ], na.rm = T)

co2_rate <- rbind(net_co2_export, net_co2_export[3, ] / 58.0)

summary_info$co2_max_rate <- max(co2_rate[4, ], na.rm = T)

summary_info$co2_min_rate <- min(co2_rate[4, ], na.rm = T)
