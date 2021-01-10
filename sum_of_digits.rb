#PEDAC:
#Problem:
#      define a method that takes one argument and returns the sum of its digits
#      avoid using loop, while, until and each (if you can)
#Examples:
#puts sum(23) == 5
#puts sum(496) == 19
#puts sum(123_456_789) == 45
# all the above should be true 

#Data Structure:
# input = positive integer expected (not requested to build out functionality for negative integers)
#  output = integer equivalent to the sum of each of the digits of the inputted positive integer 


#Algorithm:
#  i. define method to accept one argument, expecting that argument to be a positive integer
#  ii. turn that integer to a string and split each digit into its only string element in an array 
#  iii. convert array of strings into an array of integers
# iv. use Enumerable#reduce to add all elements of the array together 

#Code:
def sum(pos_int)
  array_of_int = pos_int.to_s.split('').map(&:to_i)
  array_of_int.reduce(:+)
end

#check solution; all should print as true:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

#note, could technically chain the method reduce(:+) onto the other methods specified to make this defined method's innards one-line long
  