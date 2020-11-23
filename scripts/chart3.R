
library("tidyr")
library("dplyr")
library("ggplot2")

# co2 <- read.csv('https://raw.githubusercontent.com/chrisjk868/INFO201-exp-analysis/master/export_20201025_1759.CSV'
#                 ,stringsAsFactors = FALSE)
co2 <- read.csv('export_20201025_1759.csv',stringsAsFactors = FALSE)

co2_top5<- co2 %>% 
  filter(X == 1960 | X == 1970 | X == 1980 |
           X == 1990 | X == 2000 | X ==2010 | X == 2018) %>%
  gather( key = country_name, value = co2_emission, -X) %>%
  group_by (X) %>%
  filter(co2_emission == max(co2_emission, na.rm = TRUE)) %>%
  arrange(X)


ggplot(data = co2_top5)+
  geom_col( mapping = aes(x = X, y = co2_emission))+
  geom_text( mapping = aes(label = country_name ),check_overlap = TRUE, size = 3, nudge_y = 150 )




