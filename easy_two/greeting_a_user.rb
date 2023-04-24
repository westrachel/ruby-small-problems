#Problem:
# create a program that asks for the name of the user
# if user writes "name!" then the computer yells back to the user

#Examples:
#What is your name? Bob
#Hello Bob.
#What is your name? Bob!
#HELLO BOB. WHY ARE WE SCREAMING?

#Data:
# inputs:
#   user inputted name
# outputs:
#  string that contains a greeting and the user's name w/ normal case sensitivity
#  string that contains all caps greeting and all caps user's name and additional part to the greeting stating why are we screaming?
#   

#Algorithm:
# i. Print a string that asks for the user's name
# ii. Write code to accept the user's inputted name
# iii. Output a string that's conditional on the user's input.
#        general notes:
#        > string will contain a baseline greeting no matter what
#        > the program request doesn't specify if I need to create custom greetings each time, but I will create 
#               an array that houses several different greetings to shuffle between and use in the outputted string
#        conditional string:
#             > if there's a ! at the end of the string (check w/ #reverse and #start_with? methods), then print an all upper case greeting containing:
#                        > the greeting at the 1st index in the shuffled greeting array
#                        > the inputted name w/ '!' replaced w/ '.'
#                        > WHY ARE WE SCREAMING? 
#             > if there's no ! at the end of the string, then print the greeting at the 1st index in the shuffled greeting array and then the inputted name and a period
#                  note: assuming the user won't input random punctuation at the end of their name that requires further scrubbing of user inputs


# Code:
puts "What is your name?"
name = gets.chomp
greeting_options = ["Hello", "Hi", "Hey", "Sup"]
greeting_options.shuffle! 

if name.reverse.start_with?("!") 
  puts "#{greeting_options[1].upcase} #{name.gsub(/!/, '.').upcase} WHY ARE WE SCREAMING?"
else 
  puts "#{greeting_options[1]} #{name}."
end

#Further Exploration:
#modify LS solution to use String#chomp! and String#chop!
print 'What is your name? '
name = gets.chomp!

if name[-1] != '!'
  puts "Hello #{name}."
else
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
end
