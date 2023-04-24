#Problem: 
# build an interactive program that asks for the user's age and when they want to retire
# and then print the current year and the year in which they will retire
# then print how many years they have to work until retirement

#Examples:
#What is your age? 30
#At what age would you like to retire? 70

#It's 2016. You will retire in 2056.
#You have only 40 years of work to go!

# Data:
# inputs:
#     i. user's current age (will convert to integer, b/c don't care to specify how many partial years a user is old)
#     ii. user's ideal retirement age (will convert user's input to an integer just like their current age)
# outputs:
#     i. current year embedded into a string that also states the retirement year
#     ii. another string that states how many more years the user has to work

# Algorithm:
#  i. ask the user to input their age
#  ii. convert the user's input to an integer and store it in an age variable
#  iii. ask the user for their ideal retirement age
#  iv. store ideal retirement age into another variable to access later
#   v. calculate # of years user still needs to work = retirement age - current age
#   v. print a string that includes string interpolation to print the current year in addition to printing the retirement year 
            # > calculate retirement year within #{} of the string, retirement year = current year + # of years user still needs to work
          
#   vi. print another string that states how many years the user still needs to work
#           # > use string interpolation to include the calculation of years left to work

#ruby documentation referenced to know how to print current date:
# DateTime::now & DateTime#strftime 
# also, note will need to specify require 'date' before using DateTime it looks like 

# Code:
puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

work_yrs_to_go = retirement_age - age 

puts "You have only #{work_yrs_to_go} years of work to go!"
require 'date'
current_year = DateTime.now.strftime("%Y")
puts "It's #{current_year}. You will retire in #{DateTime.now.strftime("%Y").to_i + work_yrs_to_go}."


#alternative solution:
# leverage Time#year, so don't have to use #strftime & also looks like you don't have to specify require 'Time' to use that