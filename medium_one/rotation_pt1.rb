# Problem:
# create a method that takes one argument input (an array) and returns a new array
#   that is almost identical to the passed in array, except the first element of the
#   inputted array has been moved to the end of the array

# Examples:
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# Data:
# Input: an array
# Output: a new array

# requirements:
#  > can't use Array#rotate or Array#rotate! methods
#  > the original array should not be mutated

# Algorithm:
# 1. select all elements from the passed in array except for the 1st element
#   <=> Array#[] method does not modify self, which means that I should be able
#     to push to the array of values returned by the Array#[] method call the
#     first element of the passed in array without mutating the passed in array
# 2. push the first element to the returned array from step 1
# 3. make the return array value from step 2 be the return value of the method
#     by assigning it as the last expression evaluated w/in the method definition

# Code:
def rotate_array(arr)
  arr[1, (arr.length - 1)].push(arr[0])
end

# check work:
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# => true
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# => true
p rotate_array(['a']) == ['a']
# => true

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
# => true
p x == [1, 2, 3, 4]
# => true

# Further Exploration: part 1
# adjust the method to rotate a string instead of an array
def rotate_string(str)
  str[1, (str.length - 1)] + str[0]
end

# check work:
p rotate_string("hello") == "elloh"
# => true
p rotate_string("x") == "x"
# => true

y = "apricot"
p rotate_string(y) == "pricota"
# => true
p y == "apricot"
# => true

# Further Exploration: part 2
# adjust the method to rotate an integer
def rotate_integer(int)
  rotated_str_int = rotate_string(int.to_s)
  rotated_str_int.to_i
end

# check work
p rotate_integer(234987) == 349872
# => true
p rotate_integer(5) == 5
# => true

z = 123456
p rotate_integer(z) == 234561
# => true
p z == 123456
# => true
