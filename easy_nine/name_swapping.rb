# Problem:
# Create a method that accepts one string argument as an input
# and then outputs a mutated version of that string

# Example:
# swap_name('Joe Roberts') == 'Roberts, Joe'

# Data:
# Input:
#   > one string containing a first and a last name separated by a space
#   > I'm assuming no inputs will ever include a middle name
# Output:
#   > one string containing the last name specified first, then a comma, then
#      a space, and then the person's first name

# Algorithm:
# 1. Convert the inputted string into an array
#     <=> during the conversion, split the string so that each element of
#       the created array represents either the first or last name word w/in the
#        original string passed into the method as an argument
# 2. Reverse the array, so that the last name is the element at the 0th index of the array
#      and the first name is at the 1st index
# 3. Call the join method on the reversed array with a comma and a space specified,
#     so that the reversed array is converted back into a string and the last name and
#     first name words are separated by a comma and space

# Code:
def swap_name(str)
  str.split(' ').reverse.join(', ')
end

# Check work:
p swap_name('Joe Roberts') == 'Roberts, Joe'
# => true

# Further exploration:
# can I reconfigure the method to avoid converting the inputted string into an array?

def name_swap(str)
  space_idx = str.index(' ')
  first_name = str[0, space_idx]
  last_name = str[(space_idx + 1), (str.length - space_idx - 1)]
  last_name + ', ' + first_name
end

# check work:
p name_swap('Joe Roberts') == 'Roberts, Joe'
# => true
p name_swap('Jane Doe') == 'Doe, Jane'
# => true
