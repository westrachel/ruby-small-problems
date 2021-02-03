# PEDAC:

# Input: integer
#       > positive or negative integers are acceptable
#       > integer input represents the # of minutes before or after midnight 
#                 > so, if # of minutes is positive, the time is after midnight
#                 > if the # of minutes is negative, the time is before midnight
# output: string 
#      > string's value = time of day in 24 hour format: hh:mm (so length = 5)

# Other Explicit requirements:
# cannot use ruby's Date and Time classes
# ignore daylight savings times and standard time and other complications 

# Implicit requirements:
# can you input more than a full day's worth of minutes?
#        > 24 hours * (60 minutes / hour) = 1440 minutes
#        > yes, >1440 and <-1440 can be inputted 
# first two digits of the output = between [00, 24)  (so not including 24)
# last two digits of the string output = between [00, 60) (so not including 60)

# Algorithm:
# define a method that takes one integer input (assuming don't need to validate the input)
# define a sub-method on the integer input that checks if the value of the integer is more than a positive or negative day's worth of minutes and modifies the 
#    the integer such that it falls within the bounds: [-1440, 1440] <=> this method should return the (modified) integer
#          > if the integer input is more than a day's worth of positive minutes, 
                   #       > initialize a loop,
                   #       > and w/ each iteration of the loop,
                   #       > subtract 1440 from the integer 
                   #       > break the loop when the integer is less than or equal to a day's worth of minutes (=1440)
#          > if the integer input is more than a day's worth of negative minutes
                   #       > initialize a loop,
                   #       > and w/ each iteration of the loop,
                   #       > add 1440 from the integer 
                   #       > break the loop when the integer is greater than or equal to a negative day's worth of minutes (=-1440)
# initiliaze a variable, sign, that establishes the sign of the integer input; this variable should be -1 if the integer input is negative or 1 if the integer input is positive
# if the inputted integer is negative, multiply it by -1, so that the integer input is positive 
# initialize a new variable, hours, that is equal to the positive integer input divided by 60  <=> this converts positive integer input from minutes to hours
#            <==> this variable = the number of hours that will ultimately either add to 0 or subtract from zero to get to the current time, as there are 60 minutes in an hour
# initialize a new variable, minutes, that is equal to calling the modulo operator on the positive integer <=> (positive integer input) % 60
#           <==> this variable will be indicative of the number of minutes to add or subtract from the hour to get to the current time 
# if the sign variable is positive:
#          convert the hours & the minutes variables to strings
#          initialize a new string variable, time_of_day, that is equal to concatenating the hours string, a colon string, and the minutes string together
# if the sign variable is negative:
#          will finish this algorithm tomorrow!

# sub-method:
def more_than_a_day?(int)
  if int > 1440 
    loop do 
      int -= 1440 
      break if int <= 1440
    end
  elsif int < -1440
    loop do
      int += 1440
      break if int >= -1440
    end
  else
    int # leave int as is, didn't necessarily have to put int here
  end
  int # return int
end

# check my sub-method:
puts more_than_a_day?(-4231)
puts more_than_a_day?(2881)
