# Problem:
# Create a method that takes two arrays containing only numbers and calculates
#  the products of all possible number pairs from combining the two arrays
# The method should return all products possible sorted from smaller to largest
#  in a new array

# Allowed assumption:
#  > neither array inputted is empty

# Example:
# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Data:
# Input:
#  > 2 array containing numbers (possibly integers or floats)
#  > The 2 arrays can be different sizes
# Output:
#  > New array containing the product values of the multiplication of each
#    number in one array by every number in the second passed in array

# Algorithm:
# 1. Initialize a new array variable called number_pairs that points to an empty array
# 2. Initialize an index variable that starts w/ a value of 0
# 3. Iterate through each element of the first passed in array using the each method
#     i. initialize a loop w/in the each method's block
#     ii. for each iteration of the inner loop, push an array containing two elements to
#      the number_pairs array. The 2 elements pushed:
#           a. the first array element that's assigned to the local variable initialized
#               in the each method block
#           b. the second array's number element that is located at the index variable's value
#      <=> essentially, the inner loop loops through the second array's numbers and pushes
#         those numbers individually w/ the first array's number
#     iii. end the loop once have iterated through all the numbers in the second array
#     iv. reassign the index variable to zero, before the each method starts it's next iteration
# 4. Multiply each sub-array pair in the created number_pairs together and return the product
#     in a new array and have this returned array be the return value of the larger method
#       > call the each with object method on the number_pairs array and specify to return an array
#       > w/in the block of the each w/ object method call, assign each sub-array that contains 2
#          numbers to the local variable pair_array and w/in the block of this inner method call
#          multiply the number at 0th index of pair_array by the number at the 1st index of pair_array
# 5. Call the sort method on the new array returned by step 4, so that all products are sorted by
#    increasing order

# Code:
def multiply_all_pairs(arr1, arr2)
  number_pairs = []
  index = 0
  arr1.each do |number|
    until index == arr2.size
    number_pairs << [number, arr2[index]]
    index += 1
    end
    index = 0
  end
  number_pairs.each_with_object([]) do |pair_arr, new_arr|
    new_arr << (pair_arr[0] * pair_arr[1])
  end.sort
end

# Check work:
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# => true
