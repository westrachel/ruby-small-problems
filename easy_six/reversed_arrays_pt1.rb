# Problem:
# Write a method that takes an Array as an argument and reverses the elements
# do not use Array#reverse
# Have the array returned by the method be the same Array object

# Examples:
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true

# list = []
# reverse!(list) == [] # true
# list == [] # true

# Data:
# Input:
#  > an array
# Output:
#  > an array that's the same object as the passed in array
#     <=> the object id shouldn't change, but the elements in the array should be reversed in order
#  > shown by the examples:
#     > an element w/in the array that has multiple characters shouldn't have its sub-characters reversed
#       <=> reverse the elements in the array, but not the sub-elements w/in elements of the array

# Algorithm:
# i. Initialize a new variable, reversed_arr, that points to an empty array w/in the method
# ii. Call the pop method on the passed in array and push the return value of the pop method call
#   to the new array variable, reversed_arr
# iii. Repeat step ii. until all elements in the passed in array have been pushed to the new array
#        <=> the passed in array will now contain 0 elements (pop is a mutating method & so is push)
# iv. Call the each method on the reversed_arr variable and for each element of reversed_arr, push it to
#    the method's variable parameter the corresponds to the passed in array argument
# v. Specifiy the method's variable parameter as the last expression of the defined method, so that the
#   original array (that's been mutated to have its elements reversed) is the return value of the method 

# Code:
def reverse_array(arr)
  reversed_arr = []
  arr.size.times { reversed_arr << arr.pop }
  reversed_arr.each do |element|
    arr << element
  end
  arr
end

# Examples:
list = [1,2,3,4]
result = reverse_array(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse_array(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse_array(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse_array(list) == [] # true
puts list == [] # true
