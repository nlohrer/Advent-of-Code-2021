data <- read.fwf("input", widths = rep(1, 12))

bitVectorToDecimal <- function(vec) {
  powerVec <- rep(2, length(vec)) ^ ((length(vec) - 1) : 0)
  return(sum(vec * powerVec))
}

gammaBool <- sapply(data, sum) < nrow(data) / 2
gammaBin <- as.integer(gammaBool)
epsilonBin <- as.integer(!gammaBool)

gamma <- bitVectorToDecimal(gammaBin)
epsilon <- bitVectorToDecimal(epsilonBin)

powerConsumption <- gamma * epsilon

print(powerConsumption)