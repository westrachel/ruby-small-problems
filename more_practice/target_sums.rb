# Problem:
# Return the indices of the 2 integer values in a provided array that sum to a target integer

# Examples:
# Input: nums = [2, 7, 11, 15], target = 9
# Output: [0, 1]

# Data:
# Input: array and an integer value
# Output: 
#    > array containing 2 elements representing the indices of the integers in the
#       passed in array that add to the target integer value

# Assumptions/constraints:
#   i. each input has only 1 solution
#   ii. the 2 integers summed are at unique indices
#        ex: [3, 3] target = 6, should have the output: [0, 1] NOt [0, 0]
#   iii. 2 <= nums.length <= 10^4
#   iv. -10^9 <= nums[i] <= 10^9
#           <=> numbers can be zero
#   v. -10^9 <= target <= 10^9

# Algorithm:
# 1. Create an array of hashes where each sub-hash's key is an integer element of the 
#      passed in array and the corresponding sub-hash's value is the key integer
#      value's index position in the passed in array
# 2. Create a nested array that is an array of arrays where the nested arrays
#     contain all unique combos of 2 key/value pairs in the hash from step 1
# 3. Sum the keys of the hashes and assign that as the 3rd element in each of the nested arrays
# 4. Iterate through the nested array of sub-arrays and check if the 3rd element summation
#     is identical to the target integer value

# Code:
def indices_to_sum(arr, target)
  array = arr.each_with_object([]) do |x, new_arr|
    new_arr << {x => arr.index(x) }
  end
  new_arr = []
    x = 1
    array[0, array.size].each do |hsh|
      new_arr[hsh, array[x]]
      x += 1
    end
end

p indices_to_sum([2, 7, 11, 15], 9) == [0, 1]
p indices_to_sum([3, 2, 4], 6) == [1, 2]
p indices_to_sum([3, 3], 6) == [0, 1]