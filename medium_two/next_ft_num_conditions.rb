# Problem / Data:
# Create a method that accepts one integer argument and returns the next
#  odd number that is a multiple 7, has only unique digits, and is greater
#  than the inputted number
# Edge case:
#    > at some point there is no next larger number that meets all requirements
#       (digits can't repeat in the number), in these cases return a message that
#      there is no possible number to returns

# Assumptions: inputted numbers are >= 0 and are not floats

# Examples:
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(9_999_999_999) # -> Error: no possible # to return.

# Algorithm:
#  i. Initialize an empty array
#  ii. initialize a multiple variable equal to 7
#  iii. start a loop
#  iv. check if the multiple variable is:
#           > odd, 
#           > divisible by 7 w/ no remainder
#           > has only unique digits
#               >> convert the number to a string, store the string length's in a variable
#               >> then split the string's character digits into an array and remove all duplicate array elements
#               >> compare the size of the string's length to the size of the array w/ all duplicates removed
#               >> if the sizes are the same, then the multiple variable has only unique digits
#  v. if all 3 conditions are met from step iv., then push the multiple variable's current value to the array created in step i.
#  vi. add 7 to the multiple variable
#  vii. break out of the loop of the multiple variable has 11 digits or more
#          > based on one of the examples, there is no number greater than 9_999_999_999 that meets at 3 conditions (odd, multiple of 7, unique digits)
#            and 9_999_999_999 has 10 digits, so at the very least any 11 digit multiple of 7 that's odd will not have unique digits so stop
#             the loop because at this point will have captured all relevant numbers
# viii. start the method definition and initialize an index variable that points to the value zero
# ix. start a loop and break out of the loop if the inputted number is less than the array's element located at the index (add 1 to the index variable
#        so that during each loop iteration, the inputted number is compared against different array values)
# x. return the array's element located at the index

#SPECIAL_NUMS = []

#m = 7
#loop do
#  num_digits = m.to_s.size
#  unique_num_digits = m.to_s.split('').uniq.size
#  if m % 7 == 0 && m.odd? && num_digits == unique_num_digits
#    SPECIAL_NUMS << m
#  end
#  m += 7
#  break if m.to_s.size > 10
#end

#def featured_first_attempt(num)
#  index = 0
#  loop do
#    break if num < SPECIAL_NUMS[index]
#    index += 1
#  end
#  SPECIAL_NUMS[index]
#end

# The above method definition does not work for really large numbers and also creating a massive array with
#   all relevant numbers (odd, divisible by 7, unique digits) is not computationally efficient

# REFACTORED ALGORITHM:
# 1. Convert the inputted number into a float
# 2. Divide the inputted number by 7.0
# 3. Round the quotient up to the nearest whole number
# 4. Multiply the rounded number from step 3 by 7
# 5. Check if the product from step 5 is odd, has only unique digits, and is greater than the inputted number
# 6. If product is odd, only has unique digits and is greater than the inputted number than have the method return that number
# 7. If one of the checks in step 5 fails, then add 1 to the rounded number in step 3 and repeat steps 4-6
# 8. This step may need to be moved earlier up in the defined method, but check if the inputted number has greater than 10 digits,
#      if it does, then have the method return the error message that there is no possible number to return that meets all conditions
#       ( = is odd, divisble by 7 and has only unique digits)

def featured(num)
  flag = "Error: there is no possible number that meets all conditions"
  quotient = (num.to_f / 7.0).round
  loop do
    value = quotient * 7
    num_digits = value.to_s.size
    unique_num_digits = value.to_s.split('').uniq.size
    if value.odd? && num_digits == unique_num_digits && value > num
      flag = value
    end
    # break if flag has successfully been reassigned from a string to a featured number
    # note that there could be an edge case that this method doesn't account for, as there might be a 10 digit number
    # that's odd, divisible by 7 and has only unique digits 
    # <=> looping to find the largest number that's odd, a multiple of 7, and only has unique digits requires a lot of memory
    # and have not pursued a guess in check approach
    break if num.to_s.size >= 10 || flag.is_a?(String) == false
    quotient += 1
  end
  flag
end

# check work:
p featured(12) == 21
# => true
p featured(20) == 21
# => true
p featured(21) == 35
# => true
p featured(997) == 1029
# => true
p featured(1029) == 1043
# => true
p featured(999_999) == 1_023_547
# => true
p featured(9_999_999_999)
# => "Error: there is no possible number that meets all conditions"
