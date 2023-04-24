#Problem:
# build an interactive program that asks the user for 2 specific values in meters
#  and then uses those inputs to calculate certain dimensions of a room

# Example:
#Enter the length of the room in meters:
#10
#Enter the width of the room in meters:
#7
#The area of the room is 70.0 square meters (753.47 square feet).

#Data:
# inputs:
#   length of the room (in meters) (string that needs to be converted into a float and then interpolated into a string for the final output)
#   width of the room (in meters)  (string that needs t be converted into an float and then interpolated into a string for the final output)
#      note: don't have to validate inputs to make sure reasonabe, >0, numbers have been inputted
#  outputs:
#    string containing the area of the room in square meters and square feet (make sure these values have 2 decimals at most)

#Algorithm:
# i. Print a string requesting the user to input the length of the room in meters
# ii. Establish a length variable to store the user's inputted length in meters
# iii. repeat (i.) and (ii.) but replace length w/ width 
# iv. print a string that specifies the area of the room in sq meters and sq feet
      #  note: the calculations of the area in sq meters can be done w/in the #{} part of the string, add parenthesis to be able to use #round method to make sure only 2 decimals are printed
      #    additionally, can do the conversion of meters into feet and calculate the square footage area of the room within the #{} of the string
      #      given conversion rate: 1 square meter == 10.7639


puts "Enter the length of the room in meters:"
length = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f
puts "The area of the room is #{(length * width).round(2)} square meters (#{(length * width * 10.7639).round(2)} square feet)."

#Further Exploration:
#modify to ask for input measurements in feet, and display results in:
# square feet, square inches, and square centimers
#practice storing constants
#Conversions:
FOOT_TO_CENTIMETER = 30.48

puts "Enter the length of the room in feet:"
length = gets.chomp.to_f
puts "Enter the width of the room in feet:"
width = gets.chomp.to_f
puts "The area of the room is #{(length * width).round(2)} square feet 
       (#{(length * width * 12).round(2)} square inches or 
         #{(length * width * FOOT_TO_CENTIMETER).round(2)} square centimeters)."
