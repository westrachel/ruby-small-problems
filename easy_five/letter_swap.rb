#PEDAC: 
# problem = to define an appropriate method
# input: a string
# output: string 

# Explicit requirements:
#    > returned string must swap the first and last letters of every word
#    > can assume that each string contains nothing but words and spaces
#    > every word contains at least one letter

# Implicit requirements:
#    > words are delimited by spaces

# Algorithm/data structures:
# initialize a method that takes one argument input, a string containing words and spaces
# use String#split method to transform the inputted string into an array
#      > each element of the returned array from this method call will contain one of the words of the inputted string
#            <=> example tested in irb to confirm: "Oh what a wonderful".split returns the array:
#                      => ["Oh", "what", "a", "wonderful"]
# initialize a new array variable called reverse_first_last_letters_of_each_wd that is assigned to the value of the 
#          each method called on inputted string#split
#                 <=> use the each method to iterate over the array and reverse each word element of the array 
#                        after reversing, save the characters at the 0th and last index of the each word element
# will finish this algorithm later!
#                                    