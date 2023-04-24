# Problem
# Create a method that accepts 1 argument (expected to be an array of integers),
# sort the integers based on their corresponding word value, and return the
# array of integers sorted

# Examples:
# alphabetic_number_sort((0..19).to_a) == [
#  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#  6, 16, 10, 13, 3, 12, 2, 0
# ]

# Data:
# Input:
#  > Array of integers
#    > Integers w/in the array are limited to being between 0 and 19
#
# Output:
#  > Array of the same integers sorted
#     > In the interim steps between input & output need to
#       sort the integers based on orting the English words for each number

# Algorithm:
# 1. Establish a hash constant w/ each key pair corresponding to the integer/string English
#  word value associated with each number between 0 and 19
#   Ex. key/value pair for the number 1 =  { 1 => "one" }
# 2. Define a method that:
#      i. Accepts one parameter (array_of_integers) and
#     ii. Convert each integer in the passed in array to its corresponding string English word
#          number value using the hash constant
#    iii. Sort the strings in the array alphabetically & by length
#          <=> exs: eight should come before eighteen and fifteen should come before five
#     iv. Convert each string English word number value in the sorted array back to the
#          corresponding integer value
#      v. Return the sorted array containing integers

# Code:
INTEGER_NUMBER_WORDS_HSH = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three",
                             4 => "four", 5 => "five", 6 => "six", 7 => "seven",
                             8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven",
                             12 => "twelve", 13 => "thirteen", 14 => "fourteen",
                             15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
                             18 => "eighteen", 19 => "nineteen" }

def alphabetic_number_sort(arr_of_integers)
  arr_of_num_words = arr_of_integers.map do |integer|
    INTEGER_NUMBER_WORDS_HSH[integer]
  end
  arr_sorted_ints = arr_of_num_words.sort.map do |word_number|
    INTEGER_NUMBER_WORDS_HSH.key(word_number)
  end
  arr_sorted_ints
end

# check work:
puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Refactor code using Enumerable#sort_by:
def alphabet_num_sort(arr_of_ints)
  arr_of_ints.sort_by { |integer| INTEGER_NUMBER_WORDS_HSH[integer] }
end

# check work:
puts alphabet_num_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
