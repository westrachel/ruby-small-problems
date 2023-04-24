# Problem:
# create a program that takes a user's integer (> 0) and asks the user if they want to sum or product all the numbers between 1 and the entered integer 

# Examples:
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.

# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# Data:
# 2 inputs: 
# the first = a user's string that must be validated as an integer greater than zero
# the second = a user's string 's' or 'p' that determines how the user's integer will be validated
# will build in functionality to validate the user's inputs to make sure they are a valid integer or s or p 
# 
# outputs:
# either the product or the sum of all integer numbers between the 1 and the user's inputted integer 

# Algorithm:
# i. print a string that asks the user to input an integer > 0 
# ii. store the user's input into a variable, called integer
# iii. validate the user's input as a valid integer > 0 
# iv. print a string that asks the user to input either s or p (allow for capital or lowercase instances of s & p) 
# v. if p or P are entered, then calculate the product of the integers between 1 and the user's valid inputted integer
# vi. if s or S are entered, then calcualte the sum of the integers between 1 and the user's valid inputted integer
# vii. print the results of either summing or multiplying the integers between 1 and the user's valid integer input

# Code:
puts "Please enter an integer greater than 0"
integer = gets.chomp 

def valid_int?(user_input)
  user_input.to_i.to_s == user_input && user_input != "0"
end 

# loop until user has a valid integer inputted
until valid_int?(integer)
  puts "That's not a valid integer. Please enter a valid integer."
  integer = gets.chomp
end

puts "Enter 's' to calculate the sum, or 'p' to calculate the product of consecutive positive integers"
operation = gets.chomp 

until (operation.downcase == 's' || operation.downcase == 'p')
  puts "That's not a valid operation selection. Please enter 'p' or 's'."
  operation = gets.chomp
end

array_for_final_calc = (1..integer.to_i).to_a

product = 1
sum = 0
case operation.downcase
when 'p'
  array_for_final_calc.each { |int|
    product *= int
  }
  puts "The product of the integers between 1 and #{integer} is #{product}"
when 's'
  array_for_final_calc.each { |int|
    sum += int
  }
  puts "The sum of the integers between 1 and #{integer} is #{sum}"
end