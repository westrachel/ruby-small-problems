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

# rotation:
# > first row (1st sub-array) becomes the 3rd column
#      (= elements at the last index of each sub-array) in the rotated array
# > second row (2nd sub-array) becomes the middle column
# > third row (3rd sub-array) becomes the 1st column

# Algorithm:
# 1. create a new empty array
# 2. push empty sub-arrays to the empty array created in step 1
#     <=> do this as many times as the number of elements in the passed in nested array
# 3. initialize an index variable that points to the value zero
# 4. iterate through each sub-array of the passed in nested array and w/in each iteration:
#    > loop through the sub-array and push the sub-array's element to the relevant row
#       aka empty sub-array of the newly created array (created in steps 1 and 2)
#      <=> the first element of the sub-array should get pushed to the front of 1st sub-array
#          of the newly created nested array
# 5. return the newly rotated nested array

# Code:
def rotate90(arr)
  rotated = []
  arr.size.times { rotated.push([]) }
  idx = 0
  arr.each do |sub_array|
    until idx == sub_array.size
      rotated[idx].insert(0, sub_array[idx])
      idx += 1
    end
    idx = 0
  end
  rotated
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
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2