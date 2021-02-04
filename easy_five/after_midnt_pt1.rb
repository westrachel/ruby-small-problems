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
# define a sub-method on the integer input that checks if the value of the integer is more than a day's worth of minutes and modifies the 
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
# note: decided to refactor my sub-method, so that it's simpler & it only takes in the positive integer input
#       and modifies this positive integer if it's > 1440
#       <=> this simplification avoids redundant logic and 2 loops that would do the same thing in modifying the integer input to be <= 1 day's worth of minutes

# back in the broader method:
# initiliaze a variable, sign, that establishes the sign of the integer input; this variable should be -1 if the integer input is negative or 1 if the integer input is positive
# if the inputted integer is negative, multiply it by -1, so that the integer input is positive (during refactor of sub-method above, added this logic to my sub-method)
# initialize a new variable, hours, that is equal to the positive integer input divided by 60  <=> this converts positive integer input from minutes to hours
#            <==> this variable = the number of hours that will ultimately either add to 0 or subtract from zero to get to the current time, as there are 60 minutes in an hour
# initialize a new variable, minutes, that is equal to calling the modulo operator on the positive integer <=> (positive integer input) % 60
#           <==> this variable will be indicative of the number of minutes to add or subtract from the hour to get to the current time 
# if the sign variable is positive:
#          convert the hours & the minutes variables to strings
#          initialize a new string variable, time_of_day, that is equal to concatenating the hours string, a colon string, and the minutes string together BUT
#              when concatenate these, need to call additional sub-methods on the hours and minutes within the string interpolation to make sure they're the correct # of digits long
#          sub-method for the hours variable:
#                   > if the hour variable isn't the correct number of digits, this will be b/c it's a single digit # and needs to have a 0 appended before the single digit
#                   > so hour digit checker sub-method should convert the inputted hour integer to a string and append a 0 to the front of it if the inputted hour as a string has a 
#                        length of 1
#          sub-method for the minutes variable:
#                   > if the minutes variable isn't the correct number of digits, this is b/c it's a single digit # and needs to have a 0 appended before the single digit
#                   > so minute digit checker sub-method should convert the inputted minutes integer to a string and append a 0 to the front of it if the inputted minutes as a string has a 
#                        length of 1
# if the sign variable is negative:
#          reassign the hours variable to 23 - the already assigned hours variable to reflect that negative signs correspond w/ times before midnight / work backwards from midnight
#          reassign the minutes variable to 60 - the already assigned minutes variable to reflect that negative signs correspond w/ times before midnight
#          initialize a new string variable, time_of_day, that is equal to concatenation of the following:
#             > return value of the hour digit checker sub-method called on the hours variable + ":" + return value of the minutes digit checker sub-method called on the minutes variable
#  return the time_of_day variable at the end of the method

# sub-method to check if integer inputted is more than a day's worth of minutes:
def more_than_a_day?(int)
  int < 0 ? int *= -1 : int
  if int > 1440 
    loop do 
      int -= 1440 
      break if int <= 1440
    end
  end
  int # return int
end

# check my sub-method: return values should all be <= 1440
puts more_than_a_day?(-4231) # returns 1351 as desired
puts more_than_a_day?(2881) # returns 1 as desired
puts more_than_a_day?(50) # returns 50 as desired

# additional sub-methods to check if hours and minutes have appropriate number of digits, so that final returned value has 5 digits: hh:mm
def correct_hr_length?(hr)
  if hr.to_s.length == 1
    hr = "0" + hr.to_s
  else
    hr = hr.to_s
  end
end

def correct_mins_length?(minutes)
  if minutes.to_s.length == 1
    minutes = "0" + minutes.to_s
  else
    minutes = minutes.to_s
  end
end

# final method:
def time_of_day(num)
  num >= 0 ? sign = 1 : sign = -1
  prepped_num = more_than_a_day?(num)
  hours = prepped_num / 60
  minutes = prepped_num % 60 
  if sign == 1
    time_of_day = "#{correct_hr_length?(hours)}:#{correct_mins_length?(minutes)}"
  else
    hours = 23 - hours
    minutes = 60 - minutes
    time_of_day = "#{correct_hr_length?(hours)}:#{correct_mins_length?(minutes)}"
  end
  time_of_day
end

# check work: below should all print true (they do!)
puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"