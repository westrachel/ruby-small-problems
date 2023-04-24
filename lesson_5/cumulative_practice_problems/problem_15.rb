arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# write code to return an array which contains only the hashes where all integers are even
# expected return value:
# => [{e: [8], f: [6, 10]}}]

arr.select do |sub_hash|
  # p sub_hash.values.flatten <--> used this line to initially examine sub_hash; need to call flatten method in order to remove sub-arrays returned when call sub_hash.values
  # and then can chain #all? method onto the end to check if all integer values in each sub_hash are even
  # the sub_hash.values.flatten chained method call returns 3 arrays w/ each array containing all the integer values within each of the 3 sub_hashes of arr
  sub_hash.values.flatten.all? do |integer|
    integer.even?
  end
end

# check work:
p (arr.select do |sub_hash|
  sub_hash.values.flatten.all? do |integer|
    integer.even?
  end
end)
# return value of above p method call is the desired result:
# => [{e: [8], f: [6, 10]}}]
