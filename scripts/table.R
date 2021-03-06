library("tidyverse")
co2 <- read.csv('https://raw.githubusercontent.com/chrisjk868/INFO201-exp-analysis/master/export_20201025_1759.CSV',stringsAsFactors = FALSE)
co2_table <- data.frame(co2)
colnames(co2_table)[1] <- "year"
co2_data <- co2_table %>%
  gather(key = country, value = co2_export,-year)
co2_data <- na.omit(co2_data)

round_two <- function(num) {
  return(round(num, digits = 2))
}

sig_fig <- function(num) {
  return(signif(num, digits = 3))
}

aggregate_table <- co2_data %>%
  group_by(country) %>%
  summarise(period_of_years = round_two(max(year) - min(year)),
            net_co2_export = round_two(max(co2_export) - min(co2_export)),
            co2_export_rate = sig_fig(net_co2_export / period_of_years))

final_table <- aggregate_table[with(aggregate_table, order(-net_co2_export)), ]
