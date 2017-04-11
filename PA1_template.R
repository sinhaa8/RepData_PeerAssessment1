<html>

<head>
<title>Title</title>
</head>

<body>

<p>This is an R HTML document. When you click the <b>Knit HTML</b> button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:</p>

<!--begin.rcode
library(dplyr)
activitydata <- read.csv("activity.csv", sep = ",")
str(activitydata)
activitydata$date <- as.Date(activitydata$date)
activity <- activitydata %>% filter(complete.cases(activitydata))

head(activity)
totalsteps <- activity %>%
  group_by(date) %>%
  summarise(steps = sum(steps))
hist(totalsteps$steps, xlab = "Number of Steps", main = "Histogram of Total Number of Steps Each Day", col = 'light blue')
mean(totalsteps$steps)
median(totalsteps$steps)
avgsteps <- activity %>%
  group_by(interval) %>%
  summarise(steps = mean(steps))
plot(avgsteps$interval, avgsteps$steps, type="l", xlab="Interval", ylab="Steps",main="Average Daily Number of Steps by Interval")
avgsteps[which.max(avgsteps$steps),1]

sum(is.na(activitydata$steps))
activityimputed <- activitydata %>%
  group_by(interval) %>%
  mutate(steps = replace(steps, is.na(steps), mean(steps, na.rm = TRUE)))
totalstepsimputed <- activityimputed %>%
  group_by(date) %>%
  summarise(steps = sum(steps))

head(totalstepsimputed)
hist(totalstepsimputed$steps, xlab = "Number of Steps", main = "Histogram of Total Number of Steps Each Day", col = 'light blue')
mean(totalstepsimputed$steps)
median(totalstepsimputed$steps)
mean(totalsteps$steps)
median(totalsteps$steps)
activityimputed["day"] <- weekdays(activityimputed$date)
activityimputed$type_day <- ifelse(activityimputed$day == "Saturday" | activityimputed$day == "Sunday", "Weekend", "Weekday")

## Turn type_day into a factor class
activityimputed$type_day <- as.factor(activityimputed$type_day)
avgstepstypeday <- activityimputed %>%
  group_by(type_day,interval) %>%
  summarise(steps = mean(steps))
library(ggplot2)

ggplot(data = avgstepstypeday, aes(x = interval, y = steps))+
  facet_grid(type_day ~ .)+
  geom_line()+
  ggtitle("Weekday vs. Weekend (Avg. Steps)")
end.rcode-->

<p>You can also embed plots, for example:</p>

<!--begin.rcode fig.width=7, fig.height=6
plot(cars)
end.rcode-->

</body>
</html>
