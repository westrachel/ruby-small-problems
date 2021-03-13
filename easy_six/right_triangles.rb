# Problem:
# Create a method that accepts a positive integer, n, as an argument
#  and uses that to display a right triangle whose sides each have n stars

# Examples:
# triangle(5)
# =>
#    *
#   **
#  ***
# ****
#*****

# triangle(9)
# =>
#        *
#       **
#      ***
#     ****
#    *****
#   ******
#  *******
# ********
#*********

# Assumption:
# a negative integer will not be inputted, so I don't need to validate inputs

def corner_four_right_triangle(n)
  num_of_spaces = n - 1
  num_of_stars = 1
  loop do
    puts " " * num_of_spaces + "*" * num_of_stars
    num_of_spaces -= 1
    num_of_stars += 1
    break if num_of_spaces < 0
  end
end

# Check work:
corner_four_right_triangle(7)
# =>
#       *
#      **
#     ***
#    ****
#   *****
#  ******
# *******

corner_four_right_triangle(1)
# =>
# *

# FURTHER EXPLORATION PART 1:
# Print the triangle upside down relative to the current way 
#   the triangles print
def corner_two_right_triangle(n)
  num_of_spaces = 0
  num_of_stars = n
  loop do
    puts " " * num_of_spaces + "*" * num_of_stars
    num_of_spaces += 1
    num_of_stars -= 1
    break if num_of_stars == 0
  end
end

# Check work:
corner_two_right_triangle(7)
# =>
# *******
#  ******
#   *****
#    ****
#     ***
#      **
#       *

# FURTHER EXPLORATION PART 2:
# Make the method more flexible, so that the triangle
#  displayed has its right angle at any of the 4 corners

def corner_one_right_triangle(n)
  num_of_spaces = 0
  num_of_stars = n
  loop do
    puts "*" * num_of_stars + " " * num_of_spaces
    num_of_spaces += 1
    num_of_stars -= 1
    break if num_of_stars == 0
  end
end

# Check work:
corner_one_right_triangle(7)
# =>
# *******
# ****** 
# *****  
# ****   
# ***    
# **     
# *  

def corner_three_right_triangle(n)
  num_of_spaces = n - 1
  num_of_stars = 1
  loop do
    puts "*" * num_of_stars + " " * num_of_spaces
    num_of_spaces -= 1
    num_of_stars += 1
    break if num_of_spaces < 0
  end
end

# Check work:
corner_three_right_triangle(7)
# =>
# *      
# **     
# ***    
# ****   
# *****  
# ****** 
# *******

def flexible_triangle(n, corner)
  case corner
  when 1
    corner_one_right_triangle(n)
  when 2
    corner_two_right_triangle(n)
  when 3
    corner_three_right_triangle(n)
  when 4
    corner_four_right_triangle(n)
  end
end

# check work:
flexible_triangle(5, 1)
flexible_triangle(5, 2)
flexible_triangle(5, 3)
flexible_triangle(5, 4)
