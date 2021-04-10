# Problem:
# create a method that takes in one input (a positive integer) and outputs
#   a number with the digits of the passed in number in reverse order

# Examples:
# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21
# reversed_number(12003) == 30021
# reversed_number(1) == 1

# Data:
# input:
#  > explicitly a positive integer (no floats or negative symbols to account for)
# output:
#  > a number (an integer; not a number in a string format)
#  > leading zeros are not considered

# Algorithm:
# 1. convert the passed in number from an integer to a string and then into an array
#      and call reverse on the array
#   pause, question: if I convert the reversed array of string integer elements back into a string
#     and then into an integer are leading zeros automatically removed by ruby? or do
#     I need to build out logic to remove leading zeros?
#    answer from testing the following in irb:
#       ["0", "0", "1"].join('').to_i
#       => 1
#      <=> Ruby will automatically remove leading zeros, so I don't need to build in extra logic
# 3. convert the reversed array containing string integers into a string and then into an integer
#      <=> ensure that step 3 is the last expression of the method, so that its return value is the
#        return value of the method

# Code;
def reversed_number(num)
  num.to_s.chars.reverse.join('').to_i
end

# check work:
p reversed_number(12345) == 54321
# -> true
p reversed_number(12213) == 31221
# -> true
p reversed_number(456) == 654
# -> true
p reversed_number(12000) == 21
# -> true
p reversed_number(12003) == 30021
# -> true
p reversed_number(1) == 1
# -> true

# note to self: you can actually call reverse on strings too, not just arrays, so
#  my above definition can be further simplified to:
def reversed_num(number)
  number.to_s.reverse.to_i
end
