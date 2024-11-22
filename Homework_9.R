#1

library(dplyr)
Dataset1 <- data.frame(
  ID = c(1,1,1,2,2,2,2,2,3,4,4,4,4)
)
print(Dataset1)

Dataset2 <- data.frame(
  id = c(2,3,5),
  lab_result = c(15,32,64)
)
print(Dataset2)

data <- Dataset1 %>%
  left_join(Dataset2,by = c("ID"="id")) %>%
  mutate(SAFFL = "Y") %>%
  select(ID, SAFFL)
print(data)
#or
data <- Dataset1 %>%
  left_join(Dataset2,by = c("ID"="id")) %>%
  mutate(SAFFL = ifelse(!is.na(lab_result),"Y","N")) %>%
  select(-lab_result)
print(data)


#2

library(tidyr)
df <- data.frame(
  ID = c(1,1,1,2,2,2,2,2,3,4,4,4,4),
  visit = c(1,2,3,1,2,3,4,5,1,1,2,3,4),
  results = c(12,15,14,13,12,14,15,12,14,12,12,12,14)
)

df <- df %>%
  group_by("ID") %>%
  mutate(ABLFL = ifelse(visit==min(visit),"Y","N"))

df <- df %>%
  mutate(Base = ifelse(ABLFL == "Y", results, NA)) %>%
  fill(Base, .direction = "down")

df <- df %>%
  mutate(CHG = ifelse(ABLFL == "N", results - Base, NA))
print(df)

#3

library("haven")

attr(df$ID, "label") <- "Subject Identifier"
attr(df$visit, "label") <- "Visit name"
attr(df$results,"label") <- "Result in original unit"
attr(df$Base, "label") <- "Baseline result"
attr(df$CHG, "label") <- "Change from baseline"

attr(df$CHG,"label")
attr(df$Base,"label")
attr(df$results,"label")
attr(df$visit,"label")
attr(df$ID,"label")



















