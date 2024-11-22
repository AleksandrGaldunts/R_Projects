#1
n <- 10 
x <- 0
y <- 1  
counter <- 1
while (counter <= n) {
  cat(x, " ")
  tmp <- x + y
  x <- y
  y <- tmp
  counter <- counter + 1
}

#2

sum_function <- function(){
  sum <- 0
  for (i in 0:100){
    if (i%%2==0){
      sum <- sum + i
    }
  }
  return(sum)
}
print(sum_function())


#3

sum <- 0
for (i in (0:100)){
  if (i%%5==0){
    sum <- sum +i
  }
}
print(sum)


n <- 100
i<-0
sum <- 0
while (i<=n){
  if (i%%5==0){
    sum <- sum + i
  }
  i = i + 1
}
print(sum)
























