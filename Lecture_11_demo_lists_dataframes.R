## review of vectors

# make vectors with c() function
names <- c("Kyle", "Fred", "Sue")

# First thing is at index 1
names[1]


# Vectors have to be all the same type
mixed_types_vector <- c("text", 4, FALSE) 


# By default, everything in R is a vector
# If I have just one value, it is the 1st element of a 1 length vector
3
single_num <- 3
single_num[1]

# Lists demo

# make with the list() function, lists can have different types
my_list <- list(30885, "North Cascades", TRUE)

single_park_data <- list(park = "North Cascades", visits = 30885)

# get park name from list (2 ways of doing it)
single_park_data[["park"]]
single_park_data$park

single_park_data[["visits"]]
single_park_data$visits


# Single square brackets gets a new list with the info you asked for
# but you can't do things like math calculations
single_park_data["visits"] * 2

single_park_data[["visits"]] * 2


# We can update values in the list by saving into the
# [[]] or $ selection
single_park_data[["visits"]] <- single_park_data[["visits"]] + 1

single_park_data$visits <- single_park_data$visits + 1

# we can add new entries into the list by selecting the non-exisiting
# item, and saving into it (either [[]] or $)
single_park_data[["is_park_awesome"]] <- TRUE

# Data frames
# made of vectors all the same length

# we can save vectors into variables and then make a dataframe
parks <- c("North Cascades", "Olympic", "Rainier")
visits <- c(30885, 2499177, 1160754)

# combine them with data.frame, and the name of the columns
# will be the variable names
np_data_df <- data.frame(parks, visits)


# I can also just use the data.frame function
# and make vectors inside it, using = to say what name for the columns
np_data_df <- data.frame(
  parks = c("North Cascades", "Olympic", "Rainier"),
  visits = c(30885, 2499177, 1160754)
)


# Now we are ready to do all of our previous tasks with data frames
# like mutate, filter, inner_join, ...





