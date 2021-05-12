# Problem:
# Create a method that accepts one string input that can contain parentheses. The
#  method should analyze any parentheses present and if the open parenthesis, '(', is
#  balanced with a closed parenthesis,')', then return true, otherwise return false.

# Examples:
# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false

# Data:
# Input:
#   > string
# Output:
#   > boolean: true or false

# Algorithm:
# 1. extract/select all the parentheses from the inputted string and store them in an array
# 2. initialiaze a counter & an index variable and have them both point to the value zero
# 3. loop through the extract array from step 1 and:
#       > check if the array is empty/nil at the current index being iterated over
#       > add 1 to the counter variable if the array element at the current index is
#          equivalent to the '(' open parenthesis
#       > subtract 1 from the counter variable if the array element at the current index
#           is equivalent to the closed ')' parenthesis
# 4. break the loop prematurely if the counter variable is negative, as this denotes that
#    there is a closed parenthesis before an open parenthesis to match it
#       > end the loop once all elements in the array extract from step 1 have been iterated through
# 5. return false if the counter variable is negative or positive, as that indicates that the parentheses aren't
#     balanced which could be because:
#        > a closed parenthesis incorrectly came before an open parenthesis 
#        > the overall number of open parentheses doesn't match the overall number of the closed
#            parentheses
P = ['(', ')']
SQ_B = ['[', ']']
CURLY_B = ['{', '}']
SINGLE_QUOTE = ["'", "'"]

# Code:
def balanced?(str)
  p_arr = str.split('').select {|c| P.include?(c) }
  counter = 0
  idx = 0
  loop do
    break if p_arr[idx].nil?
    p_arr[idx] == P[0] ? counter += 1 : counter -= 1
    break if counter < 0
    idx += 1
  end
  counter != 0 ? false : true
end

# check work:
p balanced?('What (is) this?') == true
# => true
p balanced?('What is) this?') == false
# => true
p balanced?('What (is this?') == false
# => true
p balanced?('((What) (is this))?') == true
# => true
p balanced?('((What)) (is this))?') == false
# => true
p balanced?('Hey!') == true
# => true
p balanced?(')Hey!(') == false
# => true
p balanced?('What ((is))) up(') == false
# => true

# Further Exploration:
# expand the method to check a string to see if its square brackets,
#  curly brackets, and single quotation marks are balanced
def char_balanced?(str, char_arr)
  counter = 0
  str.each_char do |c|
    counter += 1 if c == char_arr[0]
    counter -= 1 if c == char_arr[1]
    break if counter < 0
  end
  counter == 0 ? true : false
end

# check work:
p char_balanced?('{{What} {is this}}?', CURLY_B) == true
# => true
p char_balanced?(" 'Hey!' 'Hi.'", SINGLE_QUOTE) == true
# => true
p char_balanced?(')Hey!(', P) == false
# => true
p char_balanced?('What [[is]]] up[', SQ_B) == false
# => true
