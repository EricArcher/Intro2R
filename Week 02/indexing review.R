rm(list = ls())

# indexing by numerics
num.vec <- 35:50

# extracting tenth element
num.vec[10]

# assign tenth element to object
elem.10 <- num.vec[10]

# show fifth and eigth elements
num.vec[c(5, 8)]

i <- c(5, 8)
num.vec[i]

# same element multiple times
num.vec[c(11, 11, 11)]

num.vec[rep(11, 3)]

# exclude third and ninth element
num.vec[c(-3, -9)]


## indexing by character (names)

named.vec <- c(5, 10, 15, 20)
names(named.vec) <- c("first", "ten", "third", "last")

# get second element (named "ten")
named.vec["ten"]

# get first and fourth element
named.vec[c("first", "last")]
named.vec[c("last", "first")]

named.vec.2 <- c(marge = 5, todd = 10, fred = 11)

# if name has a space
named.vec.3 <- c('hello world' = 1, today = 5)


## sample function

# random permutation
sample(1:10)

# subsample
sample(1:10, 5)

# subsample with repeats
sample(1:10, 5, rep = TRUE)

# resample
sample(1:10, 20, rep = TRUE)

sample(letters, 40, rep = T)


## indexing by logicals

# R ALWAYS returns values that correspond to TRUE
x <- 1:3
x[c(T, F, T)]

ran.nums <- sample(1:100, 10)
lt.50 <- ran.nums < 50

ran.nums[lt.50]

ran.nums[ran.nums > 60]
