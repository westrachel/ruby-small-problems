# Problem:
# fix the valid_series, so that all tests pass
def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  # odd_count = 3 ? true : false
  odd_count == 3 ? true : false
end

# check work:
p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
# => true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
# => false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
# => false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
# => true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false
# => false

# Further exploration:
# no, the ternary operator in the final line of the above method isn't necessary
#  to return a boolean, because if the last line is evaluated and odd_count != 3, then
#  false will be returned
# check logic:
def valid?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end

p valid?([5, 6, 2, 7, 3, 12, 4, 8]) == true
# => true
p valid?([1, 12, 2, 5, 16, 6]) == false
# => true
p valid?([28, 3, 4, 7, 9, 14]) == false
# => true
p valid?([20, 6, 9, 4, 2, 1, 2, 3]) == true
# => true
p valid?([10, 6, 19, 2, 6, 4]) == false
# => true
