# Problem:
# Create a method that takes 2 arguments, both are integers, and returns
#  an array with a size equivalent to the first inputted argument
#   and whose elements are multiples of the second inputted argument

# Examples:
# sequence(5, 1) == [1, 2, 3, 4, 5]
# sequence(4, -7) == [-7, -14, -21, -28]
# sequence(3, 0) == [0, 0, 0]
# sequence(0, 1000000) == []

# Data:
# Input:
#   > 2 integers (can be negative or positive or zero)
#   > the first integer = the size of the outputted array
#   > the second integer = the integer to create multiples of

# Output:
#   > an array containing integer elements
#   > the output can be empty array if the first integer argument passed in is zero

# Algorithm:
# 1. Initialize an empty array variable
# 2. initialize an integer variable that's initially set to zero
# 3. call the times method on the first integer passed in to the outer/parent
#     method call as an argument and for each iteration over the block of the
#     times method call, add the second integer passed in as an argument to the
#      outer/parent method call to the integer variable established in step 2
#      and push that summation to the array variable initialized under step 1
# 4. return the array variable

# Code:
def sequence(count, multiple)
  arr = []
  int = 0
  count.times do |x|
    int += multiple
    arr << int
  end
  arr
end

# Check work:
p sequence(5, 1) == [1, 2, 3, 4, 5]
# => true
p sequence(4, -7) == [-7, -14, -21, -28]
# => true
p sequence(3, 0) == [0, 0, 0]
# => true
p sequence(0, 1000000) == []
# => true
