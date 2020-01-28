rm(list = ls())

# Week 01 Homework

# 1. Compute the following values:
# 27 times 38 minus 17
27 * 38 - 17
# natural logarithm of (56 divided by 4)
log(56 / 4)
# square root of (4 times 13)
sqrt(4 * 13)

#2. Create the following vector and assign it to `q2`.
q2 <- c(4:7, 3, 5:8, 1)

#3. Create the following vector and assign it to `q3`.
q3 <- c(0, seq(10, 50, by = 5), 4, 6:3, 1, 10)

#4. Multiply every element in `q2` by 5 and assign it to `q4`.
q4 <- q2 * 5

#5. Remove the second and ninth element from `q4`.
q4 <- q4[-c(2, 9)]

#6. What are the fifth, first, and eighth elements of the new `q4` vector in #5?
q6 <- q4[c(5, 1, 8)]

#7. What is the sum of all elements in `q4` that are greater than 18?
q7 <- q4[q4 > 18]
sum(q7)

#8. Create this vector and assign it to `q8`:
q8 <- rep(c(32, 25, 66), 4)

#9. Create this vector and assign it to `q9`:
q9 <- rep(q8[1:5], each = 2)

#10. Execute the script "temperature.r". Create a single named vector with the number of values of temperature are in the vector `temp` and what is their mean and standard deviation.
source("temperature.r")
c(n = length(temp), mean = mean(temp), std.dev = sd(temp))

#11. Create a new named vector of state areas (called `areas`) using the values in the `state.name` vector to name the values in `state.area`.
areas <- state.area
names(areas) <- state.name

#12. Using the `areas` vector from #11, what is the total area of Washington, Oregon, and California?
sum(areas[c("Washington", "Oregon", "California")])

#13. Using the `areas` vector from #11, how many Rhode Islands can fit into California?
unname(areas["California"] / areas["Rhode Island"])

#14. Using the `state.abb` and `state.name` vectors, what is the abbreviation of Iowa?
state.abb[state.name == "Iowa"]

#15. Using the `state.abb` and `state.area` vectors, what are the abbreviations of states with areas greater than the mean area of all states?
state.abb[state.area > mean(state.area)]









