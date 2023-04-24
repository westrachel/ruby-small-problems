#PEDAC:
#Problem:
#       define a method that takes one argument, a string containing 1+ words and returns the 
#       string w/ all words that contain >= 5 characters reversed 
#         
#Examples:
#puts reverse_words('Professional')          # => lanoisseforP
#puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
#puts reverse_words('Launch School')         # => hcnuaL loohcS

#Data Structure:
#    input = 1 string that contains words (composed only of letters) and spaces (no punctuation <=> no need to build out rules for punctuation )
#            the order of the words in the string does not change
#            

#Algorithm:
#    i. split up the string so that each word, specified by where spaces are, gets stored into an array
#    ii. check the length of each string word in the array (can use #length or #size methods)
#           > if length >= 5, then reverse the order of the letters in the word permanently 
#    iii. convert the array into a string such that each word gets added to the string and there are spaces between words

#Code:
def reverse_words(string)
  mutated_array = string.split(' ').each {|word|
    word.reverse! if word.length >= 5
  }
  mutated_array * " " #achieves part iii. of the algorithm 
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS