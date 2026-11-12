## Note: Dashboards and in separate folders


### Debugging functions

# function to test debugging: Addition function
quadratic_formula <- function(a, b, c){
  # -b / 2a +- sqrt(b^2 - 4ac) / 2a
  part1 <- -b / (2 * a)
  part2 <- sqrt(b^2 - 4*a*c) / (2*a)
  answer1 <- part1 + part2
  answer2 <- part1 - part2
  return(c(answer1, answer2))
}

quadratic_formula(2,2, -5)

quadratic_formula(1,0, 0)


# function fails in this case
quadratic_formula(1, 0, 1)



#### Debug strategy 1: print in function
quadratic_formula <- function(a, b, c){
  # -b / 2a +- sqrt(b^2 - 4ac) / 2a
  
  part1 <- -b / (2 * a)
  print(paste("part 1 is", part1))
  
  print(paste("b^2 - 4*a*c is", b^2 - 4*a*c))
  part2 <- sqrt(b^2 - 4*a*c) / (2*a)
  print(paste("part 2 is", part2))
  
  answer1 <- part1 + part2
  answer2 <- part1 - part2
  return(c(answer1, answer2))
}

quadratic_formula(1, 0, 1)


### Debug stategy 2: Set initial values and just run the inside
#quadratic_formula <- function(a, b, c){
  # Set initial values
  a <- 1
  b <- 0
  c <- 1


  part1 <- -b / (2 * a)
  b^2 - 4*a*c
  part2 <- sqrt(b^2 - 4*a*c) / (2*a)
  answer1 <- part1 + part2
  answer2 <- part1 - part2
  return(c(answer1, answer2))
#}

  
  
### TidyR demo
band_price_data <- data.frame(
  city = c("Seattle", "Portland", "Denver", "Minneapolis"),
  greensky_bluegrass = c(40,40,20,30),
  trampled_by_turtles = c(30,20,40,100),
  billy_strings = c(15,25,25,15),
  fruition = c(30,50,40,20)
)

band_price_longer <- band_price_data |>
  pivot_longer(
    !c(city),
    names_to = "band",
    values_to =  "price"
  )

  
  
  