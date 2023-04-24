# Problem:
# Create a program that reads in a file (text file) and prints the longest
#  sentence & the number of words in the longest sentence (length of sentences =
#  based on the number of words in the sentence not the total # of characters)

# Requirements/definitions:
#    > sentences end with either: periods, exclamation points, question marks
#    > words are delimited by spaces and/or sentence ending characters

# Example:
# The program should return the following if it reads in the text w/in
#   the example text in ".../medium_two/longest_sentence_input.rb":
#  "The longest sentence is 86 words long."

# Data:
# Input:
#   > text file full of sentences that contain words
# Output:
#   > string specifying the length of the longest sentence and the longest sentence

# Algorithm:
# 1. Read in text file
# 2. Assign the contents of the text file to a string variable
# 3. Split the variable into an array, where each element of the array is a unique sentence
#     <=> sentences = delimited by the characters: ".", "!", "?"
#     <=> replace all instances of "?" and "!" with "." to split at sentence ending periods
# 4. Initialize a number of words variable that initially points to the value zero
# 5. Initialize a longest sentence variable that initially points to a blank string
# 6. Iterate through the array of sentences and on each iteration:
#     > split up the sentence into elements where elements are words and are delimited by spaces
#     > count the number of elements (aka words) within the sentence derived from splitting the sentence up
#     > compare the number of elements/words to the current value of the number of words variable
#          > if the current value of the number of words variable is larger than the number of elements/words in the current
#               sentence being iterated over then do nothing
#          > if the current value of the number of words variable is smaller than the number of elements/words in the current
#               sentence being iterated over than reassign the number of words variable to the value of the number of elements/words
#               in the current sentence & reassign the longest sentence variable to the sentence string being iterated over
# 7. Print the final value of the number of words variable, as this is the length of the longest sentence based on word count
# 8. Lookup the appropriate punctuation to add onto the longest sentence (either a period, question mark or exclamation point)
#     based on looking up the longest sentence in the original file
# 9. Print the longest sentence with the appropriate ending punctuation

# Code:
text = File.open("longest_sentence_input.txt")

# read the text file's contents and remove new line characters
content = text.readlines.map(&:chomp)

# examine contents:
#p content
# <=> each element of the content array represents one line of the text file

str = content.each_with_object("") do |line, content_string|
  content_string << line + " "
end

sentences_arr = str.gsub(/[!?]/, '.').split('.')

number_of_words = 0
longest_sentence = ""

sentences_arr.each do |sentence|
  curr_num_wds = sentence.split(' ').length
  if curr_num_wds > number_of_words
    number_of_words = curr_num_wds
    longest_sentence = sentence
  end
end

# the following should print 86 words
puts "The longest sentence in the file is #{number_of_words} words long."

ending_punctuation = [".", "!", "?"]
ender = ending_punctuation.select do |symbol|
  str[longest_sentence + symbol].nil? == false
end

puts "The longest sentence is:"
puts longest_sentence + ender[0]
