#### conditionals demo

money <- 10
coffee_price <- 5

if(money > coffee_price){
  print("You have more than enough money to buy coffee")
} else if(money == coffee_price){
  print("You have exactly the right amount of money to buy coffee")
} else { # all other cases are where money < coffee_price
  print("You do NOT have enough money to buy coffee")
}


### subset demo, pocket data

pocket_df <- read.csv("https://github.com/the-pudding/data/raw/master/pockets/measurements.csv")

# load dplyr
library(dplyr)

# Select

pocket_df |> select(style, fabric)


# filter for abercrombie
pocket_df |> filter(brand == "Abercrombie" )

# even better, save the new dataframe in a new variable
abercrombie_data <-
  pocket_df |>
  filter(brand == "Abercrombie")

# high price (>70)
high_price_df <-
  pocket_df |>
  filter(price > 70)


# Note: select DOES NOT WORK for taking an average 
pocket_df |> select(price) |> mean()

# pull does work
pocket_df |>
  pull(price) |>
  mean()


# One example filter of 2 things at once

#only abercrombie for men
ab_for_men_df <- 
  pocket_df |>
  filter(brand == "Abercrombie", menWomen == "men")

#alternate way of writing this with &
ab_for_men_df <- 
  pocket_df |>
  filter(brand == "Abercrombie" & menWomen == "men")

# average price abercrombie for men
ab_for_men_df |> 
  pull(price) |>
  mean()


### find Min/max problem

# finding the max price of pants, save in variable
max_price <- 
  pocket_df |>
    pull(price) |>
    max()

# find the row(s) that have that maximum price
max_price_rows <-
  pocket_df |>
    filter(price == max_price)

# shorthand version of doing the same thing
max_price_rows <-
  pocket_df |>
    filter(price == max(price))

# min prices rows
min_price_rows <-
  pocket_df |>
  filter(price == min(price))

#### load height vs. relationship data
height_relationship_df <- read.csv("~/WORK/survey_data/height-gender-relationship-anonymized.csv")

# what percent of students are in a relationship?
#   number in relationship / total number * 100
num_in_relationship <- 
  height_relationship_df |>
    filter(romantic.relationship.status == "Yes") |>
    nrow()

total_number <- 
  height_relationship_df |>
    nrow()

percent_in_relationship <-
  num_in_relationship / total_number * 100


percent_in_relationship_men <-
  height_relationship_df |>
    filter(romantic.relationship.status == "Yes", gender == "Male") |>
    nrow() /
  height_relationship_df |>
    filter(gender == "Male") |>
    nrow() *
  100
