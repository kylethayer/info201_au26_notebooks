# ggplot demo

library("ggplot2")

# scatter plot with x and y
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty))


# scatter plot with a set color
ggplot(data = midwest) +
  geom_point(
    mapping = aes(x = percollege, y = percadultpoverty),
    color = "red"
  )

# color depending on data
ggplot(data = midwest) +
  geom_point(
    mapping = aes(
      x = percollege, 
      y = percadultpoverty,
      color = state)
  )


# bar chart
ggplot(data = midwest) +
  geom_col(
    mapping = aes(
      x = state,
      y = poptotal,
      fill = state
    )
  )

# histogram
ggplot(data = midwest) +
  geom_histogram(
    aes(x = poptotal), 
    binwidth = 2000
  )


# add labels
ggplot(data = midwest) +
  geom_point(
    mapping = aes(
      x = percollege, 
      y = percadultpoverty,
      color = state)
  ) +
  labs(
    title = "Percent College Educated versus Poverty Rates", # plot title
    x = "Percentage of College Educated Adults", # x-axis label
    y = "Percentage of Adults Living in Poverty", # y-axis label
    color = "State" # Legend label for the "color" property
  )
