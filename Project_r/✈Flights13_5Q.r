## transform nycflights13

library(tidyverse) #dplyr
library(nycflights13)

data("flights")
data("airlines")

##Q.Example : the most flight carrier in sep 2013
flights %>%
  filter( month == 9, year == 2013 ) %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  head(5) %>%
  left_join(airlines)

#Q.1 Which destinations were trending for travel in December 2013?
flights %>%
  filter( month == 12, year == 2013) %>%
  count(dest) %>%
  arrange(desc(n)) %>%
  head(5)

#Q.2 Analyze the total distance traveled on flights in 2013.
flights %>%
  #sample 0.2
  sample_frac(0.2) %>%
  summarise(total_flights = n(),
            avg_distance = mean(distance),
            sum_distance = sum(distance),
            max_distance = max(distance),
            var_distance = var(distance),
            min_distance = min(distance))

#Q.3 Which 5 airlines had the highest delay rates for flights?
flights %>%
  filter(dep_delay >= 0 & arr_delay >= 0) %>%
  group_by(carrier) %>%
  summarise( delay_time = sum(dep_delay,arr_delay)) %>%
  arrange(desc(delay_time)) %>%
  head(5) %>%
  left_join(airlines)

#Q.4 Which 5 airlines operate the longest average flight routes?
flights %>%
  select(carrier,distance) %>%
  group_by(carrier) %>%
  summarise( avg_distance = mean(distance)) %>%
  arrange(desc(avg_distance)) %>%
  head(5) %>%
  left_join(airlines)

#Q.5 Routes with the highest flight frequency.
flights %>%
  select(origin,dest) %>%
  mutate(routes = paste( origin, dest, sep = "-" ) ) %>%
  group_by(routes) %>%
  summarise(frequencys = n()) %>%
  arrange(desc(frequencys)) %>%
  head(10)
