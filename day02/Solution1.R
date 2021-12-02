library(dplyr)

data <- read.table("input", sep = " ", col.names = c("direction", "magnitude"))

total_distances <- data %>% group_by(direction) %>% summarize(total_distance = sum(magnitude))

distances <- total_distances$total_distance
names(distances) <- total_distances$direction

distances["depth"] <- distances["down"] - distances["up"]

result <- distances["depth"] * distances["forward"]
print(result)