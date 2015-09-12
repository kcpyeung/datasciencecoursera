x <- read.csv("hw1_data.csv")
ozone <- x["Ozone"]
missing_ozone <- ozone[is.na(ozone)]
length(missing_ozone)