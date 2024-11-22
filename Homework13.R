#1

convert <- function(celsius){
  farenhait <- celsius * (9/5)+32
  return (farenhait)
}

print(convert(40))

#3

check <- function(number){
  if (number>0){
    return ("Positive")
  }else if(number<0){
    return ("Negative")
  }else{
    return("Zero")
  }
}

print(check(45))
print(check(0))
print(check(-5))













