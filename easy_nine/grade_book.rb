# Problem:
# Create a method that takes 3 integer inputs (corresponding w/ numerical
#    grades between 0 and 100) and calculates the average score of these inputs
#     and then returns the letter score that corresponds with the average value.

# Examples:
# get_grade(95, 90, 93) == "A"
# get_grade(50, 50, 95) == "D"

# Data:
# Input:
#  > 3 integers that >= 0 and <= 100
# Output:
#  > a capitalized letter string = {'A', 'B', 'C', 'D', 'E'}

# Requirements:
# Do not need to check that inputs are not negative or are > 100
#   <=> inputs will always be <= 100 and >= 0

# Algorithm:
# 1. Create a helper method that maps a score between 0 and 100 (inclusive of the bounds)
#      to a letter (either A, B, C, D, E)
#       > use an if statement that first checks to see if the number is < 60, & if it is
#            then return the letter string 'F'
#       > set the second branch of the if statement to check if the number is < 70 & if it is
#             then return the letter string 'D'
#           <=> note that all numbers < 60 will already be captured by the first branch of
#                the if statement, so only numbers 60 - 100 will be checked against this second
#                branch of the if statement
#       > set the third branch of the if statement to check if the number is < 80 & if it is
#               return the letter string 'C'
#       > set the fourth branch of the if statement to check if the number is < 90 & if it is
#               return the letter string 'B'
#       > set the last branch of the if statement to return the letter string 'A'
# 2. Create the get_grade method and calculate the average of the 3 inputted integers
# 3. Call the method established under step 1 on the average integer value calculated in step 2

# Code:
def num_to_letter_grade(int)
  if int < 60
    'F'
  elsif int < 70
    'D'
  elsif int < 80
    'C'
  elsif int < 90
    'B'
  else
    'A'
  end
end

def get_grade(score1, score2, score3)
  avg = (score1 + score2 + score3) / 3
  num_to_letter_grade(avg)
end

# check work:
p get_grade(95, 90, 93) == "A"
# => true
p get_grade(50, 50, 95) == "D"
# => true

# Further Exploration Part 1:
# use a constant to lookup the avg score's corresponding letter grade

INT_TO_LETTER = {}

def push_to_constant(int_range, letter)
  INT_TO_LETTER[(int_range).to_a] = letter
end

push_to_constant(90..100, 'A')
push_to_constant(80..89, 'B')
push_to_constant(70..79, 'C')
push_to_constant(60..69, 'D')
push_to_constant(0..59, 'F')

# check constant's mapping:
p INT_TO_LETTER 

def get_the_grade(score1, score2, score3)
  avg = (score1 + score2 + score3) / 3
  INT_TO_LETTER.select do |k, v|
    v if k.include?(avg)
  end.values[0]
end

# explain logic:
# > the select method invocation with a block is called on the INT_TO_LETTER constant hash
# > each key (an array) and value (a string) of the INT_TO_LETTER constant hash is passed into
#     the select method call and is assigned to the local variables k and v
# > w/in each iteration, the key and value pair is selected and passed to the new hash the select method
#    will return if that value's corresponding key in the INT_TO_LETTER hash includes the avg score
#    integer value
# > since the array keys of the INT_TO_LETTER hash are mutually exclusive, only one of the keys will
#    contain the avg integer value
# > as a result, only one key/value pair will be selected and returned in the new hash return value of the
#     select method
# > since I want the get_the_grade method to return just the string letter value of the grade, and not an
#     hash containing the string letter value of the grade, at the end of the select method invocation I
#     call the values method and [0] 
#        > the values method call will select all values in the returned hash and return these values
#             in an array; since there's only one key/value in the returned array that the values method
#             is called on, the return value of the values method call will be an array containing 1 element
#        > the [0] slice method call chained onto the end of the values method call, will select the
#            element at the 0th index from the array of values returned by the values method call
#           <=> essentially, [0] will return the letter grade value as a string, which is the desired
#               return value of the get_the_grade method

# check work:
p get_the_grade(95, 90, 93) == "A"
# => true
p get_the_grade(50, 50, 95) == "D"
# => true


# Further Exploration Part 2:
# Enhance the method to be more flexible and to allow an extra credit grade to influence the average
# note: the extra credit grade is optional, so not all usages of the method will assign a nonzero value
#   to the extra credit grade

def grader(score1, score2, score3, ec = 0)
  case ec
  when 0
    avg = (score1 + score2 + score3) / 3
  else
    avg = (score1 + score2 + score3 + ec) / 4
  end
  num_to_letter_grade(avg)
end

# check work:
p grader(95, 90, 93) # should be an 'A'
# => 'A'
p grader(50, 50, 95, 60) # should stil be a 'D'
# => 'D'
