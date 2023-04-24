# Working with Blocks:

[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]    <--- return value of map method call

# Explanation:
# The map method is called on an array containing two sub-arrays, referred to here in this explanation
# as sub-array1 and sub-array2. Each sub-array is passed into the block of the map method invocation and
# assigned to the local variable element1. The each method is then called on this local variable, element1.
# Element1 is passed into the block of the each method invocation and assigned to the local variable element2.
# Element2 is then passed into the block of the partition method and assigned to the local variable element3.
# So, each sub-array will be assigned to element3 and each of the elements in the sub-array are checked to see if their
# size is greater than 0. The partition method returns a true array and a false array. These returned arrays' contents depend
# on the truthiness of the block's return value, which is determined by whether or not the elements of the sub-array have
# sizes greater than 0. Each sub-array that gets passed to the element3 local variable contains 1 element sub-arrays that 
# have sizes greater than 0. Accordingly, the partition method's returned true array will be equivalent to the sub-array that is 
# called on with the partition method and the false array will be empty.

# Sub-array1 = [[[1], [2], [3], [4]]
# The partition call on sub-array1 returns:
# => [[[[1], [2], [3], [4]], [] ]    <---> [returned true array, returned false array]


# Sub-array2 = [['a'], ['b'], ['c']]
# The partition call on sub-array1 returns:
# => [[['a'], ['b'], ['c']], [] ]   <---> [returned true array, returned false array]

# The return values of the partition method is the return value of the block of the each method call. The each method does
# not use its block return value to determine what its return value is. Instead, the each method returns the array it was called on.

# Sub-array1 = [[[1], [2], [3], [4]]   <--- the each method's return value = sub-array1 for the 1st iteration of the outer map method call
# Sub-array2 = [['a'], ['b'], ['c']]   <--- the each method's return value = sub-array2 for the 2nd iteration of the outer map method call

# The each method's return value is the return value of the block of the outer map method call.
# The outer map method uses the truthiness of its block's return value to determine the transformation it uses to produce the new array it returns.
# For this example, since both of the sub-arrays returned by the each method are truthy, the block return values of the map method call are truthy. 
# Therefore, The outer map method returns a new array containing the same sub-arrays as the array the map method was originally called on.
#  => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]    <--- return value of map method call
