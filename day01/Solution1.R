data <- scan("input", sep = "\n")

amountOfIncreases <- sum(ifelse(diff(data) > 0, 1, 0))
print(amountOfIncreases)