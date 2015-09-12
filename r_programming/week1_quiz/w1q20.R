x <- read.csv("hw1_data.csv")
may <- subset(x, x["Month"] == 5)
may_has_ozone <- subset(may, !is.na(may["Ozone"]))
max(may_has_ozone[["Ozone"]])
