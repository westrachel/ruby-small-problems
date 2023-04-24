#PEDAC:
#Problem:
#       write a method that takes one string argument and returns that string w/ words in reverse order
#Examples:
# the following tests hould print 'true'
#puts reverse_sentence('') == ''
#puts reverse_sentence('Hello World') == 'World Hello'
#puts reverse_sentence('Reverse these words') == 'words these Reverse'

#Data Structure:
#   input = string that can be empty, contain one word, or contain multiple words
#            > if input contains multiple words, they are separated by spaces
#            > each word should not be reversed, ie world should not be reversed to dlrow
#            > output should be a string w/ the original word(s) in reverse order
#   assumption: punctuation will be added on to the word it's attached to and not treated as their own unique words unless there is a space between the word and the punctuation
#         so, reverse_sentence('Hello World!')    => 'World! Hello'
#           while reverse_sentence('Hello World !')    => '! World Hello'
#Algorithm:
#    i. split inputted string up into words, where each word is denoted where there are spaces (so split where there's a space) <=> this returns an array whose elements = word strings 
#    iii. reverse the returned array 
#    iii. convert the reversed array into a string 
#             > looking at array methods can see that ary*str --> new_string will convert array into string

#Code:
def reverse_sentence(string)
  string.split(' ').reverse * " "        # string.split(' ') achieves part i. of the algorithm, .reverse achieves part ii. of the algorithm, * " " achieves part iii. of the algorithm
end

#check solution:
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
  
  