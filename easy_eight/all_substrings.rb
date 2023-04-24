# Problem:
# Create a method that takes one argument, a string, and returns an array
# containing strings whose values correspond with all the possible substrings
# contained within the string.

# Example:
# substrings('abcde') == [
#  'a', 'ab', 'abc', 'abcd', 'abcde',
#  'b', 'bc', 'bcd', 'bcde',
#  'c', 'cd', 'cde',
#  'd', 'de',
#  'e'
# ]

# Data:
# Input:
#  > a string
# Output:
#  > an array of strings

# Assumption: the inputted string can be mutated by the method

# Algorithm:
# 1. Initialize a variable called starting_index that points to the integer value 1
# 2. Initialize a variable called length that points to the integer value 1
# 3. Initialize a variable called max_length that points to the integer value
#     of the size of the inputted string
# 4. Initialize an array variable that points to an empty array
# 5. Create a loop, within each iteration of the inner loop:
#      i. call the times method on the max_length variable
#           > for each iteration of the times method call,
#                a. slice the inputted string, selecting the string character
#                    at the starting_index variable's value and all subsequent characters
#                    until the sliced string's length is equivalent to the value of the length variable
#                b. push this sliced string to the array
#                c. reassign the length variable by adding 1 to it
#      ii. add 1 to starting_index variable and substract one from the max_length variable
#            <=> this is so that the subsequent sub-iterations of the loop slice the inputted string
#                starting at later indices, so that only unique substrings are added to the array
#      iii. reassign the length variable to 1 for the next loop iteration
#      iv. break out of the loop if the max_length variable (which corresponds w/ the max_length of the sliced
#            string produced in the last iteration of the times method call) is equal to zero
# 6. Return the array variable by setting it as the last expression evaluated in the method

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

# check work:
p substrs('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
# => true
