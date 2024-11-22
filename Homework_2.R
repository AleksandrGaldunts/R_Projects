library(stringr)
library(stringi)

#1
a <- "1,2,3,4,5,6"
splitted <- strsplit(a, split = ",")[[1]]
b <- sqrt(as.numeric(splitted[6]))
c <- log(as.numeric(splitted[5]))
d <- as.numeric(splitted[6])%%as.numeric(splitted[3])
e <- as.numeric(splitted[2])**as.numeric(splitted[6])
paste(b,c,d,e)

#2
vector <- c(1:10)
doubled <- vector*2
cat(doubled)

#3,4
x <- 10
y <- 20
if (x > y){
  cat("x is greater than y")
}else{
  cat("x is less than or equal to y")
}

#another way
cat(x>y)
cat(x<=y)

#5
a <- 5
b <- 10
c <- 15
if (a+b>c){
  cat("a+b is greater than c")
}else if(a+b==c){
  cat("a+b is equal to c")
}else{
  cat("a+b is less than c")
}

#6
p <- TRUE
q <- FALSE

if (p | q){
  cat("p OR q is TRUE")
}else{
  cat("p OR q is FALSE")
}

#7
library(lubridate)

text <- "Gurus is a fast-growing company that was founded in 02/19/2019.Now it has 4
offices in 4 cities of Armenia and 1 office in USA, Texas with more than 60 employees"

date0 <- unlist(str_extract_all(text, "\\b\\d{1,2}/\\d{1,2}/\\d{4}\\b|\\b\\d{4}-\\d{2}-\\d{2}\\b"))
date <- as.Date(date0, format = "%m/%d/%Y")

#7.1
print(date)
print(date+10)

#7.2
employee <- 60
branches <- 5
emp_vanadzor <- employee/branches
cat(emp_vanadzor)

#7.3
parts <- strsplit(text, ".", fixed = TRUE)[[1]]
print(parts)
parts_1 <-strsplit(parts[1]," ")[[1]]
print(parts_1)
parts_2 <- strsplit(parts[2], " ")[[1]]
print(parts_2)
print(nchar(parts_1[1]))
print(nchar(parts_2[1]))



