# Problem:
# Create a method that takes a passed in string as an argument and returns
# an array of substrings of the inputted string that are palindromes.

# Examples:
#palindromes('abcd') == []
#palindromes('madam') == ['madam', 'ada']
#palindromes('hello-madam-did-madam-goodbye') == [
#  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#  '-madam-', 'madam', 'ada', 'oo'
#]
#palindromes('knitting cassettes') == [
#  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#]

# Data:
# input: a string
#   > can contain spaces, and non-letters (ie hyphens)
# output: an array of strings
#   > all strings are at least 2 digits long
#    <=> explicit req: single characters are not palindromes
#   > substring palindromes are case sensitive
#    <=> ex: "Abcba" is not a palindrome, but "AbcbA" is

# Algorithm:
# 1. Initialize a variable that points to an empty array
# 2. Within the method, call the previously defined substrs method
#     on the inputted string
# 3. On the returned array from (2.), call the each method and
#     for each unique substring:
#     i. check if the substring's length >= 1 & it's equal to its reversed value
#     ii. if both conditions in (i.) are met, then push the string to the array
# 4. Return the array variable by setting it as the last expression evaluated in the method

# Code:

def substrs(sub_str)
  starting_index = 0
  length = 1
  max_length = sub_str.size
  arr = []
  loop do
    max_length.times do
      arr << sub_str[starting_index, length] 
      length += 1
    end
    
    starting_index += 1
    length = 1
    max_length -= 1
      
    break if max_length == 0
  end
  arr
end

def palindromes(str)
  arr = []
  substrs(str).each do |substr|
    if substr.reverse == substr && substr.length > 1
      arr << substr
    end
  end
  arr
end

# check work:
p palindromes('abcd') == []
# => true
p palindromes('madam') == ['madam', 'ada']
# => true
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo']
# => true
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']
# => true
