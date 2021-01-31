# Understanding the given current method in order to improve it:
# within the current defined method:
# dot_separated_words is assigned to an array whose elements
# represent each IP address number as String objects, that were specfied between the "."'s specified in the input_string argument that was
# initially passed into the method
# while the array dot_separated_words has at least 1 element,
# the variable word is assigned to last element of the dot_separated_words array through the use of the method #pop
# the while loop will not break if is_an_ip_number?(word) is false
# so, if the first number variable is assigned to is not a valid ip address
# then the loop will run again and check the next element in the dot_separated_words array
# which is mutated by pop, so a different element of the dot_separated_word array is checked w/ each iteration
# of the while loop provided that the dot_separated_word array has more than 1 element to check
# this method seems problematic, b/c as long as one of the String numbers in the dot_separated_word array is a valid IP address number
# the method will return as true, which is faulty

# improved code:
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4 # for valid sized IP address
    check_this_arr = dot_separated_words.select { |element| is_an_ip_number?(element) } # select all elements of the array that are valid IP numbers
    check_this_arr.size == 4 ? true: false # if there are still 4 elements in the array to check, then a valid IP address has been passed in otherwise return false
  else # return false (indication of invalid IP address) when more or fewer than 4 components are present in the IP address input string that is passed in
    false
  end
end
