# Problem:
# create a method that accepts one argument (a string) and outpus
#  the middle character(s) of the string

# Examples:
# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'

# Data:
# Input:
#  a non-empty string with either an even or odd length
# Output:
#  the middle character of the string inputted (if the inputted string has an odd length)
#  the middle characters of the string inputted (if the inputted string has an even length)

# Testing understanding of requirements in irb:
# i. what index represents the middle character's index of a string whose length = an odd integer?
#    "jumps".length   => 5     <=> jumps' length = integer value of 5
#     on eyeball inspection, the middle character = m
#    "jumps".index("m")  => 2  <=> index of the middle character = 2
#     5 / 2  => 2
#    conclusion: 
#     > for odd length inputted strings, return the characer at the index whose value
#         is equivalent to the inputted string's length divided by 2 
#         <=> this will return the middle character of the inputted string

# ii. what indices represent the middle characters of a string whose length = an even integer?
#    "jump".length => 4
#    middle characters = um
#       > index of "u" = 1
#       > index of "m" = 2
#    "launch".length => 6
#    middle characters = un
#       > index of 'u' = 2
#       > index of "n" = 3
#    conclusion from above examination of even lengthed strings' middle characters indices:
#       the middle characters = the characters at the indices whose integer values equal the following:
#              (even_word_string.length / 2) - 1
#              even_word_string.length / 2 

# Algorithm:
# 1. within the defined method check if the length of the passed in string is even or odd
# 2. if the length is even, return the 2 characters of string that are located at
#       the indices whose values are equivalent to the following integer values:
#              (even_word_string.length / 2) - 1
#              even_word_string.length / 2 
# 3. if the length is odd, return the character of the string located at the index
#     whose integer value is equivalent to the odd length word string's length divided by 2

def center_of(str)
  if str.length.even?
    str[(str.length / 2 - 1), 2]
  else
    str[str.length / 2]
  end
end

# check work:
p center_of('I love ruby') == 'e'
# => true
p center_of('Launch School') == ' '
# => true
p center_of('Launch') == 'un'
# => true
p center_of('Launchschool') == 'hs'
# => true
p center_of('x') == 'x'
# => true
