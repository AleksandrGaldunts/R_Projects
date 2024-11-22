#1

setwd("/home/alik/workspace/local/R")
library("readxl")
library(dplyr)

data <- read_excel("Day10_trt.xlsx")

trt <- data %>%
  group_by(USUBJID, VISIT) %>%
  mutate(
    TRT1 = ifelse(row_number() == 1, TRT, NA),
    TRT2 = ifelse(row_number() == 2, TRT, NA),
    TRT3 = ifelse(row_number() == 3, TRT, NA),
    TRT4 = ifelse(row_number() == 4, TRT, NA),
    treatment_count = sum(!is.na(TRT))
  ) %>%
  ungroup() %>%
  group_by(USUBJID, VISIT) %>%
  summarise(
    TRT1 = max(TRT1, na.rm = TRUE),
    TRT2 = max(TRT2, na.rm = TRUE),
    TRT3 = max(TRT3, na.rm = TRUE),
    TRT4 = max(TRT4, na.rm = TRUE),
    treatment_count = max(treatment_count, na.rm = TRUE)
  )

print(trt)

#2
library(haven)
library(dplyr)

#a

cars <- read_sas("Day10_cars.sas7bdat")
unique_cars <- cars %>%
  distinct(Make, .keep_all = TRUE)
print(unique_cars)

#b

unique_types <- cars %>%
  group_by(Model) %>%
  distinct(Type, .keep_all = TRUE) %>%
  ungroup()

print(unique_types)

#c

expensive <- cars %>%
  group_by(Make) %>%
  filter(MSRP == max(MSRP)) %>%
  ungroup()

print(expensive)

#d

price_difference <- cars %>%
  group_by(Make) %>%
  summarise(
    price_difference = max(MSRP) - min(MSRP)
  )
print(price_difference)
  






