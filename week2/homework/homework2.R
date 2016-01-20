## Aleksey Kramer
## Data Viz 200
## Homework 2

## Needs to be changed
setwd('C:\\Users\\Aleksey\\Documents\\School\\UW_Data_Visualization\\UW_Data_Visualization_200\\week2\\homework')

require(openxlsx)

seattle_file = 'Seattle Crime Data 2014.xlsx'
seattle = read.xlsx(seattle_file, sheet = 1, startRow = 1, colNames = TRUE)

portland_file = 'Portland Crime Data 2014.xlsx'
portland = read.xlsx(portland_file, sheet = 1, startRow = 1, colNames = TRUE)

rm(seattle_file, portland_file)

seattle$Offense.Type =  as.factor(seattle$Offense.Type)
portland$Major.Offense.Type = as.factor(portland$Major.Offense.Type)

plot(sort(table(seattle$Offense.Type))[142:169],  ylim=c(0, 6000))
plot(sort(table(portland$Major.Offense.Type)), ylim=c(0, 6000)) # 27 offense types


