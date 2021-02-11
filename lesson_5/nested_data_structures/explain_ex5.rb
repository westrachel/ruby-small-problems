
# Working with Blocks:

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# Expected Output & Return Value:
# => [2, 4]    <--- return value of the inner map method call on the first sub-array of the larger nested array
# => [6, 8]    <--- return value of the inner map method call on the second sub-array of the larger nested array
# => [[2, 4], [6, 8]]   <--- return value of the outer map method call on the nested array


# Explanation:
# The map method is called on a nested array containing two sub-arrays: sub-array1 and sub-array2. Sub-array1 is
# first passed into the block and assigned to the local variable arr. Within the block, the map method is called 
# on sub-array1. The first element of sub-array1, 1, is passed into the block of this inner map method call and is 
# assigned to the local variable num. Then num is multplied by 2. The product is 2, which is considered a truthy
# value in the Ruby language. Subsequently, the second and final element of sub-array1, 2, is passed into the block of the inner
# map method call and is assigned to the local variable num. The product of num and 2 in this iteration is also an integer, 4, 
# which is considered truthy. The inner map method is finished iterating on sub-array1. The map method uses the return value 
# of the block during each iteration to determine the transformation used to produce the new array that will be the ultimate return 
# value of the map method call. Since each iteration over the elements of sub-array1 produced truthy values, the inner map method 
# call on sub-array1 will return a new array that contains the integer products of each element in sub-array1 times 2, which is equivalent 
# to the array: [2, 4].

# After the inner map method call returns the new array [2, 4], the 2nd sub-array of the larger nested array, referred to as 
# sub-array2 in this explanation, will have the inner map method called on it. The first element of sub-array2 is passed into the 
# block and assigned to the local variable num, which gets multiplied by 2. This returns the integer value 6 (3 * 2 = 6). 6 is a truthy
# value, so the return value of the block of the first iteration of the inner map method call on sub-array2 is truthy. The inner map
# method uses this return value and will include 6 as the first element of its new returned array. However, the 2nd element of sub-array2
# needs to be iterated over before the new array of the inner map method call is returned. The 2nd element of sub-array2 is passed into the 
# block and assigned to the local variable num. Num is multiplied by 2, which returns the value 8. The inner map method evaluates this block
# return value of 8 as truthy and will include 8 as the second element of its new returned array. Since sub-array2 only has 2 elements,
# there are no more elements to iterate over. So, the inner map method call on sub-array2 is finished and its new returned array is the array:
# [6, 8].

# The inner map method call's return values ([2, 4] and [6, 8]) are the return values of the block of the outer map method call. The outer 
# map method call uses these inner map method calls to determine the new array that it returns. Since both of these return values are arrays,
# which are considered truthy, the outer map method call will return a new array that contains these 2 arrays. 
# Accordingly, the return value of the outer map method call is the nested array: [[2, 4], [6, 8]].