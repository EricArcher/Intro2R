library(tidyverse)

iris[iris$Sepal.Length < 5, ]

filter(iris, Sepal.Length < 5)

iris %>%
  filter(Sepal.Length < 5 & Species == "versicolor")


iris[, "Species"]
iris[, c("Species", "Petal.Length")]

iris %>%
  select(Species, Petal.Length)

iris[, -(1:3)]
iris[, -Species]

iris %>%
  select(-Species)

iris %>% select(Sepal.Length:Petal.Length)

iris %>% select(starts_with("Petal"))
iris %>% select(contains("Len"))
iris %>% select(Species, everything())

iris %>%
  filter(Sepal.Length < 5.8) %>%
  select(Species, everything())

iris %>%
  arrange(Sepal.Length)

iris %>%
  arrange(desc(Sepal.Length), Sepal.Width)

iris %>%
  filter(Sepal.Length < 5.8) %>%
  select(Species, everything()) %>%
  arrange(desc(Species), Sepal.Length)

iris %>%
  mutate(
    petal.area = Petal.Length * Petal.Width,
    sepal.area = Sepal.Length * Sepal.Width,
    sepal.area.cm = sepal.area * (2.54 ^ 2)
  )


iris %>%
  filter(Sepal.Length < 5.8) %>%
  select(Species, everything()) %>%
  arrange(desc(Species), Sepal.Length) %>%
  mutate(
    petal.area = Petal.Length * Petal.Width,
    sepal.area = Sepal.Length * Sepal.Width,
    sepal.area.cm = sepal.area * (2.54 ^ 2)
  )


iris.smry <- iris %>%
  group_by(Species) %>%
  summarise(
    sample.size = n(),
    mean.petal.len = mean(Petal.Length),
    var.petal.len = var(Petal.Length)
  )

iris.mut <- iris %>%
  group_by(Species) %>%
  mutate(
    mean.petal.len = mean(Petal.Length)
  ) %>%
  select(mean.petal.len, Petal.Length, everything())

iris.pct <- iris %>%
  group_by(Species) %>%
  mutate(
    pct.max = Petal.Length / max(Petal.Length)
  ) %>%
  select(pct.max, Species, Petal.Length)


my.iris <- iris
rownames(my.iris) <- paste("row number", 1:nrow(iris))

myFunc <- function(df, r) {
  df[r, ]
}

my.iris.tbl <- tibble(my.iris)

my.iris.grp <- my.iris %>%
  rownames_to_column("row.id") %>%
  group_by(Species) %>%
  mutate(pct.max = Petal.Length / max(Petal.Length)) %>%
  as.data.frame %>%
  column_to_rownames("row.id")


## left_join

x.df <- data.frame(
  a = sample(letters, 15, T),
  b = runif(15),
  stringsAsFactors = FALSE
)

y.df <- data.frame(
  a = sample(letters, 15, T),
  c = runif(15, 100, 200),
  stringsAsFactors = FALSE
)

xy.left <- left_join(x.df, y.df, by = "a")

x.df %>% left_join(y.df, by = "a")


data.frame(
  a = sample(letters, 15, T),
  b = runif(15),
  stringsAsFactors = FALSE
) %>%
  left_join(
    data.frame(
      a = sample(letters, 15, T),
      c = runif(15, 100, 200),
      stringsAsFactors = FALSE
    ),
    by = "a"
  )


iris.smry <- iris %>%
  pivot_longer(-Species) %>%
  group_by(Species, name) %>%
  summarize(mean = mean(value)) %>%
  pivot_wider(names_from = name, values_from = mean)


iris.long <- iris %>%
  pivot_longer(-Species, names_to = "variable")

ggplot(iris.long, aes(value)) +
  geom_histogram(aes(color = Species)) +
  facet_wrap(~ variable)

ggplot(iris.long, aes(value)) +
  geom_histogram(aes(color = Species)) +
  facet_grid(Species ~ variable)

iris %>%
  filter(Petal.Width < 2) %>%
  pivot_longer(-Species, names_to = "variable") %>%
  ggplot(aes(value)) +
    geom_histogram(aes(color = Species)) +
    facet_grid(Species ~ variable)


iris %>%
  select(-Species) %>%
  pivot_longer(-Sepal.Length)



