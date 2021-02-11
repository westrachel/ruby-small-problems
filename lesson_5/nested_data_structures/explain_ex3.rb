
# Working with Blocks:

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Expected Output & Return Value:
# 1
# 3
# => [1, 3]

# Explanation:
# The map method is a call on a nested array
# Each sub-array is passed into the block and assigned to the local variable arr.
# The puts method is called on the return value of arr.first. Arr.first returns the 
# element at the 0th index of each sub-array. So, the integers 1 and 3 are printed
# in each of the 2 iterations. The puts method call is not the last expression evaluated in 
# block in this example. Rather, arr.first is the last expression evaluated. Arr.first returns 
# the value of the integer at the 0th index in each sub-array. Integers are considered truthy,
# so for both iterations, The return value of the block is considered truthy. 
# The map method uses the return value of the block to perform trasnformation that determines what elements are 
# in the new array that the map method returns. Since the return value of the block 
# is truthy and is the first element of each sub-array, the map method call will return a new array with 2 elements:
# 1 and 3, as 1 and 3 are the 2 elements located at the 0th index of each sub-array.
# = > [1, 3]  