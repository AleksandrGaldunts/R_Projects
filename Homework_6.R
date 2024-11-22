#1
my_list <- list(
  num_vec = c(1,2,3,4,5),
  char_vec = c("a","b","c"),
  log_vec = c(TRUE,FALSE,TRUE)
)

#2
print(my_list[[2]])

#3
print(my_list[[3]][length(my_list[[3]])])

#4
random_matrix <- matrix(runif(6),nrow = 2,ncol = 3)
my_list$new_element <- random_matrix

#5
print(my_list)

#6
my_list$char_vec[1] <- "x"

#7
print(my_list)

#8
#install.packages("readxl")
library(readxl)
excel_data <- read_excel("/home/alik/workspace/local/R/Day6_1.xlsx")
print(excel_data)

#9
csv_data <- read.csv("/home/alik/workspace/local/R/Day6_2.csv")
print(csv_data)

#10
#install.packages("haven")
library(haven)
sas_data <- read_sas("/home/alik/workspace/local/R/Day6_3.sas7bdat")
print(sas_data)

#11
df <- data.frame(
  Age = c(25, 30, 35, 40, 45),
  Height = c(160, 165, 170, 175, 180),
  Weight = c(55, 60, 65, 70, 75),
  Gender = c("Male", "Female", "Male", "Female", "Male")
)
print(df)

#12
new_line <- data.frame(
  Age = 25,
  Height = 170,
  Weight = 68,
  Gender = "Male"
)
df <- rbind(df,new_line)
df

#13
df$Gendern <- c(1,2,1,2,1,1)
print(df)






















