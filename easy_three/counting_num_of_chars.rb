# problem:
# create a program that asks for a user input of word(s) and prints how many characters are in the word(s)
# only spaces do not count as characters, but commas and apostrophes do 

# example:
# input: Please write word or multiple words: walk, don't run
# output: There are 13 characters in "walk, don't run".

# data:
# input = word or multiple word string
# assumption: all words are separated by spaces and spaces do not count as characters
# output = string that prints the number of characters in the user's input and the user's input

# Algorithm:
# i. prompt the user to input word(s)
# ii. store the user's input in a variable (call chomp on the user's input)
# iii. call the split method on that stored user string (split at each space) and store that array of words containing different characters
# iv. assign a variable that represents the cumulative length of characters to zero, so that it's been established in the external scope (outside of the each method described in the subsequent step)
# v. iterate over the array of words and add the length of each word to the variable storing the cumulative length of characters 
# vi. print, using string interpolation, the cumulative length of character variables in a string that also prints the user's initial inputted string in quotes
        # <=> can call the inspect method when printing the user's string input, so that it appears in quotes


# code:

puts "Please write word or multiple words:"
user_string = gets.chomp 

array_of_words = user_string.split(" ")
cumulative_char_length = 0
array_of_words.each {|word|
  cumulative_char_length += word.length
}

puts "There are #{cumulative_char_length} characters in #{user_string.inspect}."
