# Demo 2.2, R code in R studio

# ha ha, the computer doesn't care white comments I write

# Do what we did in the Jupyter Notebook

# Load a dataset of the top national parks by visits
np_top_5_df <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/refs/heads/main/2020-National-Park-Visits-By-State-Top5.csv")

# view dataset
np_top_5_df

# view summary
summary(np_top_5_df)


# Demo functions
print(5)

print("hello world")

# sum adds things together
sum(2, 4)

sum(1, 2, 3, 4, 5)

# seq makes a sequence
seq(1,10)

sum(seq(1,10))


# Basic math operations (+, -, *, /)
2 +2

1 + 2 + 3 + 4 + 5

32 / 4


# conditional operators (>, >=, <, <=, ==, !=)

# is 1 bigger than 2?
1 > 2

# is 1 less than 2?
1 < 2

# is 2 the same as 2?
2 == 2

# is 2 different than 2?
2 != 2


# Demo save in a variable
num_sections <- 8
num_students <- 197

my_variable_can_be_anything_without_spaces <- 4

# how many students per section?
num_students / num_sections

# how many minutes in a year
years <- 1
days <- years * 365
hours <- days * 24
minutes <- hours * 60

print(minutes)

