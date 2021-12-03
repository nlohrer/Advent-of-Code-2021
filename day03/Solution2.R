data <- read.fwf("input", widths = rep(1, 12))

bitVectorToDecimal <- function(vec) {
  powerVec <- rep(2, length(vec)) ^ ((length(vec) - 1) : 0)
  return(sum(vec * powerVec))
}

findRating <- function(df, most) {
  myData <- unique(df)
  toReturn <- vector(length = 12)
  for (i in 1 : ncol(myData)) {
    
    if (nrow(myData) == 1) {
      currentDigit <- myData[1, i]
    } else {
      mostCommonNumberBool <- sum(myData[, i]) >= nrow(myData) / 2
      
      if (most) {
        currentDigit <- as.integer(mostCommonNumberBool)
      } else {
        currentDigit <- as.integer(!mostCommonNumberBool)
      }
      
    }
    
    myData <- myData[myData[,i] == currentDigit, ]
    toReturn[i] <- currentDigit
  }
  
  return(toReturn)
  return(myData[1])
}

oxyRating <- bitVectorToDecimal(findRating(data, T))
scrubRating <- bitVectorToDecimal(findRating(data, F))

lifeSupportRating <- oxyRating * scrubRating
print(lifeSupportRating)
