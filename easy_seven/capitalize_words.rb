# Problem:
# Create a method that takes a string and capitalizes each word of the string
#  and returns a new string w/ the capitalized words
#    > words are delimited by spaces
#    > all other letters in words should be lowercased 
#        <=> downcase the entire word first before capitalizing the first letter

def word_cap(str)
  str.split.map do |word|
    word.downcase.capitalize
  end.join(' ')
end

# Check work:
puts word_cap('four score and seven') == 'Four Score And Seven'
# => true
puts word_cap('the javaScript language') == 'The Javascript Language'
# => true
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
# => true

# Actually, #capitalize method will lowercase all of the letters that aren't the first one
#  So, the downcase method call is redundant

# Refactored method:
def word_cap(str)
  str.split.map do |word|
    word.capitalize
  end.join(' ')
end

# Further Exploration:
# Create the word_cap method w/ou using the String#capitalize Ruby method

UPPERCASED_ABCS = ('A'..'Z').to_a
LOWERCASED_ABCS = ('a'..'z').to_a
ABCS_HASH = { }

# Push each lowercase letter and its corresponding uppercase version
#   to the ABCS_HASH constant as a key-value pair

index = 0
loop do
  ABCS_HASH[LOWERCASED_ABCS[index]] = UPPERCASED_ABCS[index]
  index += 1
  break if index == 26
end

# check ABCS_HASH:
p ABCS_HASH

def word_cap(str)
  str.split.map do |word|
    first_letter_index = word.chars.find_index do |idx| 
      UPPERCASED_ABCS.include?(idx) || LOWERCASED_ABCS.include?(idx)
    end
    word.downcase.gsub(word[first_letter_index], ABCS_HASH[word[first_letter_index]])
  end.join(' ')
end

# Check work:
puts word_cap('four score and seven') == 'Four Score And Seven'
# => true
puts word_cap('the javaScript language') == 'The Javascript Language'
# => true
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
# => false
puts word_cap('this is a "quoted" word') == 'This Is A "Quoted" Word'
# => true

def word_cap(str)
  str.split.map do |word|
    if ABCS_HASH.has_key?(word[0]) || ABCS_HASH.has_value?(word[0])
      word.downcase.gsub(word[0], ABCS_HASH[word[0]])
    else
      word.downcase
    end
  end.join(' ')
end

# Check work:
puts word_cap('four score and seven') == 'Four Score And Seven'
# => true
puts word_cap('the javaScript language') == 'The Javascript Language'
# => true
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
# => true
