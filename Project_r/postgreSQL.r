## restaurant pizza SQL
## create 3-5 dataframes => write table into server

#connect to postgreSQL server
library(tidyverse)
library(RPostgreSQL)

#create connection
con <- dbConnect(
  PostgreSQL(),
  host = "arjuna.db.elephantsql.com",
  dbname = "zggmvzpx",
  user = "zggmvzpx",
  password = "Q5VOcYQhvobYObCAhAFXVWq5WTMmsr2k",
  port = 5432
  )

customers <- tribble(
  ~customer_id, ~first_name, ~country,
  1, 'Yo', 'China',
  2, 'James', 'USA',
  3, 'Mary', 'USA',
  4, 'Jane', 'USA',
  5, 'Shinsuke', 'Japan',
  6, 'Gun', 'Thailand',
  7, 'Toy', 'Thailand',
  8, 'Anna', 'Canada',
  9, 'Ryu', 'Japan',
  10, 'Posh', 'Australia'
)

order_detail <- tribble(
  ~order_id, ~order_date, ~orders, ~customer_id,
  1, '2022-01-05', 1, 1,
  2, '2022-01-06', 3, 2,
  3, '2022-01-07', 5, 3,
  4, '2022-01-08', 7, 4,
  5, '2022-01-09', 1, 5,
  6, '2022-01-10', 5, 6,
  7, '2022-01-11', 2, 7,
  8, '2022-01-12', 4, 8,
  9, '2022-01-13', 6, 9,
  10, '2022-01-14', 7, 10,)

menus <- tribble(
  ~menu_id, ~menu_name, ~price,
  1, 'Pizza', 100,
  2, 'Hamburger', 50,
  3, 'French fries', 40,
  4, 'Coke', 20,
  5, 'Water', 10,
  6, 'Sandwich', 30,
  7, 'Fried chicken', 60,
)

dbListTables(con)
dbWriteTable(con, "customers", customers)
dbWriteTable(con, "order_detail", order_detail)
dbWriteTable(con, "menus", menus)

dbGetQuery(con, "select first_name, country from customers")
dbGetQuery(con, "select * from order_detail")
dbGetQuery(con, "select * from menus" )

dbDisconnect(con)
