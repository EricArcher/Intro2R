rm(list = ls())

#' 1. Use the CTD data for Station 1 on 2012-11-08 to create the
#' following contour plot of temperature with depth.
#'
ctd <- read.csv("ctd.csv", stringsAsFactors = FALSE)
ctd.1 <- ctd[ctd$station == "Station.1" & ctd$sample_date == "2012-11-08", ]
ctd.1 <- ctd.1[order(ctd.1$depth), ]

plot(
  ctd.1$temp, ctd.1$depth,
  type = "l",
  ylim = rev(range(ctd.1$depth)),
  col = "red",
  xlab = "Temperature (C)",
  ylab = "Depth (m)"
)


#' 2. Create a function that produces the above plot for a cast
#' from any station and date. It should issue an error (see `?stop`)
#' if a cast for the given combination can't be found.
#'
plotTemp <- function(station, date, df) {
  df.cast <- df[df$station == station & df$sample_date == date, ]
  if(nrow(df.cast) < 1) stop("Sorry, that cast can't be found.")
  df.cast <- df.cast[order(df.cast$depth), ]

  plot(
    df.cast$temp, df.cast$depth,
    type = "l",
    ylim = rev(range(df.cast$depth)),
    col = "red",
    xlab = "Temperature (C)",
    ylab = "Depth (m)",
    main = paste(station, ":", date)
  )
}

plotTemp("Station.28", "2010-01-07", ctd)
plotTemp("Station.7", "2010-03-17", ctd)
plotTemp("Station.37", "2010-01-05", ctd)

#' 3. Create the following plot which overlays temperature traces
#' for all casts at Station.1. A hint is to first clear the graphics
#' window with `plot.new`, then set up coordinates of the right size
#' with `plot.window`. You will also need to use the `for` function.
#'
ctd.1 <- ctd[ctd$station == "Station.1", ]

plot.new()
plot.window(xlim = range(ctd.1$temp), ylim = rev(range(ctd.1$depth)))
box()
axis(1)
axis(2)
title(xlab = "Temperature (C)", ylab = "Depth (m)")

for(dt in unique(ctd.1$sample_date)) {
  ctd.date <- ctd.1[ctd.1$sample_date == dt, ]
  ctd.date <- ctd.date[order(ctd.date$depth), ]
  lines(ctd.date$temp, ctd.date$depth)
}

#' 4. Color the lines in #3 based on season: Winter = Dec-Feb (blue),
#' Spring = Mar-May (green), Summer = Jun-Aug (red),
#' Fall = Sep-Nov (orange).
#'
month <- as.numeric(substr(ctd.1$sample_date, 6, 7))
ctd.1$season <- ifelse(
  month %in% c(12, 1, 2),
  "winter",
  ifelse(
    month %in% 3:5,
    "spring",
    ifelse(
      month %in% 6:8,
      "summer",
      "fall"
    )
  )
)

season.color <- c(
  winter = "blue", spring = "green", summer = "red", fall = "orange"
)

plot.new()
plot.window(xlim = range(ctd.1$temp), ylim = rev(range(ctd.1$depth)))
box()
axis(1)
axis(2)
title(xlab = "Temperature (C)", ylab = "Depth (m)")

for(dt in unique(ctd.1$sample_date)) {
  ctd.date <- ctd.1[ctd.1$sample_date == dt, ]
  ctd.date <- ctd.date[order(ctd.date$depth), ]
  lines(
    ctd.date$temp,
    ctd.date$depth,
    col = season.color[ctd.date$season]
  )
}
