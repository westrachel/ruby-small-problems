# Working with Blocks:

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1
      el + 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end

# Explanation:
# The map method is called on an array containing 2 sub-arrays, referred to here in this explanation as sub-array1 and sub-array2.
# Each sub-array is passed into the block of the map method invocation and assigned to the local variable arr. The map method is then called
# again, but is called on each sub-array referred to by the local variable arr. Each element of each sub-array is then passed into the 
# block of the inner map method and assigned to the local variable el. Please note, that arr only references one sub-array at a time. So, the
# inner map method call will iterate through one sub-array before returning a value. Put differently, the inner map method will be called on
# 2 different sub-arrays and will have 2 separate return values. 

# When each element of a sub-array is passed into the inner map method block and assigned to the local variable el, its size gets
# checked in the first line of the if else statement that is in the block of the inner map method call. The element first gets converted 
# to a string and then the size of the string value is compared to 1 for equivalency. All of the elements in sub-array2 are single digit integers,
# so the first line of the if else statement will return as true. As a result, the else statement never gets evaluated for the inner map method call on sub-array2.
# Sub-array1 contains 2 arrays. So, the if statement will never return as true and the else statement will be evaluated for every iteration of the inner map method
# over the 2 sub-arrays within sub-array1.

# The else portion of the if else statement contains another map method call on each element of the sub-array. So, for sub-array2 where the else statement gets evaluated,
# each sub-array within sub-array2 referred to by the local variable el gets the map method called on it, and each integer element within this sub-array referred to by el
# gets passed into the block of the map method call and assigned to the local variable n. Within the map method's block, each integer referred to by n is incremented by 1.
# The inner map method call in the each statement uses the summation value of n + 1, which is the return value of its block, to determine the new array it returns. The new
# arrays returned by the map method call within the else statement are:
# => [2, 3]      
# => [4, 5]

# For sub-array2, the if else statement always returns the value of the if portion of the statement, which is the summation of 1 plus each integer element in sub-array2.

# Based on the above, the return values of the block of the inner map method call are:
# => [2, 3]       <--- return value of the block on the inner map method call on arr, where arr = [[1, 2], [3, 4]]; note that this block return value = new array returned by the map
#                       method call within the else statement
# => [4, 5]       <--- return value of the block on the inner map method call on arr, where arr = [[1, 2], [3, 4]]; note that this block return value = new array returned by the map
#                       method call within the else statement
# => [6, 7]       <--- return value of the block of the inner map method call on arr, where arr = [5, 6] ([5, 6] = sub-array2, the 2nd sub-array of the initial object) 

# The inner map method uses its block return values listed above to determine the new arrays it will return.
# For the first inner map method call on sub-array1, the new array returned contains the sub-arrays: [2, 3] and [4, 5], which is equivalent to sub-array1's original sub-array elements
# incremented by 1. For the second inner map method call on sub-array2, the new array returned contains the elements 6 and 7, which is equivalent to sub-array2's original
# integer elements incremented by 1.

# The new arrays returned by the inner map method call are the block return values of the outer map method call. The outer map method call uses these block return values
# to determine the contents of the new array it returns. Since each block return value of the outer map method call is an array, which is considered truthy, the outer
# map method call returns a new array containing the arrays of each of its block return values. Specifically, the outer map method call returns the array:
# => [[[2, 3], [4, 5]], [6, 7]]

# The outer map method call's new returned array contains 2 sub-arrays like the original array that the outer map method was called on. Each of the sub-arrays
# of the outer map method call's new returned array contain the original sub-arrays' elements incremented by 1. 