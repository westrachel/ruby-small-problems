arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# return a new array of the same structure but w/ the sub arrays being ordered (alphabetically or numerically)
# in descending order

# so want to return:
# => [['c', 'b', 'a'], [3, 2, 1], ['green', 'blue', 'black']]
# 'black' is smaller than 'blue' b/c compare each character element wise, and so, the 3rd element determines
# that 'black' is smaller than 'blue' b/c 'a' is before / less than 'u'. None of the characters after the 3rd
# element in blue and black will be compared with each other while they're being sorted.

arr_with_sorted_sub_arrays = arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a # specify b first, in order to sort in descending order
  end
end

# check work:
p arr_with_sorted_sub_arrays
