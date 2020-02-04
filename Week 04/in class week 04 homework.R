rm(list = ls())

# 1. Create the following list of state information (call it states) using the
# built-in data objectsstate.abb,state.area,state.center,state.name‘:

states <- list(
  abb = state.abb,
  area = state.area,
  center = state.center,
  name = state.name
)

# 2. Add the state.division factor to the states list.

states$division <- state.division

# 3. Create a two-column data frame from the abb and name elements, and put
# them into an element called abb.name. Delete abb and name.

states$abb.name <- data.frame(
  abb = states$abb,
  name = states$name,
  stringsAsFactors = FALSE
)
states$abb <- states$name <- NULL

# 4. Add a list to the states list that summarizes the mean, median, standard
# deviation and range of state areas:

states$smry <- list(
  mean = mean(states$area),
  median = median(states$area),
  sd = sd(states$area),
  range = range(states$area)
)

# 5. Extract the abb.name data frame and add the division element to it. Call the
# new data frame “states.df”:

states.df <- states$abb.name
states.df$division <- states$division
str(states.df)

# 6. Use states.df to extract and create a character vector of the abbreviations
# of the New England states:

states.df$division == "New England"

ne <- states.df$abb[states.df$division == "New England"]

states.df[states.df$division == "New England", "abb"]

states.df[states.df$division == "New England", ]$abb

states.df[states.df$division == "New England", ][["abb"]]

states.df[which(states.df$division == "New England"), "abb"]

# 7. Using this vector and the states list, what is the mean area of New England
# states?

ne.area <- state.area[state.abb %in% ne]
ne.area.mean <- mean(ne.area)

my.area <- state.area
names(my.area) <- state.abb
mean(my.area[ne])


# 10. Which states have both per-capita income and life expectancy that are
# greater than the mean?

statex77.df <- as.data.frame(state.x77)
statex77.df$pc.income <- statex77.df$Income / statex77.df$Population

mean.le <- mean(statex77.df[["Life Exp"]])
mean.pci <- mean(statex77.df$pc.income)

life.exp <- statex77.df[["Life Exp"]] > mean.le
pci <- statex77.df$pc.income > mean.pci
to.keep <- life.exp & pci
good.states <- rownames(statex77.df[to.keep, ])


statex77.df$state.names <- rownames(statex77.df)
statex77.df$state.names[to.keep]
