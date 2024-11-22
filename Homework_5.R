#1
v1 <- c(1,2,3)
v2 <- c(5,7,9)
addition <- v1 + v2
subtraction <- v1 - v2
multiplication <- v1*v2
division <- v1/v2
print(addition)
print(subtraction)
print(multiplication)
print(division)

#2

random_vector <- sample(1:20, 10, replace = TRUE)
random_vector
indices_greater_than_5 <- which(random_vector>5)
indices_greater_than_5
positions_of_15 <- which(random_vector==15)
if (length(positions_of_15)==0){
  cat("There is no such value in the vector.")
}else{
  cat("positions of 15",positions_of_15)
}

#3
char_vector <- c("apple", "banana", "cherry", "apple", "banana", "date","table","chair")
print(char_vector)
unique_char_vector <- unique(char_vector)
cat("Unique values:", unique_char_vector, "\n")
sorted_char_vector <- sort(unique_char_vector)
cat("Sorted values:", sorted_char_vector, "\n")
sorted_char_vector_by_ascii <- sort(unique_char_vector, method = "radix")
cat("Sorted values by ASCII:", sorted_char_vector_by_ascii, "\n")
reversed_char_vector <- rev(sorted_char_vector)
cat("Reversed sorted values:", reversed_char_vector, "\n")

#4
numeric_vector <- c(1,2,5,NA,27,9,NA,NA)
numeric_vector
without_na <- na.omit(numeric_vector)
without_na
replacing_na <- ifelse(is.na(numeric_vector),999,numeric_vector)
replacing_na

#5
char_vector <- c("table","Bob",NA,"chair",NA,"window",NA)
print(char_vector)
concat_hi <- ifelse(is.na(char_vector),NA,paste("Hi",char_vector, sep=" "))
concat_hi


















