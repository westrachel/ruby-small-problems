# Working with Blocks:

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end

# Expected Output & Return Value:
# 1
# 3
# => [nil, nil]

# Explanation:
# The map method is a call on a nested array
# Each sub-array is passed into the block and assigned to the local variable arr.
# The puts method is called on the return value of arr.first. Arr.first returns the 
# element at the 0th index of each sub-array. So, the integers 1 and 3 are printed
# in each of the 2 iterations. Since the puts call is the last expression evaluated in the block,
# the return value of puts is nil. So, the return value ofthe block for both of the 2 iterations
# is nil. The map method uses the return value of the block to perform trasnformation that 
# determines what elements are in the new array that the map method returns. Since the return 
# value of the block is nil, the map method call will return a new array with 2 elements both equal to nil:
# [nil, nil]