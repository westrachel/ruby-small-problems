# Problem:
# create a method that searches a passed in array for a value specified
# as the second argument passed into the method call

# do not use Array#include?

# Examples:
# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false

# Data:
# Input:
#   > an array & a value to search the array for
# Output:
#   > true or false boolean

# Algorithm:
# iterate over the passed in array using the any? method
#     > w/in the block of the any? invocation w/ a block, check if
#        any of the elements in the passed in array are equivalent
#        to the value specified as the 2nd argument of the outer method invocation
#     <=> the any? method's return value is true or false

# Code:
def includes?(arr, value)
  arr.any? { |element| element == value }
end

# Check Work:
p includes?([1,2,3,4,5], 3) == true
# => true
p includes?([1,2,3,4,5], 6) == false
# => true
p includes?([], 3) == false
# => true
p includes?([nil], nil) == true
# => true
p includes?([], nil) == false
# => true
