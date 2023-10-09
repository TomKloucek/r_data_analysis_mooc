# Load necessary libraries
library(lubridate)
library(ggplot2)

# Read your CSV data into a data frame
friend_birthdays <- read.csv("birthdaysExample.csv")

# Extract birth months and days
friend_birthdays$Date <- as.Date(friend_birthdays$dates, format = "%m/%d/%y")

# Extract the birth month and day
friend_birthdays$BirthMonth <- month(friend_birthdays$Date)
friend_birthdays$BirthDay <- day(friend_birthdays$Date)


# Find out how many friends have the same birthday as you
same_birthday_count <- sum(friend_birthdays$BirthMonth == 9 & friend_birthdays$BirthDay == 30)

# Count the number of birthdays in each month
birthday_counts <- table(friend_birthdays$BirthMonth)

# Create a bar plot of birthday counts by month
ggplot(data = data.frame(Month = factor(names(birthday_counts)), Count = as.vector(birthday_counts)), aes(x = Month, y = Count)) +
  geom_bar(stat = "identity") +
  labs(title = "Birthday Counts by Month")

# Create a data frame with counts of birthdays by day
birthday_counts_by_day <- data.frame(Day = format(df$dates, "%j"), Count = table(df$dates))

# Create a bar plot of birthday counts by day
ggplot(data = birthday_counts_by_day, aes(x = Day, y = Count)) +
  geom_bar(stat = "identity") +
  labs(title = "Birthday Counts by Day of the Year", x = "Day of the Year", y = "Number of Birthdays")