
# Working with Blocks:

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end

# Expected Output & Return Value:
# 1
# 3
# => [[1,  2], [3, 4]]

# Explanation:
# The each method is a call on a nested array
# During each iteration, each sub-array within the nested array is referred to by
# the <arr> argument passed into the block after the each call
# The puts method is chained with the first method call on each sub-array,
# so that during each iteration, the first element of each sub-array is printed.
# The each method call returns the original collection, which is the nested array 
# that the each method was called on


# Other notes about the above code:
# A different way to describe the sub-array relationship with arr is:
# each sub-array is passed into the block and is assigned to the local variable arr
# the puts method call in the block will return nil, but recall that the each method
# doesn't do anything with the returned value