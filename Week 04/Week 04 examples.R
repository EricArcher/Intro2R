rm(list = ls())

# writing .csv file
write.csv(mtcars, "mtcars.csv")

mtcars.nr <- mtcars
rownames(mtcars.nr) <- NULL

write.csv(mtcars.nr, "mtcars.nr.csv")

mtcars.1 <- read.csv("mtcars.csv")


# writing .csv w/o rownames
write.csv(mtcars, "mtcars wo rownames.csv", row.names = F)
mtcars.2 <- read.csv("mtcars wo rownames.csv")

x <- mtcars

# saving rownames as columns
mtcars.3 <- mtcars
mtcars.3$car.names <- rownames(mtcars.3)

write.csv(mtcars.3, "mtcars rn as cols.csv", row.names = F)
mtcars.3.in <- read.csv("mtcars rn as cols.csv")


# beware of characters read in as factors
mtcars.3.in <- read.csv("mtcars rn as cols.csv", stringsAsFactors = FALSE)

x <- data.frame(lets = letters, stringsAsFactors = FALSE)

x <- data.frame(lets = letters)
x$lets <- as.character(x$lets)


# Missing data NAs
x <- c(1, NA, 3, 6, NA)
x

is.na(x)

x <- sample(c(NA, 1:5), 30, T)
mean(x)
mean(x, na.rm = TRUE)
min(x)

x[!is.na(x)]

x.omit <- na.omit(x)

# Lagged difference
x <- sample(1:5, 10, T)
diff(x)
diff(x, lag = 3)

# quantiles
x <- sample(1:1000, 100, T)
quantile(x, c(0.025, 0.975))


# Discrete values

x <- sample(letters, 40, replace = TRUE)


# Frequency table
x.freq <- table(x)

x.num <- sample(c(1:9, 50), 40, replace = TRUE)
x.num.freq <- table(x.num)


# 2-way frequency
table(x, x.num)

x.let <- sample(letters[1:5], 100, replace = T)
x.num <- sample(1:5, 100, replace = T)
let.num.freq <- table(x.let, x.num)

# change to data.frame
let.num.freq <- table(letters = x.let, numbers = x.num)
let.num.freq.df <- as.data.frame(let.num.freq)


my.lets <- c("a", "d", "c")

ran.lets <- sample(letters, 10)


# comparing vectors with %in%
mtcars[c("Merc 240D", "Merc 230", "Merc 280"), ]

mtcars[rownames(mtcars) %in% c("Merc 240D", "Merc 230", "Merc 280"), ]

mtcars[mtcars$gear == 4 | mtcars$gear == 5, ]
mtcars[mtcars$gear %in% c(4, 5), ]

mtcars[mtcars$carb %in% c(1, 3, 6), ]


# Set operations

union(c(1, 3, 5), c(2, 2, 1, 4))
unique(c(c(1, 3, 5), c(2, 2, 1, 4)))

intersect(c(1, 3, 5), c(2, 2, 1, 4))

setdiff(c(1, 3, 5), c(2, 2, 1, 4))
setdiff(c(2, 2, 1, 4), c(1, 3, 5))

mtcars[, setdiff(colnames(mtcars), c("mpg", "hp", "disp"))]

# which

x <- 1:5
which(x <= 2)
# first minimum value of a vector
which.min(mtcars$cyl)
# first maximum value of a vector
which.max(mtcars$disp)

x <- sample(1:5)
rev(x)

sort(x)
sort(x, decreasing = TRUE)


x
order(x)

x <- sample(letters[1:5])
x
order(x)




















