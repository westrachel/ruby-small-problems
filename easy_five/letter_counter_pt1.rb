# Problem:
# Create a method that takes in a string of words separated by spaces
#  and returns a hash with key pairs denoting the number of letters of
#  each unique word length (the key) and the number of instances of
#  words with that word length in the string that was passed into the
#  the method call.

# Examples:
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

# Data:
# Input:
#   > String containing words separated by spaces
#      > The string can contain punctuation and the punctuation counts towards the size of the word
#        Ex. what's = word of size 6 and doc? = word of siz3
#       <=> put differently, a 'word' is delimited by spaces
#   Underlying assumption: don't need to validate words
#
# Output:
#   > Hash
#      Each key of the hash is an integer that represents the size of the word
#      Each value of the hash is an integer that represents the number of words with that size

# Algorithm:
# Define a method with one parameter
#   > The parameter corresponds with the inputted string
# Separate the passed in string into individual words delimited by spaces
# Count the number of characters in each word; the number of characters in each word = the size of the word
# Count the number of instances of words with the same size
# Assign the size of words integer values as keys into a newly created hash
#   > all keys should be unique; so if 2 words have the same size, then there should only be 1 key w/ that size
# Assign the number of instances of words with each key size as the integer value for that key
#   > Ex. if key integer = 3 and there are 2 words with size 3 in the passed in string, then the value
#       for the 3 integer key should be 2
# Ensure that the newly created hash is the return value of the definition

# Code:
def word_sizes(str)
  arr_of_word_sizes = str.split.map do |word|
    word.size
  end
  arr_uniq_word_sizes = arr_of_word_sizes.uniq
  hash = {}
  arr_uniq_word_sizes.each do |uniq_word_size|
    hash[uniq_word_size] = arr_of_word_sizes.count(uniq_word_size)
  end
  hash
end

# check work:
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}

# Further Exploration:
#   i. Read about Hash::new &&
#   ii. Refactor code using Hash::new
def word_sizes(str)
  hash = Hash.new(0)
  str.split.map do |word|
    hash[word.size] += 1
  end
  hash
end

# check work:
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
