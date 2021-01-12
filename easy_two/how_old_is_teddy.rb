#Problem
# write a program that randomly generates a # between 20 and 200 
# this number will be teddy'r age 
# and you should print the age

#example output:
# Teddy is 69 years old!

# data:
# input:
#    I first want to define a sequence of integers between 20 and 200 and assign this to an array 
# output:
#    select random number from array of integers and print that number is a string stating how old Teddy is.

#algorithm:
# i. define array of integers between 20 and 200 using two dot inclusive operator that
# ii. randomly shuffle the array of integers
# iii. print the zeroth index of the array of integer using string interpolation, post shuffle ensuring randomization, in a string that declares how old Teddy is

#code:
array = (20..200).to_a
array.shuffle!    # the ! will ensure that the array is mutated, so that the integer at the zeroth index changes each time run how_old_is_teddy.rb 
puts "Teddy is #{array[0]} years old!"

#alternative solution:
# leverage Kernel#rand

#Further exploration:
#modify the program to ask for a name, and then print the age for that person
puts "Please enter your name"
name = gets.chomp
puts "#{name} is #{rand(20..200)} years old!"

#extra challenge, use "Teddy" as the name if no name is entered
#believe the ternary operator will do the trick here
puts "Please enter your name"
name = gets.chomp
name == "" ? name = "Teddy" : "do nothing"  
puts "#{name} is #{rand(20..200)} years old!"