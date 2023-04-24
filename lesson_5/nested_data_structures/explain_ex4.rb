
# Working with Blocks:

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end

# Expected Output & Return Value:
# 18 
# 7
# => [18, 7]  <--- return value of the inner each method call on the first sub-array [18, 7]
# 12
# => [3, 12]  <--- return value of the inner each method call on the second sub-array [3, 12]
# => [[18, 7], [3, 12]]   <--- return value of the outer each method call on the nested array

# Note: 
# my_arr = [[18, 7], [3, 12]]
#     <=> my_arr is assigned to the return value of the each method call on the nested array
#         and the each method returns the value of the original collection it's called on, which is 
#         why my_arr contains the same elements as the nested array that #each is called on.

# Explanation:
# The variable my_arr is assigned to the return value of the calling the each method on a nested sub-array.
# As explained above, the each method returns the original collection it's called on, so my_arr is equivalent to the
# nested array that the outer each method is called on.
# During the method invocation with a block, each sub-array of the larger nested array is passed into the block
# and assigned to the local variable arr. Within the block, another each method is called on the local variable arr.
# Within this inner each method call, each integer element of the sub-array referred to by arr is passed into an if-statement
# and checked to see if it's larger than 5. If the integer element is greater than 5, then that integer element is printed
# the puts method. For the first local varaible arr assignment to [18, 7], both inner each method calls will evaluate the 
# if statement since both 18 and 7 are greater than 5. So, for each iteration on the first local variable arr assignment,
# 18 and 7 will be printed with the puts method. Then the arr sub-array will be returned by the inner each method.
# Subsequently, the local variable arr will reference the second sub-array of the larger nested array: [3, 12].
# The inner each method is called on this second sub-array and on the first iteration of the inner each method, the 
# if statement is not evaluated as 3 is not greater than 5. On the second iteration of the inner each method, the 
# if statement is evaluated as 12 > 5 and 12 is printed by the the puts method call. 
# 12 is the last element of the second sub-array, so the inner each method has finished iterating and will return 
# the original collection it's called on, which is the sub-array: [3, 12].
# Subsequently, there are no more sub-arrays in the larger nested array to iterate over. So, the inner each method
# call has no more iterations to run through. Furthermore, the outer each method has no more iterations to run through.
# Accordinlgly, the outer each method will return the original collection it was called on, which is the larger nested 
# array containing 2 sub-arrays.

# Implied in the above explanation, but called out for extra clarity:
# The each method does not use the return value of its block.
