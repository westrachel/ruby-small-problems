# Problem:
# Create a method that takes one argument input (a string), and outputs/returns a
# *new* string in which every consonant character is doubled

# Characters that should not be doubled:
# vowels: a, e, i, o, u
# digits
# punctuation,
# whitespace

# Examples:
# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""

# Algorithm:
# 1. define a method that returns true if a single tring character passed into the
#         method is a consonant and false otherwise
#   i. define the method to accept one argument
#   ii. establish an ifelse w/in the method that returns true if the passed in
#         character downcased is included in [a-z] and also does not match
#         any vowels [aeiou]
# 2. estabish the double_consonants method definition (separate def'n from above)
#      and have it accept one argument, an expected string input
# 3. establish a blank string variable w/in the method
# 4. iterate through the passed in string, on each iteration:
#     call the method from (1) on the character and if the return is true
#     push this character twice to the blank string variable, otherwise push this
#     character only once to the blank string variable

# Ruby documentation notes:
# =~  <=> sring method that will return the index of the character at which there
#       is match with the regex provided or will return nil
# tested in irb:
# !("a" =~ /[aeiou]/)
# => false

# Code:
def is_consonant?(character)
  l = character.downcase
  if l =~ /[a-z]/ && !(l =~ /[aeiou]/)
    true
  end
end

# check logic of is_consonant?(character)
p is_consonant?("l")
# => true  <=> returns true as intended
p is_consonant?("a")
# => nil   <=> does not return true as intended


def double_consonants(str)
  blank_string = ""
  str.chars.each do |letter|
    if is_consonant?(letter)
      blank_string << letter << letter
    else
      blank_string << letter
    end
  end
  blank_string
end

# check work:
p double_consonants('String') == "SSttrrinngg"
# => true
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# => true
p double_consonants("July 4th") == "JJullyy 4tthh"
# => true
p double_consonants('') == ""
# => true
