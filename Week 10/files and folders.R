dir()

# loop through all csv files, read them into a list
csv.files <- dir("Prep", pattern = ".csv", full.names = TRUE)
file.list <- lapply(csv.files, read.csv)


nrow.fname <- function(fname) {
  if(!file.exists(fname)) stop(fname, " does not exist")
  df <- read.csv(fname)
  nrow(df)
}

nrow.fname("Missing.csv")


dir.create("new dir")

setwd("new dir")
write.csv(iris, "iris.csv")
setwd("..")

new.fname <- file.path("new dir", "iris2.csv")
write.csv(iris, new.fname)

new.dir <- dir("new dir", full.names = T)
file.remove(new.dir[1])

file.remove("new dir")

unlink("new dir", recursive = TRUE)

week1 <- dir("Week 01", full.names = TRUE, recursive = TRUE)
