rm(list = ls())

#' 1. Create the following list of state information
#' (call it `states) using the built-in data objects
#' `state.abb`, `state.area`, `state.center`, `state.name`:
#'
states <- list(
  abb = state.abb,
  area = state.area,
  center = state.center,
  name = state.name
)

#' 2. Add the `state.division` factor to the `states` list.
#'
states$division <- state.division

#' 3. Create a two-column data frame from the `abb` and `name`
#' elements, and put them into an element called `abb.name`.
#' Delete `abb` and `name`.
#'
states$abb.name <- data.frame(
  abb = states$abb,
  name = states$name,
  stringsAsFactors = FALSE
)
states$abb <- states$name <- NULL

#' 4. Add a list to the `states` list that summarizes the mean,
#' median, standard deviation and range of state areas:
#'
states$area.smry <- list(
  mean = mean(states$area),
  median = median(states$area),
  sd = sd(states$area),
  range = range(states$area)
)

#' 5. Extract the `abb.name` data frame and add the `division`
#' element to it. Call the new data frame "`states.df`":
#'
states.df <- states$abb.name
states.df$division <- states$division

#' 6. Use `states.df` to extract and create a character
#' vector of the abbreviations of the New England states:
#'
ne.abb <- states.df[states.df$division == "New England", "abb"]
ne.abb <- as.character(ne.abb)

#' 7. Using this vector and the `states` list, what is the mean
#' area of New England states?
#'
names(states$area) <- as.character(states$abb.name$abb)
mean(states$area[ne.abb])

#' 8. Convert the built-in `state.x77` matrix to a data frame
#' called `state77.df`
#'
state77.df <- as.data.frame(state.x77)

#' 9. Add columns that are the per-capita income rate
#' (Income/Population) and per-capita life expectancy rate
#' (Life Exp/Population):
#'
state77.df$pc.income <- state77.df$Income / state77.df$Population
state77.df$pc.life.exp <- state77.df[, "Life Exp"] / state77.df$Population

#' 10. Which states have both per-capita income and life
#' expectancy that are greater than the mean?
#'
pc.inc.gt.mean <- state77.df$pc.income > mean(state77.df$pc.income)
pc.life.exp.gt.mean <- state77.df$pc.life.exp > mean(state77.df$pc.life.exp)
good.rows <- pc.inc.gt.mean & pc.life.exp.gt.mean
rownames(state77.df)[good.rows]

#' 11. Use the species code table "tblCodeSpecies.csv".
#' Create a data frame of Order, Suborder, and Family that
#' has one row per unique family.
#'
spp.code <- read.csv("tblCodeSpecies.csv", stringsAsFactors = FALSE)
spp.code.2 <- unique(spp.code[, c("ORDER", "SUBORDER", "FAMILY")])

#' 12. Add a column to the data frame from 1 with the number of
#' entries in the species code table for each family.
#'
family.freq <- table(spp.code[, "FAMILY"])
spp.code.2$n <- as.vector(family.freq[spp.code.2$FAMILY])

#' 13. Extract a data frame containing all entries of the
#' families Monodontidae, Phocoenidae, and Delphinidae from
#' the original species code table. How many genera are there
#' in each family?
std <- spp.code[spp.code[, "FAMILY"] %in% c("MONODONTIDAE", "PHOCOENIDAE", "DELPHINIDAE"), ]
str(std)
std <- std[, c("FAMILY", "GENUS")]
std <- unique(std)
table(std$FAMILY)

#' 14. Sort the species code table by genus, species, and
#' species code. Put these three columns first.
#'
spp.code.sort <- spp.code[order(spp.code$GENUS, spp.code$SPECIES, spp.code$SPCODE), ]
cols.first <- c("GENUS", "SPECIES", "SPCODE")
spp.code.sort <- spp.code.sort[, c(cols.first, setdiff(colnames(spp.code.sort), cols.first))]

#' 15. Use the CTD cast data "ctd.csv". Extract the full
#' casts for 10 random dates from Station 1.
#'
ctd <- read.csv("ctd.csv", stringsAsFactors = FALSE)
ctd1 <- ctd[ctd$station == "Station.1", ]
ran.dates <- sample(unique(ctd1$sample_date), 10)
ctd1.10 <- ctd1[ctd1$sample_date %in% ran.dates, ]

#' 16. Sort the data frame from 5 by date and depth.
#'
ctd1.10 <- ctd1.10[order(ctd1.10$sample_date, ctd1.10$depth), ]

#' 17. Which date of these 10 casts has the smallest surface temperature?
surf <- ctd1.10[ctd1.10$depth == 1, ]
surf[, c("sample_date", "temp")]
surf[which.min(surf$temp), ]
