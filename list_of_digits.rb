#PEDAC:
#Problem:
#        define method that returns the list of digits in the specified single positive integer
#Examples:
#puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
#puts digit_list(7) == [7]                     # => true
#puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
#puts digit_list(444) == [4, 4, 4]             # => true
#Data Structure:
#       input into method = one argument, a positive integer
#       output = array of that integer whose elements correspond w/ each digit of the specified input

#Algorithm:
#       ignoring negative integer inputs for now, b/c problem doesn't request that functionality is built for negative integer inputs
#       also, assuming that input is a positive integer, not a float 
#   i. there is an Integer#digits method that return's the digits of the integer in an array but not in the order that we want for our output
#          > specifically, digits method returns the least significant digit first in the array
#                  <=> least significant corresponds to the integer's value in the ones place
#   ii. Array#reverse will reverse the array called and return the order I want 
#          <=> Array#sort won't do the right job, b/c it will sort the digits in increasing order, not in the order of the actual integer 
#    
#Code:
def digit_list(pos_int)
  pos_int.digits.reverse
end

#check solution:
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true