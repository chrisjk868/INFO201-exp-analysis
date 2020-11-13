co2_table <- read.csv('https://raw.githubusercontent.com/chrisjk868/INFO201-exp-analysis/master/export_20201025_1759.CSV',stringsAsFactors = FALSE)
long_conversion <- gather(co2, key = country, value = co2_export,-X)
co2_data <- na.omit(long_dataset)
colnames(co2_data)[1] <- "year"

round_two <- function(num) {
  return(round(num, digits = 2))
}

sig_fig <- function(num) {
  return(signif(num, digits = 3))
}

aggregate_table <- co2_data %>%
  group_by(country) %>%
  summarise(years_period = round_two(max(year) - min(year)),
            net_co2_export = round_two(max(co2_export) - min(co2_export)),
            co2_export_rate = sig_fig(net_co2_export / years_period))

final_table <- aggregate_table[with(aggregate_table, order(-net_co2_export)), ]

