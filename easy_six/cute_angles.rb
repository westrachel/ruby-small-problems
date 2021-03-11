# Problem:
# create a method that converts a float number to an angle between 0 and 360 degrees

# Examples:
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Data:
# Input: 
#   > float or integer
#   Implicit input assumptions:
#     > a float number > 360 could technically be entered, but it should still return an angle between 0 and 360
#     > no negative numbers will be inputted

# Output:
#   > string w/ the angle reported in tegerms of degrees, minutes, & seconds
#      > if there are single digits in the minutes and seconds values, they
#         should have a 0 before them (ie 5 minutes should be outputted as 05)
#   > Angle returned should be between 0 and 360

# Provided string constant:
DEGREE = "\xC2\xB0"

# Algorithm:
# i. If the inputted float number is greater than 360, then subtract 360 enough times such that the float
#     number is <= 360 (reassign the inputted float number variable to this result)
# ii. Create a decimal variable that points to the result of subtracting the float number value floored
#        from the float number itself
#     Ex. float number passed in = 76.73 => float number floored = 76 
#           => decimal = 76.73 - 76 = 0.73
# iii. Create a minutes_unrounded variable that points to the product of the decimal variable and 60
# iv. Create a minutes_rounded variable that points to the floored minutes unrounded variable
# v. Create a minutes string variable that points to either the concatenation of zero and the single digit minutes_rounded variable if
#     the minutes_rounded variable is a single digit (ie < 1-) or just points to the minutes_rounded variable converted to a string
# vi. Create a seconds variable that points to the result of:
#       (minutes_unrounded - minutes_rounded)*60
# vi. Create a seconds_rounded variable that points to the floored seconds variable
#         > based on the examples, I don't want to print a seconds # that has a decimal
# vii. Create a seconds string variable that points to either the concatenation of zero and the single digit seconds_rounded variable
#       if the seconds_rounded variable is less than 10 or points t the seconds_rounded variable converted to a string
# vii. Have the last expression of the method convert the passed in float number value floored to a string
#          that is returned alongside the DEGREE constant, the minutes string variable, the ' symbol that represents
#          minutes and then the seconds string variable and the corresponding seconds symbol

# Update to algorithm above:
#   > Can I create a single quotation mark seconds constant and return that? I can't just add a single quote within double quotes
# SECONDS = " <=> can't create a single quotation mark constant by itself
SECONDS = %(")

# Code:
def dms(number)
  if number > 360
    number = number - (360 * (number / 360).floor)
  end
  decimal = number - number.floor
  minutes_unrounded = decimal * 60
  mins_rounded = minutes_unrounded.floor
  mins_rounded < 10 ? mins_str = "0#{mins_rounded}" : mins_str = mins_rounded.to_s
  seconds_unrounded = (minutes_unrounded - minutes_unrounded.floor) * 60
  seconds_rounded = seconds_unrounded.floor
  seconds_rounded < 10 ? seconds_str = "0#{seconds_rounded}" : seconds_str = seconds_rounded.to_s
  "#{number.floor}#{DEGREE}" + mins_str + "'" + seconds_str + "#{SECONDS}"
end

# Check Work:
# return values can reasonably be slightl different than the values commented out
puts dms(30) #== %(30°00'00")
# => 30°00'00"
puts dms(76.73) #== %(76°43'48")
# => 76°43'48"
puts dms(254.6) #== %(254°36'00")
# => 254°35'59"
puts dms(93.034773) #== %(93°02'05")
# => 93°02'05"
puts dms(0) #== %(0°00'00")
# => 0°00'00"
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")
# => 360°00'00"

# Further Exploration:
# Update method to work for cases where a negative float number is inputted into the method
def dms(number)
  if number > 360
    number = number - (360 * (number / 360).floor)
  elsif number < 0
    until number > 0
      number += 360
    end
  end
  decimal = number - number.floor
  minutes_unrounded = decimal * 60
  mins_rounded = minutes_unrounded.floor
  mins_rounded < 10 ? mins_str = "0#{mins_rounded}" : mins_str = mins_rounded.to_s
  seconds_unrounded = (minutes_unrounded - minutes_unrounded.floor) * 60
  seconds_rounded = seconds_unrounded.floor
  seconds_rounded < 10 ? seconds_str = "0#{seconds_rounded}" : seconds_str = seconds_rounded.to_s
  "#{number.floor}#{DEGREE}" + mins_str + "'" + seconds_str + "#{SECONDS}"
end

# Check work:
puts dms(400) #== %(40°00'00")
# => 40°00'00"
puts dms(-40) #== %(320°00'00")
# => 320°00'00"
puts dms(-420) #== %(300°00'00")
# => 300°00'00"
