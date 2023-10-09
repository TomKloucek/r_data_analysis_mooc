library(ggplot2)

# Create a histogram of diamond prices.
# Facet the histogram by diamond color
# and use cut to color the histogram bars.
ggplot(diamonds, aes(x = price, fill = cut)) +
  geom_histogram(binwidth = 500) +
  facet_wrap(~ color) +
  scale_fill_brewer(type = 'qual') +
  labs(
    x = "Diamond Price",
    y = "Frequency",
    title = "Histogram of Diamond Prices Faceted by Color"
  )

# Create a scatterplot of diamond price vs.
# table and color the points by the cut of
# the diamond.
ggplot(diamonds, aes(x = table, y = price, color = cut)) +
  geom_point() +
  scale_color_brewer(type = 'qual') +
  labs(
    x = "Table",
    y = "Price",
    title = "Scatterplot of Diamond Price vs. Table"
  )

# Create a scatterplot of diamond price vs.
# volume (x * y * z) and color the points by
# the clarity of diamonds. Use scale on the y-axis
# to take the log10 of price. You should also
# omit the top 1% of diamond volumes from the plot.
diamonds$volume <- diamonds$x * diamonds$y * diamonds$z
cutoff <- quantile(diamonds$volume, 0.99)
ggplot(subset(diamonds, volume <= cutoff), aes(x = volume, y = log10(price), color = clarity)) +
  geom_point() +
  scale_color_brewer(type = 'div') +
  labs(
    x = "Volume",
    y = "Log10(Price)",
    title = "Scatterplot of Log-Transformed Price vs. Volume by Clarity"
  )

# Your task is to create a new variable called 'prop_initiated'
# in the Pseudo-Facebook data set. The variable should contain
# the proportion of friendships that the user initiated.
pf <- read.delim('../tomask/Dokumenty/Personal/DataAnalysis/udacity_course/data/pseudo_facebook.tsv')

pf$prop_initiated <- pf$friendships_initiated / pf$friend_count
pf$prop_initiated[is.na(pf$prop_initiated)] <- 0

# Create a line graph of the median proportion of
# friendships initiated ('prop_initiated') vs.
# tenure and color the line
median_data <- pf %>%
  group_by(tenure) %>%
  summarize(median_prop_initiated = median(prop_initiated))

ggplot(median_data, aes(x = tenure, y = median_prop_initiated)) +
  geom_line() +
  labs(
    x = "Tenure",
    y = "Median Prop. Initiated",
    title = "Median Proportion of Friendships Initiated vs. Tenure"
  )

# Smooth the last plot you created
ggplot(pf, aes(x = tenure, y = prop_initiated)) +
  geom_smooth() +
  labs(
    x = "Tenure",
    y = "Proportion Initiated",
    title = "Smoothed Plot of Proportion of Friendships Initiated vs. Tenure"
  )

# Create a scatter plot of the price/carat ratio
# of diamonds. The variable x should be
# assigned to cut. The points should be colored
# by diamond color, and the plot should be
# faceted by clarity.
ggplot(diamonds, aes(x = cut, y = price / carat, color = color)) +
  geom_point() +
  facet_wrap(~clarity, nrow = 2) +
  labs(
    x = "Cut",
    y = "Price/Carat Ratio",
    title = "Scatter Plot of Price/Carat Ratio by Cut (Faceted by Clarity)",
    caption = "Colored by Diamond Color"
  ) +
  scale_color_brewer(type = 'div')