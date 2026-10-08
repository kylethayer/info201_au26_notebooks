#  demo variables
typeof("this is text")
text_var <- "this is text"
typeof(text_var)

typeof(2 + 2)

3 + "4"

"4" + "5"

# paste is for adding text pieces

# by default, has a space
paste("hello", "world", "!")

# paste0 doesn't put a space
paste0("hello", "world", "!")

# fix spacing
paste0("hello", " ", "world", "!")

paste0("hello ", "world", "!")

# Looking at datasets
library(tidyverse)

# Load class survey data
heights_cm_df <- read.csv("survey_data/heights-cms.csv")
heights_cm_df

heights_truth_df <- read.csv("survey_data/heights_truth.csv")

living_location_df <- read.csv("survey_data/living_location.csv")

max_post_engagement_df <- read.csv("survey_data/max_social_post_engagement.csv")




# Loading libraries
install.packages("stringr")

# to use the library, run the library function
library("stringr")

announcement <- "UW has announced that it was foggy this morning"

# test if the word foggy is in the announcement
str_detect(announcement, "foggy")
str_detect(announcement, "cloudy")

# substitute a word
str_replace(announcement, "UW", "The University of Washington")


# Load fake student data
fake_student_df <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/demo_L03_fake_students.csv")

# load dplyr
library("dplyr")

age_data <- 
  fake_student_df |>
  pull(age)

final_exam_score_data <-
  fake_student_df |>
  pull(final_exam_score)

# minimum age?
fake_student_df |>
  pull(age) |>
  min()
# by default, it says NA, because it can't be certain

# we can use "na.rm = TRUE" to tell the min function to ignore NA values
fake_student_df |>
  pull(age) |>
  min(na.rm = TRUE)



