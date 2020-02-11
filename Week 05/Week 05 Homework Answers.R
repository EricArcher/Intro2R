rm(list = ls())

# Week 05 Homework Answers

#' 1. Load the `ctd.csv` data. Add three columns to the data
#' frame for year, month, and day extracted from the
#' `sample_date` column.
#'
ctd <- read.csv("ctd.csv", stringsAsFactors = FALSE)
ctd$year <- as.numeric(substr(ctd$sample_date, 1, 4))
ctd$month <- as.numeric(substr(ctd$sample_date, 6, 7))
ctd$day <- as.numeric(substr(ctd$sample_date, 9, 10))
str(ctd)

# 2. Create a column representing the month name
ctd$month.name <- month.name[ctd$month]
str(ctd)

#' 3. Create a frequency table of the number of casts by
#' year and month
#'
ctd.surf <- ctd[ctd$depth == 1, ]
cast.freq <- table(ctd.surf$year, ctd.surf$month)
cast.freq

#' 4. Create a frequency table of the number
#' of casts by unique combinations of year and month
#'
year.month <- paste(ctd$year, "_", ctd$month, sep = "")
year.month.freq <- table(year.month)
head(year.month.freq)

#' 5. Create a data frame with casts from five random dates.
#' How many times was each station sampled on each date?
#'
sample.dates <- unique(ctd$sample_date)
ran.dates <- sample(sample.dates, 5)
ctd.5 <- ctd[ctd$sample_date %in% ran.dates, ]
str(ctd.5)
ctd.5.surf <- ctd.5[ctd.5$depth == 1, ]
table(ctd.5.surf$station, ctd.5.surf$sample_date)

#' 6. What is the mean number of days between sampling
#' dates in the original ctd data frame?
#'
sample.dates <- as.POSIXct(sample.dates, format = "%Y-%m-%d")
sample.dates <- sort(sample.dates)
mean(sample.dates[length(sample.dates):2] - sample.dates[(length(sample.dates) - 1):1])

#' 7. Sort the ctd data frame by station, date, and depth.
#' Make sure the stations are correctly sorted numerically.
ctd <- ctd[order(nchar(ctd$station), ctd$station, ctd$sample_date, ctd$depth), ]
head(ctd)
tail(ctd)

