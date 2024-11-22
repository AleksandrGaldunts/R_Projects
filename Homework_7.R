#1
#install.packages(descr)
#install.packages("dplyr")
#install.packages("DescTools")
#library(DescTools)
library(desct)
library(dplyr)
library(descr)
library(haven)
library(stats)

cars <- read_sas("/home/alik/workspace/local/R/Day7_1.sas7bdat")
print(cars)
type_freq <- freq(cars$Type)
print(type_freq)
type_table <- table(cars$Type)
print(type_table)
total_count <- sum(type_table)
print(total_count)

VPERCENT <- (type_table / total_count) * 100
VPERCENT
VCUMPERCENT <- cumsum(VPERCENT)
VCUMPERCENT
TPERCENT <- VPERCENT
TCUMPERCENT <- cumsum(TPERCENT)
TCUMPERCENT

frequency_df <- data.frame(
  TYPE = names(type_table),
  FREQUENCY = as.integer(type_table),
  VPERCENT = VPERCENT,
  VCUMPERCENT = VCUMPERCENT,
  TPERCENT = TPERCENT,
  TCUMPERCENT = TCUMPERCENT
)
rownames(frequency_df) <- 1:nrow(frequency_df)
print(frequency_df)

only_audies <- subset(cars,Make=="Audi" & (Weight/Horsepower)>17)
print(only_audies)

#2
stats <- cars %>%
  summarise(
    Mean = mean(Invoice),
    Median = median(Invoice),
    Min = min(Invoice),
    Max = max(Invoice),
    `1st Qu.` = quantile(Invoice, 0.25),
    `3rd Qu.` = quantile(Invoice, 0.75),
    Variance = var(Invoice),
    Std_Dev = sd(Invoice)
  )

print(summary(stats))

print(stats)


#3
print(summary(cars$Invoice))

results_df <- data.frame(
  statistic = c("Mean", "Median", "Min", "Max", "1st Qu.", "3rd Qu."),
  value = c(mean(cars$Invoice), median(cars$Invoice), min(cars$Invoice), max(cars$Invoice),
            quantile(cars$Invoice, 0.25), quantile(cars$Invoice, 0.75))
)
print(results_df)

#4

frame <- data.frame(
  Vanadzor=c(125,523,652,12,325),
  Gyumri = c(362,145,214,321,25)
)
print(frame)
test <- frame %>%
  summarise(
    mean_vanadzor  = mean(Vanadzor),
    mean_gyumri = mean(Gyumri),
    compairing = mean_vanadzor==mean_gyumri
  )
print(test)


