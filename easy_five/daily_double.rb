# Problem:
# Create a method that takes in a string and reduces multiple consecutive instances
#  of the same character into one instance of that character
# Limitations:
# do not use String#squeeze

# Examples:
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

# Data:
# Input:
#   > String containing letters and numbers
#       <=> String can probably contain other non-letters
#            ie punctuation + symbols like @$%
#   > The string contain words that are delimited by spaces
#      <=> these string words need to have their duplicate consecutive
#        character values reduced to single instances

# Output:
#   > Simplified string with all consecutive duplciate characters reduced
#      to single instances of the respective character

# Algorithm:
# Create a method that
#   1. Converts the passed in string to an array, with each element of the array
#      corresponding to 1 word of the original passed in string
#   2. For each unique word in the array, assign the first character of the word (the character at the 0th index)
#      to a local variable called reduced_word.
#   3. Compare each adjacent index characters of the word for equivalency.
#      Ex. For the word 'ddaaiillyy'
#         i. Compare the character at index = 0 (= d) to the character at index = 1 (= d)
#         ii. Compare the character at index = 1 (= d ) to the character at index = 2 (= a )
#         iii. ... continue comparison until have compared all adjacent characters for equivalence
#   3. If adjacent characters are not equivalent, push the second character of the compared pair to the reduced_word variable.
#   4. The comparison in steps 2 and 3 needs to be done for all populated indices of each word in the original passed in array.
#        Once the comparison has been completed, push the reduced_word string to a new array variable called reduced_words
#   5. Repeat steps 2-4 for each word in the original string that was passed into the method
#   6. Additional logic needs to be built in to handle cases where strings with 0 or 1 characters are passed into the method
#        > In these cases, there will be no need to compare values at adjacent indices and actually trying to compare values
#           at adjacent indices may result in underlying method calls error; so, tread carefully
#   7. Convert the reduced_words array that contains all simplified words into a string where each simplified
#       word is delimited by spaces
#
# Code:
def crunch(words)
  idx = 0
  reduced_words = []
  words.split.each do |word|
    reduced_word = word[idx]
    loop do
      break if word[idx].nil? || word[idx + 1].nil?
      if word[idx] != word[idx + 1]
        reduced_word += word[idx + 1]
      end
      idx += 1
    end
    if word.size == 0 || word.size == 1
      reduced_word == word
    end
    reduced_words << reduced_word
    idx = 0
  end
  reduced_words.join(' ')
end

# Check work:
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
p crunch('hi') == 'hi'
p crunch('heyyyyyy') == 'hey'

# Further Exploration:
# Use String#each_char or String#chars in the created method
def crunch(words)
  letters_arr = words.chars
  reduced_words_str = ''
  index = 0
  until index == letters_arr.size
    if letters_arr[index] != letters_arr[(index + 1)]
        reduced_words_str << letters_arr[index]
    end
    index += 1
  end
  reduced_words_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
p crunch('hi') == 'hi'
p crunch('heyyyyyy') == 'hey'
