# Problem:
# Create a method that takes in a number and outputs the
#   product of the inputted number and 2 unless the inputted
#   number is considered a "double number"
#  <=> in the case the inputted number is a double number,
#   have the method return that number

# Examples:
# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789

# test in irb:
123_456.is_a?(Integer)
# => true

# Data:
# Input:
#   > integer number
# Output:
#   > integer number

# Requirements:
# Double Number Definition - a number with
#    i. an even number of digits
#    ii. whose left-side digits are equivalent to the right-side digits
#  examples of double numbers:
#    44, 3333, 103103, 7676
# examples of numbers that are not double numbers:
#  334433, 444, 107

# note for when test/check logic: ruby won't print underscores when printing long numbers

# Algorithm:
# 1. define a method that checks if an inputted number is a double 
#      number or not and returns the value true if the number is a double #
#    i. this sub-method should check to make sure the length of the number
#          is even when determining if it's a double number
#    ii. this sub-method should slice the number in half and compare the
#           digits in the first half of the slice to the digits in the
#           second half for equivalence
# 2. create another method and within it use the method defined under step 1
#      to determine if a passed in number is a double number
# 3. If the passed in number is a double number, then return that number
# 4. If the passed in number is not a double number, then return the value
#       of the passed in number times 2

# test 2nd part of the if logic in the method below in irb:
# "334334" would be considered a double number string
# half = "334334".length / 2
# =>
# "334334"[0, half] == "334334"[half, half]
# => true
#   <=> returns true as intended

# Code:
def is_double_number?(num)
  str = num.to_s
  size = str.length
  half = size / 2
  if size.even? && (str[0, half] == str[half, half])
    true
  end
end

def twice(number)
  if is_double_number?(number)
    number
  else
    2 * number
  end
end

# check work:
p twice(37) == 74
# => true
p twice(44) == 44
# => true
p twice(334433) == 668866
# => true
p twice(444) == 888
# => true
p twice(107) == 214
# => true
p twice(103103) == 103103
# => true
p twice(3333) == 3333
# => true
p twice(7676) == 7676
# => true
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# => true
p twice(5) == 10
# => true
