rm(list = ls())

# Answer all questions in a script (.R) file. Use comments (`#` or `#'`).

# 1. Load the workspace file "Data 02.rdata". Extract the first twenty elements of the `eye.color` factor to `q1`.
load("Data 02.rdata")
q1 <- eye.color[1:20]
str(q1)

# 2. Convert the factor `q1` to a character vector called `q2`.
q2 <- as.character(q1)

# 3. Convert the vector `q2` back to a factor (`q3`) with the levels ordered as "Hazel", "Blue", "Green", "Brown".
q3 <- factor(q2, levels = c("Hazel", "Blue", "Green", "Brown"))

# 4. Change the levels of `q3` be "Hz", "Bl", "Gr", "Br".
levels(q3) <- c("Hz", "Bl", "Gr", "Br")

# 5. Reorder the levels of `q3` to "Bl", "Hz", "Br", "Gr"
q3 <- factor(q3, levels = c("Bl", "Hz", "Br", "Gr"))

# 6. Extract the surface (1m) and every 5 meters of the ctd cast from the `ctd` matrix.
m <- c(60, seq(56, 1, by = -5))
ctd.10 <- ctd[m, ]

# 7. Extract a matrix of the temperature, density, and pH for each 10 m (10m, 20m, 30m, etc).
q7 <- ctd[nrow(ctd):1, c("temp", "density", "ph")]
q7 <- q7[seq(10, 60, by = 10), ]

# 8. What is the mean temperature in the top 10 meters?
mean(ctd[ctd[, "depth"] <= 10, "temp"])

# 9. Add a column to the original `ctd` matrix for temperature in Farenheit (F = (C * 9/5) + 32)
temp.f <- (ctd[, "temp"] * (9/5)) + 32
ctd <- cbind(ctd, temp.f = temp.f)

# 10. Remove the "depth" and "pct_light" columns, and put the "temp.f" column after "temp".
ctd <- ctd[, c("density", "temp", "temp.f", "salinity", "dox", "ph")]
