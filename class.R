library(tidyverse)
library(tidyr)
library(dplyr)
library(summarytools)
library(DescTools)
library(stringr)
library(Hmisc)
library(labelled)
library(magrittr)
library(lubridate)
library(haven)
library(readxl)
library(arsenal)



setwd("C:/Users/User/Desktop/R trainings/Day 11")

adsl <-  read_sas("adsl.sas7bdat") %>%
  filter(SAFFL =="Y")


bign<- nrow(adsl)



age1 <- adsl %>%
  summarise(N=n(),
            Mean = round(mean(AGE), 1),
            Std = round(sd(AGE),2),
            Median = round(median(AGE), 1),
            Min = paste0(min(AGE), ", ", max(AGE)))

age2 <- gather(age1, "Stat", "result", 1:5) %>%
  mutate(v1 = case_when( Stat == "N" ~ "Age at Informed Consent (years)"
                         ,TRUE ~ ""),
         v2 = case_when( Stat == "Std" ~ "Std. Dev.", 
                         Stat == "Min" ~ "Min, Max",
                         TRUE ~ Stat),
         v3 = result) %>%
  select(v1, v2, v3)
  

gender <- adsl %>% 
  group_by(GENDER) %>% 
  summarise(
    N = n()
  )

dummy_df = data.frame(GENDER = c("M", "F"))

new_df = left_join(dummy_df, gender, by = "GENDER") %>%
  mutate(N = ifelse(is.na(N), 0, N),
         v3= paste0(N, " (", round(N/bign*100,1), ")"),
         v1=case_when(GENDER=="M"~"   Male",
                      GENDER=="F"~"   Female"),
         v2="n (%)") %>%
        select(v1, v2, v3)

demog <- rbind(age2, c("Gender", "", ""), new_df)

attr(demog$v1, "label") <- "Parameter"
attr(demog$v2, "label") <- "Statistic"
attr(demog$v3, "label") <- paste0("Overall\n(N=", bign, ")")

qc <- read_sas("qc.sas7bdat")

summary(comparedf(demog, qc))

