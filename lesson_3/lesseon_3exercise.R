install.packages('ggplot2', dependencies = T)
library(ggplot2)
library(dplyr)

data(diamonds)

levels(diamonds$color)

qplot(x = price, data = diamonds)+
  scale_x_continuous(breaks=c(250,500,15000))

count_under_250 <- diamonds %>%
  filter(price < 250) %>%
  nrow()

# Count diamonds under 500
count_under_500 <- diamonds %>%
  filter(price < 500) %>%
  nrow()

# Count diamonds more than 25000
count_more_than_15000 <- diamonds %>%
  filter(price >= 15000) %>%
  nrow()

highest_price <- max(diamonds$price)

# Filter the dataset to get information about the highest priced diamond(s)
highest_priced_diamond <- diamonds[diamonds$price == highest_price, ]

# Print information about the highest priced diamond
print(highest_priced_diamond)

highest_priced_diamond <- diamonds[diamonds$price == min(diamonds$price), ]


median_prices <- diamonds %>%
  group_by(cut) %>%
  summarize(median_price = median(price))

# Find the cut with the lowest median price
lowest_median_cut <- median_prices %>%
  filter(median_price == min(median_price))

# Print the cut with the lowest median price
print(lowest_median_cut)
