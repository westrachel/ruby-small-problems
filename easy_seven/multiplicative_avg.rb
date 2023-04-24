# Problem:
# Create a method that takes an array and calculates the average value of all
#   inputted numbers within the array and prints the average rounded to 3 decimal places
# Assumptions:
#  > inputted array is non-empty and only contains numbers

# Examples:
# show_multiplicative_average([3, 5])                 => The result is 7.500
# show_multiplicative_average([6])                    => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17])  => The result is 28361.667

# Implicit Requirement:
#   > even if have a result that is an integer, still need to print 3 decimals
#     (so, 3 zeros to the right of the decimal)

# Algorithm:
# i. Calculate the product of all the numbers in the passed in array
# ii. Divide the product by the float number of elements in the passed in array
# iii. Round the quotient to 3 decimal places
# iv. Check if the rounded quotient has 3 decimal places, if not adjust the quotient
#      (aka the calculated average), so that it does have 3 decimal places
#       a. define and call a separate method the corrects the number of decimal places if necessary
#       b. this separate method should take in a number integer and convert it to a string
#       c. find the index of decimal point within the string integer
#       d. calculate the number of string numbers to the right of the decimal point and assign
#             this to a variable, num_decimal_places
#       e. if num_decimal_places is less than 3 then add to the end of string number enough "0s"
#          to make the string number have 3 decimal places
#             > multiply the "0" string by the result of subtracting the num_decimal_places from 3
#                 and then push the product of this result to the number string
#       f. if num_decimal_places already == 3, since the .round(3) method has already been called on the
#           average number that's passed into the correct_num_decimal_places method, then simply return
#           the string number without mutating its number of decimal places
#       g. w/in the larger show_multiplicative_average method assign the result of the inner sub_method
#           call that corrects the number of decimal places if necessary to a local variable called avg
# v. Print "=> The result is " string with the properly rounded average (= avg) using string interpolation

def correct_num_decimal_places(num)
  num_str = num.to_s
  decimal_pt_idx = num_str.chars.find_index(".")
  num_decimal_places = num_str.chars.size - (decimal_pt_idx + 1)
  if num_decimal_places < 3
    num_str << ("0" * (3 - num_decimal_places))
  else
    num_str
  end
end

def show_multiplicative_average(array)
  average = array.inject { |product, x| product * x } / array.size.to_f
  avg_rounded = average.round(3)
  avg = correct_num_decimal_places(avg_rounded)
  puts "=> The result is #{avg}"
end

# Check Work:
show_multiplicative_average([3, 5])                 
# => The result is 7.5
show_multiplicative_average([6])                    
# => The result is 6.0
show_multiplicative_average([2, 5, 7, 11, 13, 17])  
# => The result is 28361.667

# Further Exploration:
# How would the printed output be affected w/o .to_f below?
def show_multiplicative_avg(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

# The product wouldn't be a float; it would be an integer
# As a result, the calculated average would be an integer
#   b/c both product and the return value of numbers.size are
#   integers.
# The implication is that calculated average would be rounded down.
# The printed result would still have 3 decimal places due to the usage
#   of Kernel#format, but the decimals printed would always be "000"'s, which
#   isn't desired in some cases.
# For example, the return of show_multiplicative_avg([2, 5, 7, 11, 13, 17]) when
#   .to_f is removed and product is initialized as product = 1, would be:
#   => The result is 28361.000, even though it should technically be 28361.667
