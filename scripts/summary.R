install.packages("tidyverse")
library("tidyverse")

co2 <- read.csv('data/export_20201025_1759.csv',stringsAsFactors = FALSE)

long_dataset_co2 <- gather(co2,key = country, value = co2_export,-X)

# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(my_dataframe)
summary_info$some_max_value <- my_dataframe %>%
  filter(some_var == max(some_var, na.rm = T)) %>%
  select(some_label)