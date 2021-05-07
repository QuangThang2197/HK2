setwd('C:\\Users\\RED\\R')

selection_sort <- function(x){
  n <- length(x)
  for (i in 1 : (n - 1)){
    for (j in (i + 1) : n){
      if (x[j] < x[i]){
        temp <- x[i]
        x[i] <- x[j]
        x[j] <- temp
      }
    }
  }
  return(x)}

dulieu <- c(1,2,6,7,98,75,46)
selection_sort(dulieu)

seftsort <- function(x){
  if(length(x) > 0){
    min <- which.min(x)
    c(x[min], seftsort(x[-min]))
  }else x
}

dulieu <- c(1,2,6,7,98,75,46)
seftsort(dulieu)

insertion_sort <- function(x){
  n <- length(x)
  for (i in 2:n){
    temp <- x[i]
    j = i - 1
    while ((x[j] > temp) && (j > 0)){
      x[(j + 1)] = x[j]
      j <- j - 1
    }
    x[(j + 1)] = temp
  }
  return(x)
}

dulieu <- c(1,3,2,98,75,46,6,7)
insertion_sort(dulieu)


bubble_sort <- function(x){
  n <- length(x)
  for(j in 1:(n - 1)){
    for(i in 1:(n - j)){
      if(x[i] > x[i + 1]){
        temp <- x[i]
        x[i] <- x[i + 1]
        x[i + 1] <- temp
      }
    }
  }
  return(x)
}

x<-c(2,1,7,9,3,6,20,30,3,5,8,6,3)
bubble_sort(x)



bubble_sort1 <- function(x){
  i = 1
  repeat{
    no_exchange = 1
    n = length(x)
    for (j in n:2){
      if (x[j - 1] > x[j]){
        temp = x[(j - 1)]
        x[(j - 1)] = x[j]
        x[j] = temp
        no_exchange = 0
        
      }
    }
    i = i + 1
    if ((no_exchange || i == (n - 1))){break}
  }
  return(x)
}

x<-c(2,1,7,9,3,6,20,30,3,5,8,6,3)
bubble_sort1(x)





selectionSort <- function(arr) {
  # Find the smallest value in the list (ok sort of cheating, because we're using the highliy optimized min() function).
  smallest <- min(arr)
  rest <- arr[arr != smallest]
  
  if (length(rest) > 1) {
    rest <- selectionSort(arr[arr != smallest])
  }
  
  c(smallest, rest)
}

quickSort <- function(arr) {
  # Pick a number at random.
  mid <- sample(arr, 1)
  
  # Place-holders for left and right values.
  left <- c()
  right <- c()
  
  # Move all the smaller values to the left, bigger values to the right.
  lapply(arr[arr != mid], function(d) {
    if (d < mid) {
      left <<- c(left, d)
    }
    else {
      right <<- c(right, d)
    }
  })
  
  if (length(left) > 1) {
    left <- quickSort(left)
  }
  
  if (length(right) > 1) {
    right <- quickSort(right)
  }
  
  # Finally, return the sorted values.
  c(left, mid, right)
}

x <- selectionSort(c(2,1,1,1))
quickSort(x)

