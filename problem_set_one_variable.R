library(ggplot2)
data(diamonds)

summary(diamonds)

# Create a histogram of the price of
# all the diamonds in the diamond data set.

# TYPE YOUR CODE BELOW THE LINE
# =======================================
qplot(x = price, data = diamonds)

# Explore the largest peak in the
# price histogram you created earlier.

# Try limiting the x-axis, altering the bin width,
# and setting different breaks on the x-axis.

# There won’t be a solution video for this
# question so go to the discussions to
# share your thoughts and discover
# what other people find.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Submit your final code when you are ready.

# TYPE YOUR CODE BELOW THE LINE
# ======================================================================
qplot(x = price, data = diamonds) +
    xlim(0, 10000) +
  geom_histogram(binwidth = 100) +
  scale_x_continuous(breaks = seq(0, 10000, by = 500)) 

# Break out the histogram of diamond prices by cut.

# You should have five histograms in separate
# panels on your resulting plot.
ggplot(data = diamonds, aes(x = price)) +
  geom_histogram(binwidth = 500) +
  facet_wrap(~cut, ncol = 1)

ggplot(data = diamonds, aes(x = price)) +
  geom_histogram(binwidth = 500) +  # Adjust the binwidth as needed
  facet_wrap(~cut, ncol = 1, scales = "free_y")  # Allow y-axis to vary

# Create a histogram of price per carat, facet it by cut
ggplot(data = diamonds, aes(x = price/carat)) +
  geom_histogram(binwidth = 0.1) +  # Adjust the binwidth as needed
  facet_wrap(~cut, ncol = 1, scales = "free_y") +  # Facet by cut
  scale_x_continuous(trans = "log10", breaks = c(0.1, 1, 10, 100, 1000)) +
  labs(x = "Price per Carat (log10 scale)")

# Investigate the price of diamonds using box plots,
# numerical summaries, and one of the following categorical
# variables: cut, clarity, or color.

# There won’t be a solution video for this
# exercise so go to the discussion thread for either
# BOXPLOTS BY CLARITY, BOXPLOT BY COLOR, or BOXPLOTS BY CUT
# to share you thoughts and to
# see what other people found.

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.
# =================================================================
ggplot(data = diamonds, aes(x = cut, y = price)) +
  geom_boxplot() +
  labs(title = "Box Plot of Diamond Price by Cut",
       x = "Cut",
       y = "Price")

# Numerical Summary by Cut
summary_by_cut <- tapply(diamonds$price, diamonds$cut, summary)
print(summary_by_cut)

IQR(subset(diamonds, price <1000)$price)

# Investigate the price per carat of diamonds across
# the different colors of diamonds using boxplots.

# Go to the discussions to
# share your thoughts and to discover
# what other people found.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.

# SUBMIT YOUR CODE BELOW THIS LINE
# ===================================================================
ggplot(data = diamonds, aes(x = color, y = price/carat)) +
  geom_boxplot() +
  labs(title = "Box Plot of Price per Carat by Diamond Color",
       x = "Color",
       y = "Price per Carat")