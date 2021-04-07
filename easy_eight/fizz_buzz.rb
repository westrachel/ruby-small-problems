# Problem / Data:
# Create a method that accepts two arguments (two inputted number values) and then outputs
#  a string that contains a list of all the numbers between the specified inputs and the
# words fizz and buzz if certain conditions are met

# Example:
# fizzbuzz(1, 15) 
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Requirements:
# i. The output should be inclusive of the 2 integers inputted
# ii. If a number is divisible by 3, then its integer value shouldn't be printed in the
#   string list; rather, Fizz should be printed in its place
# iii. If a number is divisible by 5, then its integer value shouldn't be printed in the
#   string list; rather, Buzz should be printed in its place
# iv. If a number is divisible by 3 and 5, then its integer value shouldn't be printed
#   in the string list; rather, FizzBuzz should be printed in its place
# v. the second integer inputted should be greater than the first integer argument inputted
#   <=> I'm assuming negative integers are valid inputs
# vi. Floats can reasonably be passed in as integer arguments
# vii. Fizz, Buzz, and Fizzbuzz should be capitalized in the printed output

# Algorithm:
# 1. initialize an array
# 2. fill the array with all the numbers between the passed in arguments including
#     the passed in number values
# 3. loop through the array and check whether the number is divisible by 3, 5, or both
#     3 and 5
# 4. if the number is divisible by 3, replace it with the string "fizz", if its divisible by
#    5, replaced it with the string "buzz", and if its divisible by both 3 and 5, replace
#     it with 3 and 5
# 5. convert the array to a string
# 6. print the contents of the string

# Code:
def fizzbuzz(num1, num2)
  arr = num1.upto(num2).to_a.map do |number|
    if number % 3 == 0 && number % 5 == 0
      "Fizzbuzz"
    elsif number % 3 == 0
      "Fizz"
    elsif number % 5 == 0
      "Buzz"
    else
      number
    end
  end
  puts arr.join(', ')
end

# check work:
fizzbuzz(1, 15)
# => 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
