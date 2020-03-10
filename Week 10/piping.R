x <- runif(100)
x.q <- quantile(x, c(0.025, 0.975))
x.q.diff.1 <- diff(x.q)


x.q.diff.2 <- diff(quantile(runif(100), c(0.025, 0.975)))


library(magrittr)

10 %>% runif
1:10 %>% sample
c("hello", "there") %>% paste(1:4)
c("hello", "there") %>%  paste(collapse = "_")
10 %>% runif(100, 200)

10 %>% runif(100, 200) %>% mean()

10 %>% runif %>% quantile(c(0.025, 0.975)) %>% diff

x <- runif(10) %>%
  quantile(c(0.025, 0.975)) %>%
  diff %>%
  print


