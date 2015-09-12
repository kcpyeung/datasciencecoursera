x <- read.csv("hw1_data.csv")
hot_high_ozone <- subset(x, x["Ozone"] > 31 & x["Temp"] > 90)
mean(hot_high_ozone[["Solar.R"]])
