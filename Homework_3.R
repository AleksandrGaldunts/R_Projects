#1

num_vec <- c(1:10)
num_vec

#2

library(tools)
fruits <- c("apple", "banana", "pear", "peach", "grape")
p_fruits <- fruits[grepl("^p",fruits)]
p_fruits_concat <- paste0(p_fruits,"_1")
tolower(p_fruits_concat)
toupper(p_fruits_concat)
capitalized <- toTitleCase(p_fruits_concat)
capitalized

#3

c(fruits,p_fruits_concat)
c(fruits,capitalized)

#4

my_list <- list(
  numeric_vector = c(1.5, 2.5, 3.5),
  countries = c("Canada", "Mexico", "Japan"),
  is_raining = TRUE
)
second_element <- my_list[2]
class(second_element)
length_of_second_element <- length(second_element)
length_of_second_element

#5

grades <- c("A", "B", "C", "D", "F")
grades_factor <- factor(grades, levels = c("A", "B", "C", "D", "F"))
print(grades_factor)
grades_factor[2] <- "F"
print(grades_factor)

#6

random_matrix <- matrix(runif(9,min = 1, max = 10), nrow=3,ncol=3)
random_matrix

#7

arr <- array(1:24,dim = c(2,3,4))
arr[, 2, ] <- arr[, 2, ] + 5
print(arr)

#8

Name <- c("Aram", "Alik", "Ashot", "Narek","Alex")
Age <- c(22,21,22,22,21)
Gender <- c("Male", "Male", "Male", "Male", "Male")
df <- data.frame(Name=Name,Age=Age,Gender=Gender)
print(df)








