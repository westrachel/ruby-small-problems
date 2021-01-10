#PEDAC:
#Problem:
#      define a method that will repeat a string the specified integer times 
#Examples:
#       repeat('Hello', 3)
#        => prints out Hello 3x 
#Data Structure:
#      The request does not explicity ask to accept negative integers, so I'm not 
#        adding additional functionality to convert negative inputted integers to positive integers.
#Algorithm:
#    i. define a method with two arguments
#         > deciding to set the first argument to a string
#         > deciding to set the second argument to an integer 
#         > not making the argument inputs interactive (not using gets.chomp)
#         > if I mess up my own definition and enter an integer in the first argument, then it will be converted to a string no matter what
#         >  same w/ the second argument, if I enter a string into the second argument instead of an integer it will likely error out b/c I'm going to automatically convert it to an integer

#Code:
def repetition(string, integer)
  integer.to_i.times {puts string.to_s }
end

repetition("Today will be a great day!", 4)
repetition(7, 7)
repetition(2,"hello") #this will not print anything