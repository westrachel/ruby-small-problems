# Problem:
# Create a method that takes in 2 arrays of numbers and multiplies
#  the numbers in each array at the same index and returns a single array
#  containing the products of all the multiplications

# Allowed Assumptions:
#  > inputted arrays are of the same length
#  > inputted arrays only contain numbers

# Example:
# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Data:
# Input:
#  > 2 Arrays Containing Numbers
#    > potentially could contain floats, not just integers
# Output:
#  > A new array containing the products of each multiplication
#  > Implicit output requirement:
#    > Print the products as they are, don't format so that the products all have the
#       same number of decimal places
#     For example, if a float gets passed in as a sub-element of one array
#        and the resulting product is a float w/ a decimal place while other
#        products are integes, that's okay

# Algorithm:
# 1. Initialize an index variable that's equal to 1
# 2. Initialize a product_array variable that points to an empty array
# 3. Start a loop and in each iteration of the loop:
#   i. Push to the product_array the result of multiplying the first array's element
#       at the index by the second array's element at the index
#   ii. Add one to the index variable
#   iii. Break the loop if there is no element at the index corresponding with the
#         index variable in the first array (only need to check one of the arrays,
#          b/c they are the same size)
# 4. Return the product_array by specifying it as the last expression evaluated within
#     the created method

# Code:
def multiply_list(array1, array2)
  index = 0
  product_array = []
  until array1[index].nil?
    product_array << array1[index] * array2[index]
    index += 1
  end
  product_array
end

# Check work:
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
# => true

# Further Exploration:
# try to create a method w/ a one line inner block using Array#zip

# testing in irb:
# [3, 5, 7].zip([9, 10, 11])
# => [[3, 9], [5, 10], [7, 11]]

def multiply_lists(array1, array2)
  array1.zip(array2).map { |arr| arr[0] * arr[1] }
end

# Check work:
p multiply_lists([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
# => true

def understand_zip(arr1, arr2)
  arr1.zip(arr2) { |x| p x }
end

understand_zip([3, 5, 7], [9, 10, 11])
# =>
# [3, 9]
# [5, 10]
# [7, 11]

# Alternative method definition that invokes zip w/ a block:
def list_multiplication(arr1, arr2)
  new_arr = []
  arr1.zip(arr2) do |pair_arr|
    new_arr << pair_arr[0] * pair_arr[1]
  end
  new_arr
end

# Check work:
p list_multiplication([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
# => true
