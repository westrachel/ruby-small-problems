# Problem:
# Create a method that accepts 2 sorted array arguments and returns a new array
#  that contains all elements from both arguments in sorted order

# Requirements:
# > can't sort the result array; must build the array one element at a time in the correct order
# > can't mutate the inputted arrays

# Algorithm:
# > initialize an empty array to be returned overall by the method
# > create an index1 variable that points to 0 that will keep track of iterating through the first array
# > create an index2 variable that points to 0 that will keep track of iterating through the second array
# > start a loop
#     > check if the element at index1 in the first array is less than or equal to the element at index2 of the second array
#        > if it is, then add the element at index1 position in the first array to the initialized array (b/c want to sort in ascending order)
#        > if it's not, then add the element at index2 position in the first array to the initialize array
#     > if added the element at index1 in the first array, then add 1 to the integer that index1 points to
#     > if added the element at index2 in the second array, then add 1 to the integer that index2 points to
#     > keep iterating until have pushed all elements in both index1 and index2 to the initialized array
#          <=> a condition that checks for this is checking to see if the return array is the same size as
#             the sum of the sizes of the array arguments

# add in additional functionality to handle the case of an empty array input where either

# Code:
def merge(arr1, arr2)
  sorted_arr = []
  idx1 = 0
  idx2 = 0
  until sorted_arr.size == (arr1.size + arr2.size)
    if (!arr1[idx1].nil? && (arr2[idx2].nil? || arr1[idx1] <= arr2[idx2]))
      sorted_arr << arr1[idx1]
      idx1 += 1
    else
      sorted_arr << arr2[idx2]
      idx2 += 1
    end
  end
  sorted_arr
end

# check work:
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# => true
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# => true
p merge([], [1, 4, 5]) == [1, 4, 5]
# => true
p merge([1, 4, 5], []) == [1, 4, 5]
# => true

# Problem:
# Create a method that accepts an array of all numbers or all strings and returns
#  an array of the strings or numbers sorted using merge sort

# Merge Sort Requirements:
# > provided breakdown:
#     [9, 5, 7, 1] => [[9, 5], [7, 1]] => [[[9], [5]], [[7], [1]]] =>
#     [[5, 9], [1, 7]] => [1, 5, 7, 9]

# <=> the example jumps from sub-arrays containing sub-arrays of single elements and
#    to only 2 sub-arrays with the inner elements sorted

# Algorithm:
# > initialize an empty array, referred to as splits
# > iterate through the array argument and push each single element into its own array into the splits
# > initialize an empty array, subarrays (that will contain only 2 sub-arrays)
# > select the first half of the array elements in splits and combine them into 1 sub-array
# > invoke the map method on the 2_element_arrs and call the merge method on each sub-array that contains
#      2 single element sub-arrays
#     => this will sort each sub-array and achieve the [[5, 9], [1, 7]] result
# > if the sorted array returned by the map method only has one sub-array and doesn't need further sorting
#     then flatten the sorted array and return it
# > if the sorted array returned by the map method has 2 sub-arrays then call the merge method again

# would have to expand the following solution/refactor the if statement logic to handle larger inputted arrays

# Code:
def merge_sort(arr)
  splits = arr.each_with_object([]) do |element, arr|
    arr << [element]
  end
  index1 = 0
  index2 = 1
  subarrays = []
  loop do
    splits[index1] = [] if splits[index1].nil?
    splits[index2] = [] if splits[index2].nil?
    subarrays << [splits[index1], splits[index2]]
    index1 += 2
    index2 += 2
    break if (splits[index1].nil? && splits[index2].nil?)
  end
  sorted = subarrays.map do |subarray|
    merge(subarray[0], subarray[1])
  end
  if sorted.size == 1
    sorted.flatten
  elsif sorted.size == 2
    merge(sorted[0], sorted[1])
  elsif sorted.size == 3
    merge(sorted[0], merge(sorted[1], sorted[2]))
  else
    merge(merge(sorted[0], sorted[1]), merge(sorted[2], sorted[3]))
  end
end

# check work:
p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# => true
p merge_sort([5, 3]) == [3, 5]
# => true
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# => true
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# => true
