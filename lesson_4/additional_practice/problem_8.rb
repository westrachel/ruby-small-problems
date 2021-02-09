#############################        PART 1:        ##################################
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# Expected return value:
# 1
# 3
# => [3, 4]

# Explain the above code:
# The numbers variable is assigned to an array that contains the integers 1:4
# the each method is called on the array referenced by the numbers variable
# in the first iteration over the numbers array, the first integer in the 
# array, 1, is printed using the p method, then the shift method is called on
# the array referenced by numbers. The argument 1 is passed into shift, which 
# will remove the first element, 1, from the array destructively

# On the second iteration, the index referenced is 1, instead of 0, since
# the element at the 0th index was referenced in the first iteration. Since
# the array referenced by numbers has been mutated to have 1 fewer elements,
# the element now at the 1st index is 3 instead of 2 (as 2 is now at the 0th index)
# accordingly, on the second iteration p number will print 3
# when the shift method is called again 2 is removed from the remaining array.
# This leaves the remaining array as [3, 4] before the third iteration begins

# On the third iteration, the index referenced is now 2. However,
# there are only 2 elements remaining in the array. So, the each method iteration stops.
# The original numbers array is returned by the each method, but it has been mutated by 
# the shift call, which is why the final return value specified in line 10 above is [3, 4],
# which is not identical in content to the original array.

############################        END PART 1:        ##################################

###########################           PART 2:          ##################################
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# Expected return value:
# 1
# 2
# => [1, 2]

# Explain the above code:
# The numbers variable is assigned to an array that contains the integers 1:4
# the each method is called on the array referenced by the numbers variable
# in the first iteration over the numbers array, the first integer in the 
# array, 1, is printed using the p method, then the pop method is called on
# the array referenced by numbers. The argument 1 is passed into pop, which 
# will remove the last element, 4, from the array destructively

# On the second iteration, the index referenced is 1, instead of 0, since
# the element at the 0th index was referenced in the first iteration. The array
# referenced by numbers has been mutated to have 1 fewer elements, but the element 
# at the 1 index is the same (it's 2). So, on the second iteration p number will 
# print 2. When the pop method is called again, the last element of the mutated array,
# which is now 3, is removed. This leaves an array with only 2 elements, so there 
# are no further elements to iterate over with the each method

# After iteration, the each method returns the original array. As discussed, the
# original array has been mutated, with its last elements removed. Accordingly,
# the last thing returned is the array: [1, 2].

############################        END PART 2:        ##################################
