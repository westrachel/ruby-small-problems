arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# use multiple methods, including select or reject, to return a new array identical
# in structure to the original, but containing only the integers that are multiples of 3

arr.map do |sub_array|
  sub_array.select do |integer_element|
    integer_element % 3 == 0
  end
end
# => [[], [3], [9], [15]]
# tested in irb to confirm the desired return value above

# alternative solution using reject:
arr.map do |sub_array|
  sub_array.reject do |integer_element|
    integer_element % 3 > 0 # reject returns elements for which the block return value is false
  end
end
# => [[], [3], [9], [15]]
# tested in irb to confirm the desired return value above
