# Problem:
# Create a method that accepts one argument input (an array containing subarrays)
# and outputs a flattened array containing only string elements

# Example:
# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Data:
# Input:
#  > an array of sub-arrays
#  > each sub-array contains 2 elements: the first = a string, and the second = an integer
#    <=> the integer specifies the number of times the string should appear in the returned array output

# Output:
#  > one array containing strings

# Algorithm:
# 1. Iterate through the passed in array of sub-arrays & with each iteration:
#     i. push the string element at the 0th index of the sub-array to a new array
#     <=> the string can be pushed multiple items; the string should be pushed
#         as many times as the integer value that is the second element of the sub-array
#         currently being iterated over
# 2. After iterating over all sub-arrays w/in the passed in array, return the
#     new array created that contains only strings

# Code:
def buy_fruit(arr)
  arr.each_with_object([]) do |sub_arr, new_arr|
    sub_arr[1].times { new_arr << sub_arr[0] }
  end
end

# check work:
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
# => true

# Further Exploration:
# Same problem, but with a twist:
# same desired return value output, but different input

# Example:
# fruit_list({"apples" => 3, "orange" => 1, "bananas" => 2}) ==
#  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Data:
# Input:
#  > a hash where each key/value pair is such that each
#       key = a string (a name of a fruit)
#       value = an integer (specifying the # of times the key string should appear in the outputted array)

# Output:
#  > one array containing strings

# Code:
def fruit_list(hsh)
  hsh.each_with_object([]) do |(key, value), new_arr|
    value.times { new_arr.push(key) }
  end
end

# check work:
p fruit_list({"apples" => 3, "orange" => 1, "bananas" => 2}) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
# => true
