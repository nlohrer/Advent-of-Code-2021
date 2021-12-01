data <- scan("input", sep = "\n")

measurementWindows <- vector(length = length(data) - 2)
for (i in 1:length(measurementWindows)) {
  measurementWindows[i] <- sum(data[i : (i + 2)])
}

amountOfIncreases <- sum(ifelse(diff(measurementWindows) > 0, 1, 0))
print(amountOfIncreases)

#alternative
data <- scan("input", sep = "\n")

measurementWindowsAlt <- data[c(-length(data), -(length(data) - 1))] + data[c(-1, -length(data))] + data[c(-1, -2)]

amountOfIncreasesAlt <- sum(ifelse(diff(measurementWindowsAlt) > 0, 1, 0))
print(amountOfIncreasesAlt)