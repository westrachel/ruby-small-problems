#PEDAC:
#Problem:
#     define a method that takes 2 arguments and calculates the bonus for a given salary
#            > 2 arguments = positive integer & a boolean
#            > if the boolean is true, the bonus is half the salary
#            > if the boolean is false, the bonus should be zero 

#Examples:
#the following will print as true
#puts calculate_bonus(2800, true) == 1400
#puts calculate_bonus(1000, false) == 0
#puts calculate_bonus(50000, true) == 25000


#Data Structure:
#    inputs: there 2 arguments (boolean & positive integer) that need to specified for the method
#          > I'm not going to specify a default value for either arguments
#         > there is no direct request for additional functionality for negative integers (ie no print a specific error message if someone enters -100)
#    outputs: the returned salary in integer form (no request for floats & an integer divided by the integer 2 will produce an integer)

#Algorithm:
#     i. define method w/ two arguments 
#    ii. if the boolean argument passed into the method is true, will return the result of dividing the positive integer input by 2
#    iii. if the boolean argument passed into the method is false will return zero
#    iv. this isn't requested, but will return the string "You haven't specified the correct boolean argument." if something other than true or false is passed into the defined method
#

#Code:
def calculate_bonus(pos_int, boolean)
  if boolean == true
    pos_int / 2
  elsif boolean == false
    0 
  else 
    "You haven't specified the correct boolean argument."
  end
end

#check my solution:
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

#alternative solution:
#can use ternary operator syntax to create a more succint answer 