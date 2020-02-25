rm(list = ls())

plot(iris$Sepal.Length, iris$Sepal.Width)


plot(iris$Sepal.Length, iris$Sepal.Width, col = "red")

plot(iris$Sepal.Length, iris$Sepal.Width, col = "red",
     col.lab = "green")


# coloring based on another vector
plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species)

x <- iris
x$Species <- as.character(x$Species)

spp.cols <- c(
  versicolor = "purple",
  virginica = "salmon",
  setosa = "midnightblue"
)

plot(x$Sepal.Length, x$Sepal.Width, col = spp.cols[x$Species])


plot(
  x$Sepal.Length,
  x$Sepal.Width,
  col = spp.cols[x$Species],
  xlab = "Sepal Length",
  ylab = "Sepal Width",
  main = "", #"Plot of Sepal width vs length",
  axes = F
)
points(runif(5, 4.3, 7.9), runif(5, 2, 4), col = "red", bg = "orange",
       pch = 23, cex = 3)
axis(1, seq(min(x$Sepal.Length), max(x$Sepal.Length), length.out = 5))
axis(2)
mtext("Plot of Sepal width vs length", 3)
box(bty = "c")

hist(x$Sepal.Length, 15)
plot(density(x$Sepal.Length), col = "darkgreen", lwd = 5, main = "my density")

op <- par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))
plot(x$Sepal.Length, x$Sepal.Width)
par(op)



# ggplot2
if(!require(ggplot2)) stop("install ggplot2!!")
if(!require(ggplot2)) install.packages("ggplot2")



ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  xlab("Sepal Length") +
  ylab("Sepal Width")


ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title")


ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title")

ggplot(iris) +
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species), shape = 17) +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species, shape = Species), size = 3) +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species, shape = Species), size = 5, alpha = 0.5) +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(fill = Species), color = "white", shape = 21, size = 5, alpha = 0.5) +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(fill = Species), color = "white", shape = 21, size = 5, alpha = 0.5) +
  scale_fill_manual(values = spp.cols) +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title")


mean.len <- tapply(iris$Sepal.Length, iris$Species, mean)
mean.width <- tapply(iris$Sepal.Width, iris$Species, mean)
spp.means <- data.frame(
  Species = names(mean.len),
  length = mean.len,
  width = mean.width
)


ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(fill = Species), color = "white", shape = 21, size = 5, alpha = 0.5) +
  geom_label(aes(x = length, y = width, label = Species), data = spp.means) +
  scale_fill_manual(values = spp.cols) +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title")


ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram() +
  facet_wrap(~ Species)

ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram() +
  facet_wrap(~ Species, ncol = 1, scales = "free")

ggplot(mtcars, aes(mpg, disp)) +
  geom_point() +
  facet_grid(cyl ~ gear)

my.theme <- theme(
    axis.title.x = element_text(color = "red"),
    panel.grid.major = element_line(color = "blue"),
    legend.position = "none"
  )

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(fill = Species), color = "white", shape = 21, size = 5, alpha = 0.5) +
  geom_label(aes(x = length, y = width, label = Species), data = spp.means) +
  scale_fill_manual(values = spp.cols) +
  labs(x = "Sepal Length", y = "Sepal Width", title = "My plot title") +
  my.theme


