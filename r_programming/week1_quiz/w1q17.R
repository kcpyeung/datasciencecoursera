x <- read.csv("hw1_data.csv")
ozone <- x["Ozone"]
good_ozone <- ozone[!is.na(ozone)]
mean(good_ozone)