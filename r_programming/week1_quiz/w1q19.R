x <- read.csv("hw1_data.csv")
june <- subset(x, x["Month"] == 6)
mean(june[["Temp"]])
