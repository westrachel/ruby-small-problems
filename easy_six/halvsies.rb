# Problem:
# Create a method that takes one array and returns a nested array
#  containing 2 sub-arrays that each contain approximately half of the
#  original passed in array's elements
# ==> If original array contains an odd # of elements, than it won't be an
# equal split and the first sub-array in the returned array should have more
# elements

# Examples:
# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]

# Data:
# Input:
#  > Array
# Ouput:
#  > Nested array containing 2 sub-arrays

# Algorithm:
# Initialize a new variable pointing to an empty array called nested_arr
# Push to the nested_arr the elements that make up the first half of the passed in array
#    i. calculate the number of elements that make up the first half of the elements in the passed in array
#        > for even sized arrays, the first half of the number of elements in the array = array.size / 2
#        > for odd sized arrays, the first half of the number of elements in the array = (array.size / 2) + 1
#              <=> adding 1 more, because want the first half to contain 1 more element than the second half
#              <=> when divide an integer (= return value of array.size) by 2, the return value is the rounded down number
#                Example: 7 / 2 => 3
#    ii. slice the original passed in array:
#          > specify the start parameter of the slice as the first element of the original passed in array = element at the 0th index
#          > specify the length parameter of the slice call as the number of elements in the first half of the original passed in array
#                    <=> the length is the value calculated in i.
#   iii. push the return value of the slice call in step ii. to the nested_arr variable
#   iv. slice the original passed in array a second time:
#          > specify the start parameter as the index that corresponds with the 1st element that makes up the second half of the original array
#                    <=> this index should actually equal the value caluclated in step i. b/c indices start at 0
#          > specify the length parameter of the slice call as the size of the original array passed in minus the number of elements that make up the first half
#                    <=> = array.size - (value calculated in i.) = array.size - (array.size / 2 + 1)
#    v. push the return value of the second slice call in step iv. to the nested_arr variable
#    vi. return the nested_arr variable by specifiying it as the last expression in the method definition
#
# Code:
def halvsies(original_arr)
  nested_arr = []
  if original_arr.size.odd?
    num_elements_first_half = original_arr.size / 2 + 1
  else
    num_elements_first_half = original_arr.size / 2
  end
  nested_arr << original_arr[0, num_elements_first_half]
  num_elements_second_half = original_arr.size - num_elements_first_half
  nested_arr << original_arr[num_elements_first_half, num_elements_second_half]
  nested_arr
end

# Check Work:
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# => true
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# => true
p halvsies([5]) == [[5], []]
# => true
p halvsies([]) == [[], []]
# => true

# Refactor code:
def halvsies(orig_arr)
  if orig_arr.size.odd?
    num_elements_first_half = orig_arr.size / 2 + 1
  else
    num_elements_first_half = orig_arr.size / 2
  end
  num_elements_second_half = orig_arr.size - num_elements_first_half
  [orig_arr[0, num_elements_first_half], orig_arr[num_elements_first_half, num_elements_second_half]]
end

# Check Work:
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# => true
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# => true
p halvsies([5]) == [[5], []]
# => true
p halvsies([]) == [[], []]
# => true

# Further Exploration:
# alternative solution uses logic: (array.size / 2.0).ceil to calculate
#  the number of elements in the first half
#    > Using 2.0 causes the return value of (array.size / 2.0) to be a float
#      which is useful when working with array.sizes that are odd integers
#    > When call .ceil on the return float value the returned integer will be the float value
#       rounded up if it's a decimal
#     for example:
#        say array.size = 5 
#         (array.size / 2.0).ceil = (2.5).ceil = 3
#     If used 2 instead:
#         (array.size / 2).ceil = (2).ceil = 2
#     <=> using 2.0 ensures that the first sub_array in the returned nested array has one more
#       element than the second sub_array in the returned nested array if the passed in original array
#       has an odd number of elements
