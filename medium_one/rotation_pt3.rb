# Problem:
# create a method that takes one argument input (an integer) and outputs
#   the max rotation version of the number

# Examples:
#max_rotation(735291) == 321579
#max_rotation(3) == 3
#max_rotation(35) == 53
#max_rotation(105) == 15
#max_rotation(8_703_529_146) == 7_321_609_845

# Data:
# Input: number
#   > inputted number will have <= 1 zeros
# Output: number
#   > rotated number, leading zero will get dropped
#      if a zero ends up as the 1st digit

# how max rotation works:
# max_rotation(735291) == 321579
# rotate all digits one place to the left
#   result: 352917
# keep the first digit fixed and rotate all other digits one place to the left
#   result: 329175
# keep the first 2 digits fixed and rotate all other digits one place to the left
#   result: 321759
# keep the first 3 digits fixed and rotate all other digits one place to the left
#   result: 321597
# keep the first 4 digits fixed and rotate all other digits one place to the left
#   result: 321579     <=> maximum rotation value

# Max Rotation Method Definition Algorithm:
# 1. Select the digit at the 0th index and initialize a new_last_digit variable that points to this digit
# 2. Select the digits at the 1st index through the last index (aka all digits except the first one) and
#      assign a new variable that points to this slice
# 3. Select the first value/value at the 0th index of the slice returned from 2 and push this value to an
#      empty string
# 4. Remove the first digit from the slice
# 5. Add the new_last_digit value to the end of the slice
# 6. Repeat steps 1-5 until you have rotated all digits essentially
# 7. return the rotated number in integer format (unless it should have underscores) by setting it as the last expression evaluated in the defined method
# 8. if the returned value should have underscores, then define a separate method that formats a number with more than 3 digits to have the appropriate number of underscores

# Underscore Method Definition Algorithm:
# 1. Initialize an empty string that the variable "underscored" points to
# 2. Reverse the passed in string number
# 3. Establish an index to keep track of iteration numbers and set the index initially to 0
# 4. Start a looping construct, and within each iteration:
#         i. push the reversed string number's digit at the 0th index (aka the first digit) to the string the "underscored" variable points to
#         ii. add one to the index
#         iii. delete the digit that was passed to the string the "underscored" variable in (i.) from the reversed string (to avoid adding this digit
#                  multiple times to string that "underscored" points to)
#         iv. add an underscore to the string that was initially blank if dividing the index's current value by 3 results in no remainder
#         v. break out of the loop if all of the initially passed in string number's digits are accounted for
# 5. Reverse the finalized string that the variable "underscore" points to
# 6. Check if the first character of the returned string from 6. is the "_" character
#      > if it is, then return all characters of the string returned from step 6. except for the first character
#      > if it isn't, then return the entire string returned from step 6.

# Code:
def underscore(str_num)
  underscored = ""
  reversed = str_num.reverse
  index = 0
  loop do
    underscored << reversed[0]
    index += 1
    reversed = reversed.chars
    reversed.delete_at(0)
    reversed = reversed.join('')
    underscored << "_" if index % 3 == 0
    break if index == str_num.size
  end
  underscored.reverse[0] == "_" ? underscored.reverse[1, underscored.size - 1] : underscored.reverse
end

# check work:
p underscore(1234.to_s) == "1_234"
# => true
p underscore(600435.to_s) == "600_435"
# => true
p underscore(567893421.to_s) == "567_893_421"
# => true
p underscore(7321609845.to_s) == "7_321_609_845"
# => true

def max_rotation(number)
  rotated_num = ""
  num = number.to_s
  underscore_flag = true if num.include?("_")
  num = num.delete("_") if underscore_flag
  new_last_digit = num[0]
  slice = num[1, num.size - 1]
  if num.size > 1
    loop do
      rotated_num << slice[0]
      slice = slice.reverse.chop.reverse
      slice << new_last_digit
      new_last_digit = slice[0]
      slice = slice[1, slice.size - 1]
      break if slice.size == 0
    end
  end
  rotated_num << new_last_digit
  underscore_flag ? underscore(rotated_num) : rotated_num.to_i
end

# Check work:
p max_rotation(735291) == 321579
# => true
p max_rotation(3) == 3
# => true
p max_rotation(35) == 53
# => true
p max_rotation(30) == 3
# => true
p max_rotation(105) == 15
# => true
p max_rotation(100) == 10
# => true
p max_rotation("8_703_529_146") == "7_321_609_845"
# => true

# Further Exploration:
# Insure that your max_rotation method can handle more than two consecutive zeros
p max_rotation(100050) == 15
#=> true
p max_rotation(100000) == 10
# => true
