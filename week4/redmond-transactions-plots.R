install.packages("ggplot2")
install.packages("GGally")
install.packages("hexbin")

library(ggplot2)
library(GGally)
library(hexbin)


# here are some ideas for how to inspect data sets in R:
# http://www.rforexcelusers.com/book/data-frames/inspect-data-frame/

# you'll need to change this path to a path on your machine
dat = read.csv("/Users/tommy/Downloads/redmond-transactions.csv", header = TRUE)

str(dat)
head(dat)
tail(dat)
names(dat)
summary(dat)
str(dat)
nrow(dat)
dim(dat)

unique(dat$bedrooms)
table(dat$bedrooms)
head(dat$bedrooms)
str(dat$bedrooms)
summary(dat$bedrooms)
length(dat$bedrooms)

hist(dat$bedrooms)
plot(dat$bedrooms)
pairs(dat$bedrooms)


# turn the date field into a real date object
dat$document_date <- as.Date(dat$document_date, format = "%Y-%m-%d")

# filter out bad prices and bad latitudes
get.rows <- dat$lat > 47.6 & dat$sale_price > 10000 & dat$sale_price < 1800000
dat <- dat[get.rows, ]

# limit to a few interesting columns
small_ds = subset(dat, select=c("document_date", "sale_price", "sq_ft_tot_living", "yr_built", "bedrooms"))
get.rows <- small_ds$document_date >= as.Date("2015-01-01") & small_ds$sq_ft_tot_living < 7500 & small_ds$bedrooms < 8
df <- small_ds[get.rows, ]


# show the correlation matrix.
ggpairs(df)


# override the ggpairs functionality
p <- ggpairs(df, lower="blank")
seq <- 1:ncol(df)
for (x in seq)
    for (y in seq) 
        if (y>x){ 
            new_p = ggplot(df, aes_string(x=names(df)[x],y=names(df)[y])) + 
                    stat_binhex(bins=16) + 
                    scale_fill_continuous(breaks=seq(30,100,3))
            p <- putPlot(p, new_p, y,x)
        }
# show the modified plots
p


# A crude attempt at a heatmap
corr_data = subset(dat, select=c("document_date", "sale_price", "sq_ft_tot_living", "yr_built", "bedrooms", "sq_ft_lot", "bath_full_count", "bldg_grade", "lon", "lat"))
get.rows <- corr_data$document_date >= as.Date("2015-01-01") & corr_data$sale_price > 20000 & corr_data$sale_price < 2000000 & corr_data$sq_ft_tot_living < 7500 & corr_data$bedrooms < 8
corr_data <- corr_data[get.rows, ]

# show the headmat
ggplot(data=corr_data, aes(y=round(lat*400)/400.0, x=round(lon*300)/300.0)) + geom_raster(aes(fill=sale_price)) + scale_fill_distiller(palette = "Spectral")
