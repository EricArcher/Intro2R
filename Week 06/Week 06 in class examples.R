testFunc <- function() {
  print("hello")
  print("there")
}

isBetween <- function(x, low, high) {
  result <- x > low & x < high
  result
}

isBetween(x = 1, low = 0, high = 10)
isBetween(x = 11, low = 0, high = 10)

isBetween.2 <- function(x, low, high) {
  result <- x > low & x < high
  return(result)
}

isBetween.3 <- function(x, low, high) {
  return("hello")
  result <- x > low & x < high
  result
}

isBetween.4 <- function(x, low, high) {
  result <- x > low & x < high
  invisible(result)
}

isBetween.5 <- function(x, low = 0, high = 10) {
  result <- x > low & x < high
  result
}

isBetween.5 <- function(x, low = 0, high) {
  result <- x > low & x < high
  result
}


isBetween.6 <- function(x, compare) {
  result <- x > compare[1] & x < compare[2]
  result
}

isBetween.7 <- function(x, compare, censor = 10) {
  result <- x > compare[1] & x < compare[2]
  result
}

ranRows <- function(df, n, replace = FALSE) {
  i <- sample(1:nrow(df), n, replace = replace)
  df[i, ]
}

ranRows.2 <- function(df, n, ...) {
  i <- sample(1:nrow(df), n, ...)
  df[i, ]
}

ranRows.if.1 <- function(df, n) {
  replace <- FALSE
  if(n > nrow(df)) replace <- TRUE
  i <- sample(1:nrow(df), n, replace = replace)
  df[i, ]
}

ranRows.if.2 <- function(df, n) {
  replace <- if(n > nrow(df)) {
    TRUE
  } else {
    FALSE
  }
  i <- sample(1:nrow(df), n, replace = replace)
  df[i, ]
}


ranRows.if.3 <- function(df, n) {
  i <- if(n > nrow(df)) {
    sample(1:nrow(df), n, replace = T)
  } else {
    sample(1:nrow(df), n)
  }
  df[i, ]
}




ifelse(5 < 1:10, "yes", "no")



isBetween.ifelse <- function(x, low, high) {
  ifelse(x == low, "equal.to.low", x > low & x < high)
}



for(i in mtcars) print(mean(i))


x <- 1:20
z <- sample(c("a", "b"), 20, T)

x.split <- split(x, z)

mtcars.cyl <- split(mtcars, mtcars$cyl)

for(cyl in mtcars.cyl) {
  mean.disp <- mean(cyl$disp)
  cyl.val <- unique(cyl$cyl)
  output <- paste("The mean displacement for", cyl.val, "cylinders is", mean.disp)
  print(output)
}

for(cyl in names(mtcars.cyl)) {
  mean.disp <- mean(mtcars.cyl[[cyl]]$disp)
  output <- paste("The mean displacement for", cyl, "cylinders is", mean.disp)
  print(output)
}

# ------ lapply

for(j in 1:6) print(sample(j))

x <- lapply(6:15, sample, size = 3)

sapply(6:15, sample, size = 3)

sapply(6:15, sample)

x <- sapply(mtcars, mean)

sapply(mtcars, range)


sapply(mtcars.cyl, nrow)


meanDisp <- function(df) mean(df$disp)

sapply(mtcars.cyl, meanDisp)

sapply(mtcars.cyl, function(df) mean(df$disp))


sapply(mtcars.cyl, function(df) {
  mean.disp <- mean(df$disp)
  mean.hp <- mean(df$hp)
  c(mean.disp = mean.disp, mean.hp = mean.hp)
})

lapply(mtcars.cyl, function(df) {
  mean.disp <- mean(df$disp)
  mean.hp <- mean(df$hp)
  c(mean.disp = mean.disp, mean.hp = mean.hp)
})


sapply(state.x77, max)


apply(state.x77, 2, max)


apply(state.x77, 2, function(x) {
  x["California"] / x["Oregon"]
})

state.x77["California", ] / state.x77["Oregon", ]

mat <- matrix(1:24, nrow = 4)
apply(mat, 1, var)
apply(mat, 2, range)



mean.hp <- tapply(mtcars$hp, list(cyl = mtcars$cyl, gear = mtcars$gear), mean)

cyl.by <- by(mtcars, mtcars$cyl, function(df) {
  c(hp = mean(df$hp), disp = mean(df$disp))
})


cyl.by.mat <- rbind(cyl.by[[1]], cyl.by[[2]], cyl.by[[3]])


do.call(rbind, cyl.by)

sample(1:100, 50, T)

sample.list <- list(x = 1:100, size = 50, replace = TRUE)
do.call(sample, sample.list)

sample.list <- list(replace = TRUE, x = 1:100, size = 50)
do.call(sample, sample.list)


do.call(rbind, mtcars.cyl)









