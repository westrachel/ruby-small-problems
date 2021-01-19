# Problem:
# write a program that asks for 6 numbers from the user and then prints a 
# message that describes whether or not the 6th number appears amongst the first 5 numbers

# Examples:
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

# Data:
# inputs:
# user will input 6 numbers 
# I will assume that these numbers should only be integers and will validate them to see if they are integers
# and if they aren't valid integers, I will ask the user to input the number again.

# outputs:
# a string that repeats the user's 6th input and tells the user if it appears in the first 5 numbers inputted

# Algorithm:
# i. define a method that stores the "==> Enter the Xth number:" to avoid retyping this out 
# ii. define a method to validate the user's integer input
# iii. define an empty array that will store the user's first 5 inputs 
# iv. prompt the user to enter the first number using the method defined in i. 
# v. if the user entered a valid integer, store that integer into the array
# vi. if the user did not enter a valid integer, ask the user to re-input an integer that's valid 
# vii. repeat steps 4 - 6 until the user has inputted 5 valid integers 
# viii. prompt the user to enter a 6th integer/the last number 
# ix. validate the 6th integer 
# x. iterate over the array and test if the 6th integer is in the array of stored integers
# xi. if the 6th number/integer is in the array then print that the 6th number appears in the array of 5 numbers
# xii. if the 6th number/integer is not in the array then print that the 6th number does not appear in the array of 5 numbers
# <=> both xi. and xii. should use string interpolation to print the user's exact 6th number inputted and the array of the 5 numbers the user inputted


# Code:
def num_request(num)
  puts "==> Enter the #{num} number:"
end

def valid(int)
  int.to_i.to_s == int
end

array_of_five = []
num_request("1st")
int = gets.chomp 

until valid(int)
  puts "Hmm.. That's not a valid number. Please input an integer"
  int = gets.chomp
end

array_of_five << int.to_i 

num_request("2nd")
int = gets.chomp 

until valid(int)
  puts "Hmm.. That's not a valid number. Please input an integer"
  int = gets.chomp
end

array_of_five << int.to_i 

num_request("3rd")
int = gets.chomp 

until valid(int)
  puts "Hmm.. That's not a valid number. Please input an integer"
  int = gets.chomp
end

array_of_five << int.to_i 

num_request("4th")
int = gets.chomp 

until valid(int)
  puts "Hmm.. That's not a valid number. Please input an integer"
  int = gets.chomp
end

array_of_five << int.to_i 


num_request("5th")
int = gets.chomp 

until valid(int)
  puts "Hmm.. That's not a valid number. Please input an integer"
  int = gets.chomp
end

array_of_five << int.to_i 

num_request("last")
int = gets.chomp 

until valid(int)
  puts "Hmm.. That's not a valid number. Please input an integer"
  int = gets.chomp
end


if array_of_five.include?(int.to_i)
  puts "The number #{int} appears in #{array_of_five}"
else 
  puts "The number #{int} does not appear in #{array_of_five}"
end 

