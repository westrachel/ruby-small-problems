# PEDAC:
# input to method: string 
#      > string inputs may contain spaces + capitalization (reasonably could contain other punctuation marks, so will assume those are acceptable as an implicit requirement)
# output of method: returns integer 
#      <=> integer represents the ASCII string value that is passed in as an argument

# Understanding the data structure:
# Research on methods to use in calculating ASCII value:
# String#ord will return the integer ASCII value of a one-character string 
#     <=>     Examples tested in irb:
#                     'a'.ord => 97
#                     'b'.ord => 98
#                     'Four Score'.ord => 70, which is incorrect <=> this verifies that String#ord can't be used on strings w/ more than 1 character
# if use String#ord method to calculate ASCII value, will need to split up the inputted string into individual characters
# 
# Algorithm:
# define a method that takes one argument (a string)
# will assume that that argument doesn't need to be verified as a valid string
# establish a summation variable, ascii_value_total, that's initially equal to 0
# chain the following methods on the inputted string:
#     i. first call String#chars on the inputted string, which returns an array of that string where each element of the array is a different character of the original string
#     ii. then call .each on the returned array
#               > for each iteration over the array, add the Ascii value of each individual string character element to the ascii_value_total through the usage of the String#ord method
# after the .each block ends, have the last line of the defined method list out ascii_value_total, so that the method returns the ascii value
#

def ascii_value(str)
  ascii_value_total = 0
  str.chars.each do |str_char|
    ascii_value_total += str_char.ord
  end 
  ascii_value_total
end 

# check work: all of the following print to true
puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0



# remind yourself of key principle:
# the following definition would be incomplete:
#   if don't add ascii_value_total to the end of the definition then the method would not return the ascii_value
def ascii_value(str)
  ascii_value_total = 0
  str.chars.each do |str_char|
    ascii_value_total += str_char.ord
  end 
end 

p ascii_value("h") # this prints return ["h"]
puts ascii_value('Four score') == 984 # would print false
puts ascii_value('Launch School') == 1251 # would print false
puts ascii_value('a') == 97 # would print false
puts ascii_value('') == 0 # would print false

# Further exploration (tested in irb):
"a".ord.chr # => "a"
"Four score".ord.chr # => "F" 