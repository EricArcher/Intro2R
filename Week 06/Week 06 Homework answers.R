rm(list = ls())

#' 1. Write a function that returns the mean, median, and
#' standard deviation of a vector of numbers.
#'
vecSmry <- function(x) {
  c(
    mean = mean(x, na.rm = TRUE),
    median = median(x, na.rm = TRUE),
    sd = sd(x, na.rm = TRUE)
  )
}

x <- sample(1:1000, 100, replace = TRUE)
vecSmry(x)


#' 2. Use the function from #1 to write a second function that
#' returns a summary of the temperature for a CTD station. Assume the
#' data is being input in the same form as the data in `ctd.csv`.
#'
stationTempSmry <- function(station, df) {
  temp <- df[df$station == station, "temp"]
  vecSmry(temp)
}

ctd <- read.csv("ctd.csv", stringsAsFactors = FALSE)
stationTempSmry("Station.1", ctd)
stationTempSmry("Station.5", ctd)


#' 3. Change the function in #2 to include the amount of missing
#' temperature data at the station.
#'
stationTempSmry2 <- function(station, df) {
  temp <- df[df$station == station, "temp"]
  c(
    vecSmry(temp),
    num.NAs = sum(is.na(temp))
  )
}

stationTempSmry2("Station.6", ctd)
stationTempSmry2("Station.3", ctd)


#' 4. Change the function in #3 to produce an error if the station
#' doesn't exist.
#'
stationTempSmry3 <- function(station, df) {
  if(!station %in% df$station) stop("'", station, "' does not exist", sep = "")
  temp <- df[df$station == station, "temp"]
  c(
    vecSmry(temp),
    num.NAs = sum(is.na(temp))
  )
}


stationTempSmry3("Station.5", ctd)
stationTempSmry3("Station.50", ctd)


#' 5. Create a function that returns a new data frame with separate
#' columns for year, month, day, and one POSIXct date column.
#'
parseCTDdate <- function(df) {
  dt <- as.POSIXlt(df$sample_date, format = "%Y-%m-%d")
  df$year <- dt$year + 1900
  df$month <- dt$mon + 1
  df$day <- dt$mday
  df$date <- as.POSIXct(dt)
  first.cols <- c("station", "date", "year", "month", "day")
  df[, c(first.cols, setdiff(colnames(df), c(first.cols, "sample_date")))]
}

new.ctd <- parseCTDdate(ctd)
str(new.ctd)


#' 6. Change the function in #5 to accept either a data frame or the
#' name of the file and produce the same output.
#'
parseCTDdate <- function(df) {
  if(is.character(df)) df <- read.csv(df, stringsAsFactors = FALSE)
  dt <- as.POSIXlt(df$sample_date, format = "%Y-%m-%d")
  df$year <- dt$year + 1900
  df$month <- dt$mon + 1
  df$day <- dt$mday
  df$date <- as.POSIXct(dt)
  first.cols <- c("station", "date", "year", "month", "day")
  df[, c(first.cols, setdiff(colnames(df), c(first.cols, "sample_date")))]
}

new.ctd <- parseCTDdate(ctd)
str(new.ctd)
new.ctd2 <- parseCTDdate("ctd.csv")
str(new.ctd2)
