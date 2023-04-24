# Problem:
# create a method that returns a boolean whose value is determined
#  by whether or not all the alphabetic characters inside the string are uppercase

# Examples:
# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true

# Data:
# input:
#  > a string
# output:
#  > true if all alphabetic characters are uppercased in the inputted string
#  > false if NOT all alphabetic characters are uppercased in the inputted string

# Algorithm:
# 1. convert the passed in string to an array
# 2. select only the character elements in the array that are alphabetic characters
#   <=> put differently: filter out all non-alphabetic characters
# 3. call the Enumerable#all? method on the filtered array and check if all
#      alphabetic characters are uppercased


# Think through regex logic to incorporate into algorithm:
# character =~ /[a-zA-Z]/ will return zero for all alphabetic single characters
#  that are in the inputted string, and zero is a truthy value, so these
#   alphabetic characters will be selected
# character =~ /[a-zA-Z]/ will return nil for number strings and other non-alphabetic
#  characters and accordingly should not select these non-alphabetic characters

# Code:
def uppercase?(str)
  str.chars.select do |character|
    character =~ /[a-zA-Z]/
  end.all? { |letter| letter == letter.upcase }
end

# check work:
p uppercase?('t') == false
# => true
p uppercase?('T') == true
# => true
p uppercase?('Four Score') == false
# => true
p uppercase?('FOUR SCORE') == true
# => true
p uppercase?('4SCORE!') == true
# => true
p uppercase?('') == true
# => true

# Further Exploration:
# alter the method to return false if an empty string
#    is passed in

def uppercased?(str)
  alphabetical =   str.chars.select do |char|
    char =~ /[a-zA-Z]/
  end
  if alphabetical.empty?
    false
  else
    alphabetical.all? do |letter|
      letter == letter.upcase
    end
  end
end

# check work:
p uppercased?('t') == false
# => true
p uppercased?('T') == true
# => true
p uppercased?('Four Score') == false
# => true
p uppercased?('FOUR SCORE') == true
# => true
p uppercased?('4SCORE!') == true
# => true
p uppercased?('') == false
# => true
