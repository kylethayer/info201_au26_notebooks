### Functions

# reminder, we already use lots of functions in R
# read.csv(..)
min(43,21, 435, 643, 43)
paste("hello", "Kyle")

### write our own functions

# try with a basic addition function (recreating + or the sum() function)
add_numbers <- function(num1, num2){
  # body of the function, where I do my work
  
  answer <- num1 + num2
  
  # at the end, write a value or return() a value 
  # so it can be saved into a variable by whoever ran this function
  return(answer)
}

# Now I can run my function just like any other function in R
add_numbers(2, 2)

# my function returned a result, so I can save it in a variable
example_sum <- add_numbers(2, 2)


# what ways can I break my function

# 1. my function requires 2 values
add_numbers()
add_numbers(2)
add_numbers(1,2,3)

# 2. If I give my function a value that wont work with its calculation
add_numbers(1, "hello")


### functions with optional arguments/parameters

# I'll redo the add_numbers function to make the second number optional
add_numbers <- function(num1, num2 = 1){
  answer <- num1 + num2
  return(answer)
}

#call my function with 2 numbers
add_numbers(2,2)
#call function with 1 number
add_numbers(2)
#I can say I am sending over num2 specifically (useful when multiple optional arguments)
add_numbers(2, num2 = 3)


# function with text
make_greeting <- function(name){
  greeting <- paste("Hello", name)
  return(greeting)
}
#try running it
make_greeting("Kyle")

# redo it with optional argument for greeting word
make_greeting <- function(name, greeting_word = "Hello"){
  greeting <- paste(greeting_word, name)
  return(greeting)
}
make_greeting("Kyle")
make_greeting("Kyle", greeting_word="Hi")
make_greeting("Kyle", greeting_word="Hola")

# redo with one more argument for post name text
make_greeting <- 
  function(name, greeting_word = "Hello", post_name_text = ""){
    greeting <- paste0(greeting_word, " ", name, post_name_text)
    return(greeting)
  }
make_greeting("Kyle")
make_greeting("Kyle", post_name_text = "!")
make_greeting("Kyle", greeting_word="¡Hola", post_name_text="!")


# Note: functions should mostly work with vectors
name_vector <- c("Kyle", "Hy")
make_greeting(name_vector)
