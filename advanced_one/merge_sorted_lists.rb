# Problem:
# Create a method that takes 2 sorted array arguments and returns one array
#  with all sub-elements sorted. The solution shouldn't sort the result array.

# Examples:
# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]

# Data:
# Input:
#   > 2 sorted arrays
# Output:
#   > 1 sorted array that is the combination of the inputted arrays

# Other requirements:
# Don't mutate the passed in arrays

# Algorithm:
# 1. Create a clone of the first passed in array
# 2. Iterate through each of the elements in the second array
#      i. Find the index of the element in the first cloned array that is greater than or equal to
#            to the current element being iterated over from the second array
#      ii. Insert the element being iterated over into the cloned first array at the index
#             found in step 2i.
#             <=> this essentially pushes the smaller element (or equivalently sized element) to be in front of
#                  either a larger element (or equivalently sized element which should still result in appropriate sorting)
# 3. Return the mutated cloned array that is the sorted array of the 2 combined arrays

# 2i. step expansion/testing:
# I think I can use Array#index method invocation w/ a block to find the index of the first
#   passed in array that is > than the element being iterated over:
a = [1, 2, 3]
b = [0, 4]
b.each do |add_this_num|
  idx = a.index { |x| x > add_this_num }
  a.insert(add_this_num, idx)
end
p a
# => [0, 1, 2, 3, nil]

# My above approach needs to be modified slightly to account for instances where there
#    is no element greater than or equal to the number being pushed to the array, 
#    because I don't want to push nil to the array
#   <=> if idx is null, then push the element to the end of the array
a = [1, 2, 3]
b = [0, 4]
b.each do |add_this_num|
  idx = a.index { |x| x >= add_this_num }
  if idx.nil?
    a << add_this_num
  else
    a.insert(add_this_num, idx)
  end
end
p a
# => [0, 1, 2, 3, 4]

# Code:
def merge(arr1, arr2)
  arr = arr1.clone
  arr2.each do |num|
    idx = arr.index { |x| x >= num }
    if idx.nil?
      arr << num
    else
      arr.insert(idx, num)
    end
  end
  arr
end

# check work:
a = [1, 5, 9]
b = [2, 6, 8]
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# => true

# check that a and b haven't been mutated:
p a == [1, 5, 9]
# => true
p b == [2, 6, 8]
# => true

p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# => true
p merge([], [1, 4, 5]) == [1, 4, 5]
# => true
p merge([1, 4, 5], []) == [1, 4, 5]
# => true
