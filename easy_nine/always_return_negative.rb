# Problem:
# create a method that accepts one number argument and outputs the negative
# value of that number

# note: for negative inputted numbers, the number itself should be returned
#    <=> the output should always be negative
#    <=> if 0 is inputted, then 0 should be outputted, not -0 (would have to convert 
#         to a string format to return -0)

# Code:
def negative(num)
  num < 0 ? num : -num
end

# check work:
p negative(5) == -5
# => true
p negative(-3) == -3
# => true
p negative(0) == 0
# => true
