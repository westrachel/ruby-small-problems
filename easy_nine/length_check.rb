# Problem:
# create a method that takes in a string and outputs an array w/ each word
#   in the inputted string as an element in the array accompanied by a space
#    and a number that shows the length of the word

# Examples
# word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# word_lengths("Supercalifragilisticexpialidocious") ==
#  ["Supercalifragilisticexpialidocious 34"]

# word_lengths("") == []

# Data:
# Input:
#  > a string containing words that are delimited by spaces
#  > can assume each word is separated by exactly one space
#  > can also assume that any substring of non-space characters is a word

# output:
# > array containing string elements
# > each string element contains a substring word of the passed in array concatenated
#     with a space and the number string value that represents that word's length

# Algorithm:
# 1. convert the inputted string into an array with each element of the array
#     corresponding with one unique substring word from the inpuuted string
#   <=> leveraging the fact that the substring words of the inputted string
#        are delimited by exactly one space
# 2. iterate through the generated array and for each substring word iterated
#     through, establish the length of the substring word and concatenate
#     the length of the word onto the end of the substring w/ a space character
#     and push this new substring word to a new array
# 3. return the new array generated from step 2

# Code:
def word_lengths(str)
  new_arr = str.split(' ').each_with_object([]) do |substr_word, arr|
    arr << (substr_word + " #{substr_word.length}")
  end
  new_arr
end

# Check work:
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
# => true
p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# => true
p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# => true
p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
# => true
p word_lengths("") == []
# => true
