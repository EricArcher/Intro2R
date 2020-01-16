rm(list = ls())

## Factors
x <- factor(c("yellow", "blue", "green", "blue", "Blue", "yellow"))
x

# levels and labels examples

x <- sample(letters[1:4], 20, replace = TRUE)
xf <- factor(x)
xf

# the levels
levels(xf)

# assign different levels at the beginning
xf.lvl <- factor(x, levels = c("b", "d", "a", "c"))


# ** Matrices **
mat <- matrix(1:24, nrow = 4)
length(mat)
nrow(mat)
ncol(mat)
dim(mat)

# indexing by numerics
mat[2, 3]

# all columns for fourth row
mat[4, ]

# all rows for third column
mat[, 3]

mat[c(1, 4), 5]
mat[c(1, 4), c(3, 5)]

mat[c(1, 4), 5, drop = F]
mat[2, c(1, 4), drop = F]

mat[-1, -4]
mat[-1, c(3, 5)]

mat[2, 3] <- 500
mat[c(1, 4), c(2, 6)] <- c(100, 1000, 200, 2000)

mat.plus.col <- cbind(mat, 100:103)
mat.ins <- cbind(mat[, 1:3], 500:503, mat[, 4:6])
mat.row.ins <- rbind(mat[1, ], 5, mat[2:4, ])

rownames(mat) <- c("first", "second", "third", "fourth")
colnames(mat) <- letters[1:6]

mat["third", ]
mat["third", "e"]
mat["third", 5]
mat[c("first", "fourth"), c("a", "e", "c")]
mat[, c("e", "e", "c", "e")]

i <- mat[, "f"] < 30

mat[i, ]
mat[, i]

mat[mat[, "f"] < 30, ]


# ** Lists **
x <- list(1, letters[1:5], matrix(100:119, nrow = 5))
length(x)

x2 <- x[2]
x1.3 <- x[c(1, 3)]

x.elem2 <- x[[2]]

named.x <- list(
  nums = 1,
  lets = letters[1:5],
  mat = matrix(100:119, nrow = 5)
)

named.x[[2]]
named.x$lets
named.x[["lets"]]

named.x$new.elem <- "hello"
named.x$lets <- NULL

# add a list
named.x$add.list.ex <- list(4:5, LETTERS, month.abb)



# ** data frames **

df <- data.frame(
  id = 1:26,
  let = letters,
  x = 10:35
)

df[4, 2]

# filtering rows
i <- df[, "x"] > 20
df[i, ]

j <- df[, "id"] < 16
df[j, ]


df[df[, "x"] > 20 & df[, "id"] < 16, ]

df[i & j, ]

df[df$x > 20 & df$id < 16, ]


virg <- iris[iris$Species == "virginica", c("Sepal.Length", "Sepal.Width")]

large <- iris[iris$Petal.Width > 1.199, ]

sml <- iris$Petal.Length < 3
num.sml <- sum(iris$Petal.Length < 3)


my.iris <- iris
my.iris$sml <- iris$Petal.Length < 3
