install.packages('knitr', dependencies = T)
library(knitr)

reddit <- read.csv('data/reddit.csv')
table(reddit$employment.status)
summary(reddit)

levels(reddit$age.range)

install.packages('ggplot2', dependencies = T)
library(ggplot2)

# as factor
reddit_agerange_factor <- as.factor(reddit$age.range)
levels(reddit_agerange_factor)
# change levels manually
reddit$age.range <- factor(reddit$age.range, levels = c("Under 18","18-24","25-34","35-44","45-54","55-64","65 or Above"))

qplot(data = reddit, x = age.range)