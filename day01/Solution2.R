data <- scan("input", sep = "\n")

measurementWindows <- vector(length = length(data) - 2)
for (i in 1:length(measurementWindows)) {
  measurementWindows[i] <- sum(data[i : (i + 2)])
}

amountOfIncreases <- sum(ifelse(diff(measurementWindows) > 0, 1, 0))
print(amountOfIncreases)