rm(list = ls())

n.ind <- sample(30:300, 1)

spp1 <- rnorm(n.ind, 10, 3)
spp2 <- rnorm(n.ind, 11, 4)

spp.df <- data.frame(
  length = c(spp1, spp2),
  spp = rep(c("spp1", "spp2"), each = n.ind)
)

spp1.mean <- mean(spp.df[spp.df$spp == "spp1", "length"])
spp2.mean <- mean(spp.df[spp.df$spp == "spp2", "length"])
mean.diff <- spp1.mean - spp2.mean
t.test(spp1, spp2)$p.value


null.df <- spp.df

null.dist <- sapply(1:10000, function(i) {
  null.df$spp <- sample(null.df$spp)
  null.spp1.mean <- mean(null.df[null.df$spp == "spp1", "length"])
  null.spp2.mean <- mean(null.df[null.df$spp == "spp2", "length"])
  null.spp1.mean - null.spp2.mean
})

hist(null.dist)
abline(v = mean.diff, col = "red", lwd = 3)
summary(null.dist)

sum(null.dist >= mean.diff)
1 - mean(null.dist >= mean.diff)



iris.pairs <- combn(unique(as.character(iris$Species)) , 2)

pl.diff <- function(spp) {
  spp1.pl <- iris[iris$Species == spp[1], "Petal.Length"]
  spp2.pl <- iris[iris$Species == spp[2], "Petal.Length"]
  mean(spp1.pl) - mean(spp2.pl)
}

pl.diff(c("virginica", "versicolor"))

apply(iris.pairs, 2, pl.diff)

combn(unique(as.character(iris$Species)), 2, pl.diff)

