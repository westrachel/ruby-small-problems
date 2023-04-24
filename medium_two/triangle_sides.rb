# Problem:
# create a method that accepts three number inputs (integers and floats) that
#  represent the side lengths of a triangle and outputs one of the following symbols
#  based on what kind of triangle it is:
#     > :equilateral
#     > :isosceles
#     > :scalene
#     > :invalid

# Examples:
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid

# Data:
# Input:
#   > 3 numbers
# Output:
#   > :invalid symbol is returned if the inputted side lengths would not make a
#      valid triangle 
#        > sum of two smallest inputted numbers must exceed the largest inputted number
#        > all number inputs/side lengths must be greater than zero

# Algorithm:
# 1. push all 3 inputs to an array
# 2. check if all 3 array elements are equal, and if so initialize a result variable that points to the symbol :equilateral
# 3. check if 2 array inputs are equivalent, and if so set the result variable to point to the symbol :isosceles
# 4. if checks in steps 2 and 3 don't pass then assign the result to scalene (all 3 inputs are different numbers)
# 5. calculate the sum of the array
# 6. calculate the max/largest number in the array
# 7. subtract the max number from the sum of the array
# 8. compare the result of step 7 to the max number and if the result of step 7
#     is smaller or equal to the max number reassign the result variable to :invalid
# 9. check if the array includes a 0, and if it does, reassign the result variable to :invalid

# Code:
def triangle(x1, x2, x3)
  a = [x1, x2, x3]
  case a.uniq.size
  when 1 then result = :equilateral
  when 2 then result = :isosceles
  else        result = :scalene
  end
  if a.include?(0) || a.max >= (a.sum - a.max)
    result = :invalid
  end
  result
end

# check work:
p triangle(3, 3, 3) == :equilateral
# => true
p triangle(3, 3, 1.5) == :isosceles
# => true
p triangle(3, 4, 5) == :scalene
# => true
p triangle(0, 3, 3) == :invalid
# => true
p triangle(3, 1, 1) == :invalid
# => true
