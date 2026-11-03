### Demo of joins ()

library_df <- data.frame(
  library_id = c(1, 2, 3, 4, 5),
  title = c("Pride and Prejudice", "Parable of the Sower", "Parable of the Sower", "The Dawn of Everything", "The Dawn of Everything"),
  checked_out = c(FALSE, TRUE, TRUE, FALSE, TRUE)
)

authors_df <- data.frame(
  title = c("Ficciones", "The Dawn of Everything", "The Dawn of Everything", "Parable of the Sower"),
  auth_first_name = c("Jorge Luis", "David", "David", "Octavia E."),
  auth_last_name = c("Borges", "Graeber", "Wengrow", "Butler")
)

# inner join
library_authors_inner_df <-
  library_df |>
  inner_join(
    authors_df,
    join_by(title)
  )

# left join
library_authors_left_df <-
  library_df |>
  left_join(
    authors_df,
    join_by(title)
  )

# right join
library_authors_right_df <-
  library_df |>
  right_join(
    authors_df,
    join_by(title)
  )


# full/outer join
library_authors_full_df <-
  library_df |>
  full_join(
    authors_df,
    join_by(title)
  )


### Vectors

# load ggplot2 to get the midwest dataframe
library("ggplot2")
# make hidden dataframe variable visible in r studio
midwest <- midwest


#load dplyr for the pull() function
library("dplyr")

# get vector of all the counties (all character)
midwest |> pull(county)

# get a vector of all the poptotal (all numbers)
midwest |> pull(poptotal)


# c function makes a vector
colors <- c("yellow", "blue", "orange")

print(colors)


# first thing in colors vector has index 1
print(colors[1])

# second things is index 2
print(colors[2])

# use length() to find how many things in my vector
length(colors)


# last thing in the vector is at index length of vector
len <- length(colors)
colors[len]

# or shortened
colors[length(colors)]

# last county in the dataframe
county_vector <- midwest |> pull(county)
county_vector[length(county_vector)]


### NOTE: You mostly don't need to fully understand
# the details of vectors below in order to do your work

# I can use c() to look up multiple indices of a vector
# colors #1 and #2
colors[c(1,2)]

# colors number 2 and 3
colors[c(2,3)]

# I can also use true/false values to select indices in my vector
# Mark the first and third to keep
colors[c(TRUE, FALSE, TRUE)]

# Note: I can get a vector of true false values by doing
# a comparison or something on a vector, and then use
# that to select the things that were TRUE
pop_vector <- midwest |> pull(poptotal)
pop_vector > 100000
pop_vector[pop_vector > 100000]


### Vector Types

# vectors all have to have the same type
different_types <- c("yellow", 60, TRUE)
different_types

# you can check types of a vector by using the
# typeof() function
typeof(colors)
typeof(pop_vector)
typeof(1.0)
typeof(1L)
typeof(TRUE)
typeof(midwest)

# if I want to test type, I can use the "is. " functions
is.character(colors)
is.character(pop_vector)

is.numeric(pop_vector)


### modifying vector
#I can change a value in a vector using [index]
colors[2] <- "purple"
print(colors)

# vectorized operations
prices <- c(1.5, 2.0, 2.2)
inflated_prices <- prices * 1.1 # this multiplies everything by 1.1

points_students_got <- c(43, 37, 49)
# find percent
student_percent <- points_students_got / 50 * 100


# I can even do math across two vectors of the same length
student_test_1 <- c(83, 75, 92)
student_test_2 <- c(90, 56, 77)

avg_student_test <-
  (student_test_1 + student_test_2) / 2


