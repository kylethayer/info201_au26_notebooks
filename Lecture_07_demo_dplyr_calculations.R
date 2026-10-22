library("dplyr")
library("ggplot2")
library("stringr")

height_relationship_df <- read.csv("~/WORK/survey_data/height-gender-relationship-anonymized.csv")
pocket_df <- read.csv("https://github.com/the-pudding/data/raw/master/pockets/measurements.csv")

# demo of str_sub
text1 <- "hello"
str_sub(text1, end=2)

# find first numbet
text2 <- "78% cotton, 20% polyester, 2% spandex"
str_sub(text2, end=2)

# find the first percent
pocket_with_fabric_percent_df <-
  pocket_df |>
  mutate(
    first_fabric_percent = str_sub(fabric, end=2)
  )

# unfortunately, first 2 characters rule failed for "100%"

# what if we want to get the area size of the front pockets
# we want height * width = area, but there are many heights and width measurements
# For simplicity, we'll just use minHeightFront * minWidthFront
pocket_df <-
  pocket_df |>
  mutate(
    front_area = minHeightFront * minWidthFront
  )


# Summarize

#note, summary is different, and just finds a preset set of summary values
summary(pocket_df)

# we can use pull to find average price (from before)
avg_price <-
  pocket_df |>
  pull(price) |>
  mean()

# summarize combines all rows into summary values
pants_summary_df <-
  pocket_df |>
  summarize(
    total_pants = n(),
    avg_price = mean(price),
    num_brands = n_distinct(brand)
  )

# finding info about levi's pants
avg_price_levis <-
  pocket_df |>
  filter(brand == "Levi's") |>
  pull(price) |>
  mean()

levi_pants_summary_df <-
  pocket_df |>
  filter(brand == "Levi's") |>
  summarize(
    total_pants = n(),
    avg_price = mean(price),
    num_brands = n_distinct(brand)
  )

# Note: summarize gives a dataframe
# if I want the value now, I have to use pull
levi_pants_avg_price <-
  levi_pants_summary_df |>
  pull(avg_price)


# Group by lets me group the data, then do things like summarize
# on all those groups at the same time

pants_summary_by_brand_df <-
  pocket_df |>
  group_by(brand) |>
  summarize(
    total_pants = n(),
    avg_price = mean(price)
  )


# You can group by multiple columns
pants_summary_by_brand_and_gender_df <-
  pocket_df |>
  group_by(brand, menWomen) |>
  summarize(
    total_pants = n(),
    avg_price = mean(price)
  )


# Demo of height/relationship/gender data
# let's do gender first
gender_relationship_summary <-
  height_relationship_df |>
  group_by(gender) |>
  summarize(
    percent_in_relationship = sum(romantic.relationship.status == "Yes") / n() * 100
  )

ggplot(gender_relationship_summary) +
  geom_col(aes(x = gender, y = percent_in_relationship))


height_relationship_summary <-
  height_relationship_df |>
  group_by(height.group) |>
  summarize(
    percent_in_relationship = sum(romantic.relationship.status == "Yes") / n() * 100
  )

ggplot(height_relationship_summary) +
  geom_col(aes(x = height.group, y = percent_in_relationship))



height_and_gender_relationship_summary <-
  height_relationship_df |>
  group_by(height.group, gender) |>
  summarize(
    percent_in_relationship = sum(romantic.relationship.status == "Yes") / n() * 100
  )

ggplot(height_and_gender_relationship_summary) +
  geom_point(aes(x = height.group, y = percent_in_relationship, color=gender))



# Data cleaning

# problems: extra space on "Guess "
# problem: "7 for All Mankind" vs. "7 for all Mankind"
cleaned_pants_df <-
  pocket_df |>
  mutate(
    brand = trimws(brand) # remove spaces at beginning and end of string
  ) |>
  mutate(
    brand = ifelse(
      brand == "7 for all Mankind", # if check (lower case "a" version)
      "7 for All Mankind", # what to do if true (use upper case "a" brand)
      brand # otherwise leave brand as is
    )
  )



# summarize now by each brand
pants_summary_by_brand_df <-
  cleaned_pants_df |>
  group_by(brand) |>
  summarize(
    total_pants = n(),
    avg_price = mean(price)
  )
