## Aleksey Kramer
## Data Viz 200
## Homework 2

## Needs to be changed
setwd('C:\\Users\\Aleksey\\Documents\\School\\UW_Data_Visualization\\UW_Data_Visualization_200\\week2\\homework')
# setwd('C:\\Users\\db345c\\Desktop\\UW_TRAIN\\Data Vis 200')

require(openxlsx)

seattle_file = 'Seattle Crime Data 2014.xlsx'
seattle = read.xlsx(seattle_file, sheet = 1, startRow = 1, colNames = TRUE)

portland_file = 'Portland Crime Data 2014.xlsx'
portland = read.xlsx(portland_file, sheet = 1, startRow = 1, colNames = TRUE)

rm(seattle_file, portland_file)

seattle$Offense.Type =  as.factor(seattle$Offense.Type)
portland$Major.Offense.Type = as.factor(portland$Major.Offense.Type)

par(las=2)
par(mar=c(17,4,5,5))
par(mfrow=c(1,1))

cols <- c("blue")

png(filename="Seattle.jpeg", height=600, width=800)
barplot(sort(table(seattle$Offense.Type))[142:169],  ylim=c(0, 27000), col = cols, main="Seattle", ylab="Number of Incidents")
dev.off()

png(filename="Portland.jpeg", height=600, width=800)
barplot(sort(table(portland$Major.Offense.Type)), ylim=c(0, 27000), col = cols, main="Portland", ylab="Number of Incidents") # 27 offense types
dev.off()

