#1
library(dplyr)
df1 <- data.frame(
  ID = c(1,2,3,4),
  VALUE1  = c("A","B","C","D")
)
print(df1)

df2 <- data.frame(
  ID = c(2,3,5),
  VALUE2  = c("X","Y","Z")
)
print(df2)
inner_merged <- inner_join(df1,df2,by = "ID")
print(merged)

#2

left_merged <- left_join(df1,df2, by = "ID")
print(left_merged)

#3

right_merged <- right_join(df1,df2, by = "ID")
print(right_merged)

#4
full_merged <- full_join(df1,df2, by = "ID")
print(full_merged)

#5

#install.packages("readxl")
library(readxl)

Dataset1<- read_excel("/home/alik/workspace/local/R/Day8_1.xlsx")
print(Dataset1)
Dataset2 <- read_excel("/home/alik/workspace/local/R/Day8_2.xlsx")
print(Dataset2)


all_data <- merge(Dataset1, Dataset2, by = c("ID", "Team"),all = TRUE)
print(all_data)

#5.1

filtered_players <- all_data %>%
  filter(Team %in% c("Manchester United", "Pyunik", "Bayern Munich", "Barcelona") & Goals > 20)
print(filtered_players)

#5.2

stats <- all_data %>%
  group_by(Country) %>% 
  summarize(
    mean_goals = round(mean(Goals),2),
    var_goals = round(var(Goals),3),
    sd_goals = round(sd(Goals),2),
  )
print(stats)

#5.3
joined <- left_join(filtered_players,stats, by = "Country")
print(joined)




