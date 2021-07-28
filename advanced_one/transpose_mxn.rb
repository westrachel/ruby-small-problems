# Problem:
# Modify the 3x3 transpose method to be able to transpose any array inputted
#   with at least 1 row and 1 column

# Code:
def transpose(arr)
  matrix = []
  arr[0].size.times { matrix.push([]) }
  idx = 0
  arr.each do |sub_array|
    until idx == sub_array.size
      matrix[idx] << sub_array[idx]
      idx += 1
    end
    idx = 0
  end
  matrix
end

# check work:
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# => true
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# => true
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# => true
p transpose([[1]]) == [[1]]
# => true