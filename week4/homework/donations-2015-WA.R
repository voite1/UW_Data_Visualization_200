setwd('C:\\Users\\Aleksey\\Documents\\School\\UW_Data_Visualization\\UW_Data_Visualization_200\\week4\\homework')

data = read.csv('donations-2015-WA.txt', header = TRUE, na.strings = c("", "NA"))
data = data[complete.cases(data),]

library(ggplot2)
ggplot(data=data, aes(DT$transaction_amt)) + 
  geom_histogram(breaks=seq(0, 2700, by=50), 
                 col="black", 
                 fill="blue")

