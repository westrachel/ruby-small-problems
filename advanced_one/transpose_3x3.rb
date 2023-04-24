# Problem:
# Create a method that accepts a nested array (representing a 3x3 matrix)
#  and returns the transpose of the array

# Example:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
 ]

# transpose = [
#  [1, 4, 3],
#  [5, 7, 9],
#  [8, 2, 6]
# ]

# Data:
# Input:
#   > an array containing 3 sub-arrays, with each sub-array containing 3 number elements
#   > inputted array should not be mutated
# Output:
#   > the transpose of the inputted array = a new nested array containing 3 sub-arrays, where
#      the inputted array's columns are the rows of the outputted matrix/nested array

# Algorithm:
# 1. initialize a new empty array variable
# 2. iterate through the sub-arrays of the inputted array and:
#       >> push all elements located at the 0th index of each sub-array to a new array
#       >> push all elements located at the 1st index of each sub-array to a different new array
#       >> push all elements located at the 2nd index of each sub-array to a different new array
# 3. Push all the newly created arrays from step 2 to the empty array initalized in step 1
# 4. return the transpose nested array from step 3

# Code:
def transpose(arr)
  matrix = [[], [], []]
  arr.each do |sub_array|
    matrix[0] << sub_array[0]
    matrix[1] << sub_array[1]
    matrix[2] << sub_array[2]
  end
  matrix
end

# check work:
new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# => true
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# => truce
