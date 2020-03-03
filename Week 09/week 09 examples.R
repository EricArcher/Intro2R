x <- seq(-1, 1, 0.05)
lik <- dnorm(x)
plot(x, lik)

cum.prob <- pnorm(x)
plot(x, cum.prob)

quant <- qnorm(seq(0, 1, 0.05))
plot(quant, seq(0, 1, 0.05))

ran.nums <- rnorm(1000, 5, 3)
plot(1:length(ran.nums), ran.nums)
plot(density(ran.nums))

set.seed(5)
runif(5)

set.seed(1234)
sample(letters, 5)

sample(c(1, 5, 10))

runif(10, 1, 100)


# statistical tests

# random sample size
n.ind <- sample(30:300, 1)

# sample lengths
spp1 <- rnorm(n.ind, 10, 3)
spp2 <- rnorm(n.ind, 11, 4)

spp.ttest <- t.test(spp1, spp2)
spp.ttest.p <- t.test(spp1, spp2)$p.value
spp.ttest.p <- t.test(spp1, spp2)[["p.value"]]
spp.ttest.p <- t.test(spp1, spp2)[[3]]



# random sample size
n.ind <- sample(30:300, 1)

sd.t.test <- function(sd, n.ind) {
  # sample lengths
  spp1 <- rnorm(n.ind, 10, sd)
  spp2 <- rnorm(n.ind, 11, sd)
  t.test(spp1, spp2)$p.value
}

sd.vec <- seq(2, 5, 0.02)
sd.sapply <- sapply(sd.vec, sd.t.test, n.ind = 100)

plot(sd.vec, sd.sapply, type = "l")




# random sample size
n.ind <- sample(30:300, 1)

# sample lengths
spp1 <- rnorm(n.ind, 10, 3)
spp2 <- rnorm(n.ind, 11, 4)

length.df <- data.frame(
  length = c(spp1, spp2),
  spp = rep(1:2, each = n.ind)
)

spp.ttest <- t.test(length ~ spp, length.df)



# linear regression
plot(iris$Petal.Length, iris$Petal.Width)

# fit linear model
iris.lm <- lm(Petal.Width ~ Petal.Length, iris)

# plot fit
plot(iris$Petal.Length, iris$Petal.Width)
abline(iris.lm, col = "red", lwd = 2, lty = "dashed")

# save lm object
save(iris.lm, file = "iris lm.rdata")

rm(list = ls())
load("iris lm.rdata")

# create data for prediction
new.data <- runif(4, min(iris$Petal.Length), max(iris$Petal.Length))
new.df <- data.frame(Petal.Length = new.data)

# predict new data
new.data.pred <- predict(iris.lm, new.df, interval = "confidence")




points(new.df$Petal.Length, new.data.pred, pch = 24, bg = "green", cex = 3)
