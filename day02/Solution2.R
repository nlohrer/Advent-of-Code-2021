data <- read.table("input", sep = " ", col.names = c("direction", "magnitude"))

position_horizontal <- 0
depth <- 0
aim <- 0

for (i in 1:nrow(data)) {
  x <- data$magnitude[i]
  if (data$direction[i] == "down") {
    aim <- aim + x
  } else if (data$direction[i] == "up") {
    aim <- aim - x
  } else {
    position_horizontal <- position_horizontal + x
    depth <- depth + (aim * x)
  }
}

result <- position_horizontal * depth
print(result)
