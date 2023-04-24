# Problem:
# Create a method that returns the second to last word of the string that
#   passed into the method

# Allowed Assumptions:
#  > words are delimited by space characters
#  > words can contain any other characters outside of spaces
#  > the inputted string will have a minimum of 2 words

# Examples:
# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'

# Data:
# Input:
#  > string w/ at least 2 words delimited by spaces
# Output:
#  > string containing one word

# Algorithm:
# 1. Initialize an array of strings variable that's eqaul to the return value
#    of the split method called on the inputted string
# 2. Call the slice method on the array of strings and specify the index of
#   slice call as the result of the size of the array of strings minus 2
#    <=> need to subtract 2 b/c indices start at 0, so if only subtracted
#     1 from the array size, then would make the method return the last word,
#      which isn't desired

# Code:
def penultimate(string)
  array_of_strs = string.split
  array_of_strs[(array_of_strs.size - 2)]
end

# Check work:
p penultimate('last word') == 'last'
# => true
p penultimate('Launch School is great!') == 'is'
# => true


# Further Exploration:
# Create a method that returns the middle word of a phrase or sentence
# Allowed Assumptions:
#   > words are delimited by spaces
#   > if there are an even number of words in the passed in string, return the word
#     that's farther to the right of the middle
#     Example: string has 6 words, return the 4th word not the 3rd word as the "middle word"
#   > if string only contains 1 word, return that word
#   > assume each input as at least one word

def middle_word(str)
  arr_of_strs = str.split
  arr_of_strs[(arr_of_strs.size / 2)]
end

# Check work:
p middle_word('last') == 'last'
# => true
p middle_word('last word') == 'word'
# => true
p middle_word('It is raining outside today') == 'raining'
# => true
p middle_word('It is raining hard outside today') == 'hard'
# => true
