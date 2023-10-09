# Your first task is to create a
# scatterplot of price vs x.
# using the ggplot syntax.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ===========================================
ggplot(data = diamonds, aes(x = x, y = price)) +
  geom_point() +
  labs(title = "Scatterplot of Price vs x", x = "x", y = "Price")

# Calculate the correlations
cor_price_x <- cor(diamonds$price, diamonds$x)
cor_price_y <- cor(diamonds$price, diamonds$y)
cor_price_z <- cor(diamonds$price, diamonds$z)

# Print the correlations
cat("Correlation between price and x:", cor_price_x, "\n")
cat("Correlation between price and y:", cor_price_y, "\n")
cat("Correlation between price and z:", cor_price_z, "\n")

# Create a simple scatter plot of price vs depth.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
#==================================================
ggplot(data = diamonds, aes(x = depth, y = price)) +
  geom_point() +
  labs(title = "Scatter Plot of Price vs Depth", x = "Depth", y = "Price")

# Change the code to make the transparency of the
# points to be 1/100 of what they are now and mark
# the x-axis every 2 units. See the instructor notes
# for two hints.

# This assignment is not graded and
# will be marked as correct when you submit.

# ALTER THE CODE BELOW THIS LINE
#============================================
ggplot(data = diamonds, aes(x = depth, y = price)) +
  geom_point(alpha = 0.01) +
  scale_x_continuous(breaks = seq(0, 70, by = 2)) +
  labs(title = "Scatter Plot of Price vs Depth", x = "Depth", y = "Price")


# Create a scatterplot of price vs carat
# and omit the top 1% of price and carat
# values.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ========================================
# Calculate the cutoff values for the top 1%
price_cutoff <- quantile(diamonds$price, 0.99)
carat_cutoff <- quantile(diamonds$carat, 0.99)

# Filter the data to omit the top 1% of price and carat values
filtered_diamonds <- diamonds %>%
  filter(price <= price_cutoff, carat <= carat_cutoff)

# Create the scatterplot
ggplot(data = filtered_diamonds, aes(x = carat, y = price)) +
  geom_point() +
  labs(title = "Scatter Plot of Price vs Carat (Top 1% Omitted)", x = "Carat", y = "Price")

# Create a scatterplot of price vs. volume (x * y * z).
# This is a very rough approximation for a diamond's volume.

# Create a new variable for volume in the diamonds data frame.
# This will be useful in a later exercise.

# Don't make any adjustments to the plot just yet.

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# =================================================================
diamonds$volume <- diamonds$x * diamonds$y * diamonds$z

# Create the scatterplot of price vs. volume
ggplot(data = diamonds, aes(x = volume, y = price)) +
  geom_point() +
  labs(title = "Scatter Plot of Price vs. Volume", x = "Volume", y = "Price")

# Subset the data to exclude diamonds with a volume
# greater than or equal to 800. Also, exclude diamonds
# with a volume of 0. Adjust the transparency of the
# points and add a linear model to the plot. (See the
# Instructor Notes or look up the documentation of
# geom_smooth() for more details about smoothers.)

# We encourage you to think about this next question and
# to post your thoughts in the discussion section.

# Do you think this would be a useful model to estimate
# the price of diamonds? Why or why not?

# This assignment is not graded and
# will be marked as correct when you submit.

# ENTER YOUR CODE BELOW THIS LINE
# ========================================
ggplot(data = subset(diamonds, volume > 0 & volume < 800), aes(x = volume, y = price)) +
  geom_point(alpha = 0.01) +  # Adjust transparency
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Add linear model
  labs(title = "Scatter Plot of Price vs. Volume", x = "Volume", y = "Price")

# Use the function dplyr package
# to create a new data frame containing
# info on diamonds by clarity.

# Name the data frame diamondsByClarity

# The data frame should contain the following
# variables in this order.

#       (1) mean_price
#       (2) median_price
#       (3) min_price
#       (4) max_price
#       (5) n

# where n is the number of diamonds in each
# level of clarity.

# This assignment WILL BE automatically
# graded!

# DO NOT ALTER THE NEXT THREE LINES OF CODE.
# ======================================================
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
data(diamonds)

# ENTER YOUR CODE BELOW THIS LINE
# ======================================================
diamondsByClarity <- diamonds %>%
  group_by(clarity) %>%
  summarise(
    mean_price = mean(price),
    median_price = median(price),
    min_price = min(price),
    max_price = max(price),
    n = n()
  )

# View the first few rows of the resulting data frame
head(diamondsByClarity)

# We’ve created summary data frames with the mean price
# by clarity and color. You can run the code in R to
# verify what data is in the variables diamonds_mp_by_clarity
# and diamonds_mp_by_color.

# Your task is to write additional code to create two bar plots
# on one output image using the grid.arrange() function from the package
# gridExtra.

# This assignment is not graded and
# will be marked as correct when you submit.

# See the Instructor Notes for more info on bar charts
# and for a hint on this task.

# DO NOT DELETE THE LINES OF CODE BELOW
# ===================================================================
data(diamonds)
library(dplyr)

diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

# ENTER YOUR CODE BELOW THIS LINE
# ===================================================================
library(gridExtra)

diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

bar_plot_clarity <- ggplot(diamonds_mp_by_clarity, aes(x = clarity, y = mean_price)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Mean Price by Clarity") +
  theme_minimal()

bar_plot_color <- ggplot(diamonds_mp_by_color, aes(x = color, y = mean_price)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Mean Price by Color") +
  theme_minimal()

# Arrange the two plots side by side
grid.arrange(bar_plot_clarity, bar_plot_color, ncol = 2)
