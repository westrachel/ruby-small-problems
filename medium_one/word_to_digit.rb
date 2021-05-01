# Problem:
# Create a method that has one argument passed in (a string of words with some of the
#  words being numbers) and converts the string number words to integers. The outputted
#  string is identical to the inputted string in content, except all number words passed in
#  are ouputted as their digit values.

# Example:
# word_to_digit('Please call me at five five five one two three four. Thanks.') 
# => 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Data:
# Input:
#  > A string containing words
#  > Implicit assumptions:
#     > the string inputted will contain at least one word number
#     > the word numbers are single digit numbers only ('zero', 'one', 'two', 'three',
#        'four', 'five', 'six', 'seven', 'eight', 'nine')
#     > words are generally delimited by single spaces
#      <=> number words might be the last word right before punctuation, so not all "words" are delimited by spaces
#         since I wouldn't normally consider punctuation as part of a word
# Output:
#  > A string with the same words as the inputted string, except all number words have
#      been converted to string digits

# Algorithm:
# 1. Create a hash constant that stores each single digit number string word as a key
#     and its corresponding value as the digit string version of the same number
#    <=> ex: the key/value pair for "zero" is:  "zero" => "0"
# 2. Split the inputted string into an array where each word of the string (delimited by spaces)
#     is a single element of the array
# 3. Iterate through the array and transform the word to its digit form if the word
#       represents a single number
#         > downcase the number word to check if it's a key in the hash constant created in step 1
#         > downcase the number word and check if all of its characters except the last character (which
#              could be punctuation) is a key in the hash constant created in step 1
# 4. Convert the array of transformed words into a string and return this string

# Code:
NUMBERS = {"zero" => "0", "one" => "1", "two" => "2", "three" => "3",
           "four" => "4", "five" => "5", "six" => "6", "seven" => "7",
           "eight" => "8", "nine" => "9" }

def word_to_digit(str)
  str.split(' ').each_with_object([]) do |word, new_arr|
    if NUMBERS.keys.include?(word.downcase)
      new_arr << NUMBERS[word.downcase]
    elsif NUMBERS.keys.include?(word.downcase[0, (word.size - 1)])
      new_arr << ( NUMBERS[word.downcase[0, (word.size - 1)]] + word[(word.size - 1)] )
    else
      new_arr << word
    end
  end.join(' ')
end

# check work:
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
# => true

# Further Exploration Part 1:
# Update the method so that spaces between consecutive numbers are removed
def remove_spaces(str)
  str.chars.select do |char|
    char != " "
  end
end

def select_consec_digits(char_arr)
  char_arr.select do |char|
    NUMBERS.values.include?(char) && NUMBERS.values.include?(char_arr[char_arr.index(char) + 1]) ||
    NUMBERS.values.include?(char) && NUMBERS.values.include?(char_arr[char_arr.index(char) - 1])
  end.join('')
end

def spacify(str)
  str.chars.join(' ')
end

def digitize(str)
  digits_str = word_to_digit(str)
  consec_digits = select_consec_digits(remove_spaces(digits_str))
  digits_str.gsub(spacify(consec_digits), consec_digits)
end

# check work:
p digitize('Call me at five five five one two three four.') == 'Call me at 5551234.'
# => true
p digitize('That is nine dollars. Your tracking number is zero one two six.') == "That is 9 dollars. Your tracking number is 0126."
# => true

# Further Exploration Part 2:
# Adapt the method created under further exploration part 1, so that any 10 digit number
#  is formatted as a phone number: (234) 342-1234
def phone_num_format(str)
  "(#{str[0,3]}) #{str[3,3]}-#{str[6,4]}"
end

def digitized(str)
  digits_str = word_to_digit(str)
  consec_digits = select_consec_digits(remove_spaces(digits_str))
  if consec_digits.size == 10
    digits_str.gsub(spacify(consec_digits), phone_num_format(consec_digits))
  else
    digits_str.gsub(spacify(consec_digits), consec_digits)
  end
end

# check work:
p digitized('Call me at four four one five five five one two three four.') == 'Call me at (441) 555-1234.'
# => true
p digitized('That is nine dollars. Your tracking number is zero one two six five four three.')
# => "That is 9 dollars. Your tracking number is 0126543."
p digitized('Call six zero six nine nine nine three three two four for customer service.')
# => "Call (606) 999-3324 for customer service."

# Note: the digitized() method is not flexible enough to handle a single string that has multiple separated consecutive
#  numbers in a row. For example:
p digitized('Call me at four four one five five five one two three four or call me at six zero six nine nine nine three three two four.')
# => "Call me at 4 4 1 5 5 5 1 2 3 4 or call me at 6 0 6 9 9 9 3 3 2 4."
#  <=> not pursuing a further exploration part 3 to adapt the method to handle this edge case, as a solution is to split the string
#     into two shorter strings and call the method twice:
a = 'Call me at four four one five five five one two three four '
b = 'or call me at six zero six nine nine nine three three two four.'
p "#{digitized(a)}#{digitized(b)}"
# => "Call me at (441) 555-1234or call me at (606) 999-3324."
