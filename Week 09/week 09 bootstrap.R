rm(list = ls())

n.ind <- sample(30:300, 1)
spp1.length <- rnorm(n.ind, 10, 3)

mean(spp1.length)
sd(spp1.length)

# randomly sample with replacement 100 times
ran.draw <- sapply(1:100, function(i) {
  x <- sample(spp1.length, length(spp1.length), replace = TRUE)
  mean(x)
})

mean(ran.draw)
quantile(ran.draw, p = c(0.025, 0.975))

hist(ran.draw)
abline(v = mean(spp1.length), col = "red")
