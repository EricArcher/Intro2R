rm(list = ls())

paste(letters[1:6], 1:6)

paste(letters[1:6], 1:2)

paste(letters[1:6], 1:6, sep = "")

paste(letters[1:6], 1:6, sep = "I am the separator")

paste0(letters[1:6], 1:6)

paste(letters[1:6], 1:6, c("z", "v", "w"), sep = "-")

paste(letters[1:6], 1:6, sep = "-")
paste(letters[1:6], 1:6, collapse = "-")

paste(letters[1:6], 1:6, sep = "-", collapse = "##")


paste("Station", 1:20, collapse = ".")


x <- c("This is a sentence", "Hello World!",
"This is the third element")

nchar(x)

substr(x, 6, 15)

substr(x, 1, 4) <- "That"





x.split <- strsplit(x, "is")



grep("sentence", x)

grep("is", x)

grep("is", x, value = TRUE)
x[grep("is", x)]

grepl("is", x)

new.x <- c(x, "I have the number 1", "Number2 is in me.")

gsub("This", "That", new.x)



dt.lt <- as.POSIXlt("2020/02/03 15:05")

dt.ct <- as.POSIXct("2020/02/03 15:05")

dt.iso <- ISOdatetime(2020, 2, 3, 15, 5, 0)

xmas <- "12.25.2020"

xmas.lt <- strptime(xmas, format = "%m.%d.%Y")
xmas.ct <- as.POSIXct(xmas.lt)


xmas.char <- strftime(xmas.ct, format = c("Year: %Y, Month: %m"))

Sys.time()

to.go <- xmas.ct - Sys.time()


# date 5 weeks from now
Sys.time() + as.difftime(5, units = "weeks")

Sys.time() - as.difftime(3, units = "days")

yr <- 2020
last.day <- paste0(yr, "/12/31")

today.j <- Sys.time() - as.POSIXct(as.POSIXlt("2020/1/1"))
num.days <- as.POSIXct("2020/12/31") - as.POSIXct("2020/1/1")





