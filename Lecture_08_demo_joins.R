library("dplyr")
library("ggplot2")
library("stringr")

height_relationship_df <- read.csv("~/WORK/survey_data/height-gender-relationship-anonymized.csv")
pocket_df <- read.csv("https://github.com/the-pudding/data/raw/master/pockets/measurements.csv")


# Review of group_by and summarize

# calculate area for each pants data row
pocket_df <-
  pocket_df |>
  mutate(
    front_area = minHeightFront * minWidthFront
  )

# does front pocket area vary by gender?
pocket_summary_df <-
  pocket_df |>
  group_by(menWomen) |>
  summarize(
    avg_front_area = mean(front_area),
    avg_price = mean(price)
  )

# rename the height.group column
height_relationship_df <-
  height_relationship_df |>
  mutate(
    height = height.group
  )

# Find percent in a relationship for each height/gender grouping
height_and_gender_relationship_summary <-
  height_relationship_df |>
  group_by(height, gender) |>
  summarize(
    percent_in_relationship = sum(romantic.relationship.status == "Yes") / n() * 100
  )

# plot the percent in a relationship by height/gender
ggplot(height_and_gender_relationship_summary) +
  geom_point(aes(x = height, y = percent_in_relationship, color=gender))

# count for each combination of answers (height, gender, relationship)
height_relation_gender_counts_df <-
  height_relationship_df |>
  group_by(gender, height, romantic.relationship.status) |>
  summarize(
    count = n()
  )

# plot number of answers to relationship status vs height
ggplot(height_relation_gender_counts_df) +
  geom_col(aes(x= height, y = count, fill=romantic.relationship.status))

# separate for men and women (using filter inside of the ggplot call)
ggplot(
  height_relation_gender_counts_df |> 
    filter(gender == "Male")
  ) +
  geom_col(aes(x= height, y = count, fill=romantic.relationship.status))

ggplot(
  height_relation_gender_counts_df |> 
    filter(gender == "Female")
) +
  geom_col(aes(x= height, y = count, fill=romantic.relationship.status))




#### Joins demo

# Load fake store datasets
store_items_df <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/store_items.csv")
user_cart_df <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/user_cart.csv")

# My goal is to calculate how much to charge
# the user for their items in their cart

# first, I need to join their cart info
# with the store price info
user_cart_with_prices_df <-
  user_cart_df |>
    inner_join(store_items_df, join_by(item_name))

### Side note: If I use (outer) full_join
#  it keeps all the store items, even if they weren't in the cart
full_join_user_cart_with_prices_df <-
  user_cart_df |>
    full_join(store_items_df, join_by(item_name))

# now that I have the quantity and price in the same dataframe
# I can calculate subtotal cost of each item_name
user_cart_with_prices_df <- 
  user_cart_with_prices_df |>
  mutate(subtotal_item_price = quantity * item_price)

# find total cost, and save in a variable
total_cost <-
  user_cart_with_prices_df |>
  pull(subtotal_item_price) |>
  sum()


# load flight info
# if needed, install the package
#    install.packages("nycflights13")
library("nycflights13")

# make hidden dataframes visible in r studio
flights <- flights
airports <- airports

# join the flight destination ("dest") to the airport
# information ("faa")
flights_with_dest_info_df <-
  flights |>
  inner_join(airports, join_by(dest == faa))

# left_join will show us flights to airports we don't have info for
flights_with_dest_info_df <-
  flights |>
  left_join(airports, join_by(dest == faa))
