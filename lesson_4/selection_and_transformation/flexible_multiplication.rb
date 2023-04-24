# define more generic multiplcation method that takes 2 arguments
# the first argument = array containing numbers
# the second argument = the transformation criterion
#       <=> in this case, the transformation criterion is the # you want to multiply 
#             each element of the passed in array by

def multiply(arr, factor)
  scaled_arr = []
  counter = 0
  
  loop do
    break if counter == arr.size
    scaled_arr << arr[counter] * factor
    counter += 1
  end
  scaled_arr
end

# check work:
my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]