# Problem:
# create a method that removes vowels from an inputted array of strings

# Examples:
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Data:
# Input:
#  > an array of strings that may or may not contain vowels
#  > characters that are considered to be vowels:
#         a, e, i, o, u
#   > based on examples, y is not considered a vowel, so don't remove it
# Output:
#  > an array of strings that is almost identical to the array of strings inputted
#    except the vowels are removed

# Algorithm:
# i. initialize a VOWELS constant array that includes all upper and lower cased vowels
# ii. invoke the map method with a block, with each string word in the array being passed
#      into the map method block and assigned to the local variable word
# iii. For each iteration, call the each_char method on the word variable and then immediately
#       call the select method on the return value of each_char
#         > invoke the select method w/ a block to iterate over each letter returned by the each_car method call on
#            the local word variable and select that letter if the VOWELS constant doesn't include the letter
#         > the select method returns a new array containing all the non-vowel letters in the word variable
#         > at the end of the select invocation w/ a block call the join method, which will connect the letter strings
#            in the new array returned by the select method
#         > So, the ultimate return value of the block within the map method call for each iteration is a new array
#           containing one string element
#           <=> Since string elements are considered truthy, the return value of each map method iteration is always truthy
#           <=> the map method interprets the truthiness of the return value in order to determine the transformation performed
#         > In this program, the map method will return a new array containing all of the string elements returned in
#             single element arrays by the inner select method invocation

# Code:
VOWELS = %w(A E I O U a e i o u)

def remove_vowels(str_arr)
  str_arr.map do |word|
    word.each_char.select do |letter|
      VOWELS.include?(letter) == false
    end.join('')
  end
end

# Check work:
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# true
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# true
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
# true
