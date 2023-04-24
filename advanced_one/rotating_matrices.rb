# Problem:
# Create a method that rotates a matrix (= a nested array) clockwise 90 degrees
#  and returns the new rotated matrix

# Example:
#matrix = [
#  [1, 5, 8],
#  [4, 7, 2],
#  [3, 9, 6]
#]

#rotated_matrix = [
#  [3,  4,  1],
#  [9,  7,  5],
#  [6,  2,  8]
#]

# rotation for 3x3 square matrix:
# > first row (1st sub-array) becomes the 3rd column
#      (= elements at the last index of each sub-array) in the rotated array
# > second row (2nd sub-array) becomes the middle column
# > third row (3rd sub-array) becomes the 1st column

# rotation for non-square matrix:
# [[3  4  1],
#  [9  7  5]]

# rotated matrix:
# [[9, 3],
#  [7, 4],
#  [5, 1]]

# notes: 
#  > first column becomes first row
#  > second column becomes second row
#  > third column becomes third row

# takeaways from the examples:
# I want to essentially flip/transpose columns into rows
# In prior problem, created a sub-method that can transpose, so can leverage that 


# Algorithm:
# 1. Initialize an empty array to store new subarrays
# 2. Want to select all elements at the same index of each subarray of the array argument
#     > Invoke the times method on the size of the array argument's first subarray (to make sure that all elements are considered)
#          <=> the times method's block's parameter will keep track of the index to select elements at from each subarray
#     > within the block, initialize an empty subarray 
#     > invoke the each method on the array argument
#         >push each element at the index integer position of each subarray to the previously initialized subarray
#     > on each iteration of the times method will have one sliced subarray that I want to push to the array that subarrays points to
#          <=> push the reversed version of the sliced_subarray to the subarrays array
# 3. Return the array that subarrays points to

# Code:

def rotate90(arr)
  subarrays = []
  arr[0].size.times do |index|
    sliced_subarray = []
    arr.each do |sub_array|
      sliced_subarray << sub_array[index]
    end
    subarrays << sliced_subarray.reverse
  end
  subarrays
end


# check work:
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# => true
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# => true
p new_matrix3 == matrix2
# => true
