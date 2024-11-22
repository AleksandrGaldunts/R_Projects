library(stringr)
library(stringi)

#1
var <- "The Gurus is a fast-growing company assembling highly qualified professionals in the industry."

#2
word(var,3)

#3
variable <-"GURUS"
if (grepl(tolower(variable),tolower(var))){
  cat("Yes")
} else {
  cat("No")  
}

#4
print(str_replace(var,"industry","field"))

#5

words <- strsplit(var, " ")[[1]]
selected_words <- words[c(1, 2, 3, 4)]
print(paste(c(selected_words,"well known", words[c(6)]), collapse = ", "))

#6
var1 <- "180.5kilogram"
substring <- substr(var1,0,5)
var2 <- as.numeric(substring)
cat(class(var2))
cat(var2)

#7
date <- as.Date("2020-12-11")
date <- date+5
cat(as.character(date))







