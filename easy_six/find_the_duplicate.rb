# Problem:
# Create a method that takes an array w/ exactly 1 duplicate value and
# returns that duplicate value

# Example:
# find_dup([1, 5, 3, 1]) == 1
# find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

def find_dup(arr)
  arr.select do |element|
    arr.count(element) > 1
  end[0]
end

# Select returns a new array w/ all elements whose block value
#  returned true
# The implication of this is that if a number/value is duplicated
#  the returned array of the select method will contain 2 instances
#   of that duplicate value
# I only want to return the duplicated value once
# So, need to specify the element at the 0th index to have the find_dup
#  method return the duplicated value only once

# check work:
find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
# => true
