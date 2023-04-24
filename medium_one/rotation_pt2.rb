# Problem:
# Create a method that accepts two arguments (two numbers
# and returns a rotated number

# Examples:
# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917

# explicit given:
# the second argument number inputted is always a positive number

# Data:
# Input:
#   > a number
#     > assuming the number is an integer, and not a float
#   > a positive number (integer) specifying the number of digits to rotate
# Output:
#   > a number

# Notes/takeways of how the rotation should work based on the provided examples:
# The first example shows:
#    > if the second integer passed into the method is 1, then
#         the rotation results in returning the original number
# The remaining examples show:
#    > if start counting the elements in the inputted number from the rightmost digit,
#       then the element at the position where the counter's value is equivalent to the
#       second integer passed into the method, then that digit should be removed from its
#       current spot and should be put at the end of the number and this "rotated" number
#        should be returned

# Find the index of the rotated number in some of the examples and
#  examine how it corresponds w/ the counter/value of the second
#   argument passed into the method call before writing an algorithm:

# <=> irb testing:
# example: rotate_rightmost_digits(735291, 2) == 735219
# counter = 2 in this example
# 735291.to_s[(735291.to_s.size - 2)].to_i
# => 9
#   <=> 9 is the digit "rotated" aka moved to the end of the first argument integer

# another example to test the observed patter: 
#  rotate_rightmost_digits(735291, 6) == 352917
#  the counter value is 6 in this example
#  x = 735291
#  counter = 6
#  x.to_s[(x.to_s.size - counter)].to_i  #expecting the return value to be 7
#  => 7

# Algorithm:
# 1. convert the first argument passed into the method into a string
# 2. select the string digit at the desired index where the index's value is the result
#     of subtracting the second integer argument from the string's length
#    (referring to the string created under step 1)
# 3. find the index of the character digit selected under step 2
# 4. convert the string integer into an array of the string digits and iterate
#     through this array selecting only the digits whose index does not
#     equal the index identified under step 2
#     <=> the return value of this step will be a new array of digits excluding
#        the desired last digit
# 5. convert the returned array from step 4 into a string and concatenate the
#     string with the desired last digit
# 6. convert the string returned from the concatenation in step 5 to an integer
#    <=> have this be the last expression evaluated, so that it is the return
#      value of the method

# Code:
def rotate_rightmost_digits(int, counter)
  str = int.to_s
  desired_last_digit = str[(str.size - counter)]
  idx = str.index(desired_last_digit)
  (str.chars.select do |digit|
    str.index(digit) != idx
  end.join('') << desired_last_digit).to_i
end

# Check work:
p rotate_rightmost_digits(735291, 1) == 735291
# => true
p rotate_rightmost_digits(735291, 2) == 735219
# => true
p rotate_rightmost_digits(735291, 3) == 735912
# => true
p rotate_rightmost_digits(735291, 4) == 732915
# => true
p rotate_rightmost_digits(735291, 5) == 752913
# => true
p rotate_rightmost_digits(735291, 6) == 352917
# => true
