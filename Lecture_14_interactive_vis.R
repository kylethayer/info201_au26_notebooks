

### plotly demo
library("ggplot2")
library("plotly")

# demo ggplotly
my_chart <- ggplot(data = mpg) +
  geom_point(mapping = aes(
    x = displ,
    y = hwy
  ))

my_chart
ggplotly(my_chart)

# to make custom hover text, make a "text" aes() field [ignore warning]
my_chart <- ggplot(data = mpg) +
  geom_point(mapping = aes(
    x = displ,
    y = hwy,
    text = paste0("Highway Mileage: " , hwy, "<br>",
                  "Displacement in Liters: ", displ)
  ))
ggplotly(my_chart, tooltip = "text") #use "text" field for the hover text

# in ggplot, I can make small multiples using
# facet_wrap(~categoryname)
my_chart <- ggplot(data = mpg) +
  geom_point(mapping = aes(
    x = displ,
    y = hwy,
    text = paste0("Highway Mileage: " , hwy, "<br>",
                  "Displacement in Liters: ", displ, "<br>",
                  "Class: ", class)
  )) +
  facet_wrap(~class)
ggplotly(my_chart, tooltip = "text") #use "text" field for the hover text



# Side note (for A7) on handling dates
# as.Date() turns text into dates
?as.Date()
# note: I think the official documentation is confusing

# as.Date can't handle everything, e.g.,
as.Date("Dec. 6th, 2024")

# let's try, 12/06/2024 (note: this is different in US and England)
date_1 <- as.Date("12/06/2024")
# which one is month?
date_1_month <- format(date_1, "%m") #it used England style dates

# You can set different interpretation rules for dates

# Also note, if it is date and time in the text, as.Date() removes the time info
