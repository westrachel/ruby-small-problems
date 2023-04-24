arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# return a new array w/ the same sub-arrays as above, but the sub-arrays are ordered
# numerically largest to greatest only considering the odd numbers they contain
# desired return value:
# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# can see that the first element of each sub-array is 1, so that won't help with sorting
# can also see that the second element of each sub-array is even, which I don't want to consider in sorting
# accordingly, the leaves the sorting of sub-arrays to be based on the 3rd element (aka the element at the 2nd index)
# of each sub-array
arr.sort_by {|sub_array| sub_array[2] }
# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
# confirmed desired return value by running the above command in irb
