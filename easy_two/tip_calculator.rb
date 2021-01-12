#Problem:
# create a tip calculator
# ask for a bill amount and a tip rate 
# calc the tip and display tip and total amount of bill

#Examples:
#What is the bill? 200
#What is the tip percentage? 15

#The tip is $30.0
#The total is $230.0

#Data:
# Inputs:
#   i.  user must enter a bill amount (should be a float, because bills can have decimals)
         #note: since this is a simple calculator, I'm assuming I don't need to validate user inputs
         # so, not checking for a negative value inputted or for a float input such as 1.9999999
#   ii. user must input tip percentage 
#             (will specify inputs as floats, b/c users may want to play around with the calculator to get to a specific
#                 whole number bill which could entail a tipping rate w/ decimals)
# Ouputs:
#   2 strings that showcase the tip amount & the total bill amount 
#       > the tip amount must be calculated based on multiplying the bill by the tip percentage
#       > the total bill amount must be calculated based on adding the bill and the calculated tip
#
#Algorithm:
# i. Write a string that asks the user for a bill amount
# ii. Convert the bill the user inputted into a float
#  iii. write a string that asks the user for a tip percentage 
#  iv. conver that tip percentage into a float 
#  v. print a string that displays the "The tip is" and the calculated tip amount
#       use string interpolation and put the rounded tip calculation within #{}
#  vi. print a string that contains "The total is" and the calculated total bill
#       use string interpolation and put the rounded total bill amount within #{}

#Code:
puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip_pct = gets.chomp.to_f


puts "The tip is #{(tip_pct / 100 * bill).round(2)}"
puts "The total is #{((tip_pct / 100 * bill)+bill).round(2)}"

#Further Exploration:
#modify solution, so that it always prints the result with 2 decimal places 
# ruby doc referenced: precision section of Kernel#format (Ruby v2.6.3)
# messed around w/ Kernel#format in irb and I will postpone finishing this further exploration for now
# will revisit kernel#format again though 



