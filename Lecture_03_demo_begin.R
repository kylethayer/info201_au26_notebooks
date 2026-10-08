library(tidyverse)

# Load class survey data
heights_cm_df <- read.csv("survey_data/heights_cm.csv")

heights_truth_df <- read.csv("survey_data/heights_truth.csv")

living_location_df <- read.csv("survey_data/living_location.csv")

max_post_engagement_df <- read.csv("survey_data/max_social_post_engagement.csv")



# Load fake student data
fake_student_df <- read.csv("https://raw.githubusercontent.com/kylethayer/Info-201-au-24-datasets/refs/heads/main/demo_L03_fake_students.csv")