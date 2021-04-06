# Problem:
# Create a method that takes one argument, a string, and returns an array
# of all the possible substrings of the inputted array, ordered from shortest
# substring to longest substring.

# Examples:
# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Data:
# Input:
#   > a string
# Output;
#   > array of substrings

# Assumption:
# The inputted string can contain spaces and other non-letter characters, but
#  those still count as being part of one inputted string.

# Consequence of the above assumption:
# The returned output does not need to be a nested array containing
# sub-arrays that contain all substring combos for each of the string words
# passed as arguments into the method call.

# Algorithm:
# 1. Initialize a variable called length that points to the integer value 1
# 2. Initialize an array variable that points to an empty array
# 3. Create a loop and within each iteration of the loop:
#      i. slice the inputted string, selecting the string character at the
#           0th index and selecting the length of the slice as the current
#           value of the length variable
#      ii. pass the sliced string returned from i. above to the array
#      iii. add one to the length variable
#      iv. break out of the loop if the length variable is equivalent to the
#         size of the inputted string
# 4. Return the array variable by setting it as the last expression evaluated
#     in the method

# Code:
def substrs(sub_string)
  length = 1
  substrs_arr = []
  loop do
    substrs_arr << sub_string[0, length]
    length += 1
    break if length == (sub_string.size + 1)
  end
  substrs_arr
end

# Check work:
p substrs('abc') == ['a', 'ab', 'abc']
# => true
p substrs('a') == ['a']
# => true
p substrs('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# => true
