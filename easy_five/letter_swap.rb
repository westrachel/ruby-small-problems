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
# initialize a new array variable called reversed_letters_arr that is assigned to the return array value of the 
#          each method called on inputted string#split
#                 <=> use the each method to iterate over the array and:
#                    reassign the first and last character of the word through string indexing:
#                             last_char = element[element.length-1]  
#                                  <=> since indices start at 0, the last index of each element equals that element's length minus 1
#                             first_char = element[0]
#                             element[0] = last_char
#                             element[element.length-1] = first_char
# call the Array#join method w/ the argument " "  passed into join() on the reversed_letters_arr so that the last thing returned by 
#        the method is a String containing each word of the originally inputted string w/ the first and last letters reversed 
#            <=> passing " " into the join method call will ensure that the words in the string are separated by spaces

def swap(str)
  reversed_letters_arr = str.split.each do |element|
    last_char = element[element.length-1]
    first_char = element[0]
    element[0] = last_char
    element[element.length-1] = first_char
  end
  reversed_letters_arr.join(" ")
end

# check work: all of the below should (& do) print as true
puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'