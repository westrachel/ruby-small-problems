# Problem:
# Define a method that prints a 4-pointed diamond that falls w/in a square "n"x"n"
# grid where "n" is the integer argument passed into the method

# Examples:
#diamond(1)

# *

#diamond(3)

# *
#***
# *

#diamond(9)

#    *
#   ***
#  *****
# *******
#*********
# *******
#  *****
#   ***
#    *

# Data:
# Input:
#   > an odd integer (can assume input will always be an odd integer)
# Output:
#   > an empty row followed by a 4-pointed diamond made up of "*" symbols

# Examination of spaces and star symbol locations when "n" = 3:
#  > the grid = 3x3 when "n" = 3
#  > the first row w/ a star has the star populated in the middle at location 2 of the 3 possible locations
#  > the subsequent row has all grid locations (1, 2, and 3) populated with stars
#  > the final row has a star populated in the same spot as the first star row (which = at location 2)

# Examination of spaces and star symbol locations when "n" = 9:
#  > the grid = 9x9 when "n" = 3
#  > the first row w/ a star has a single star populated in the middle location = location 5 of 9 possible locations
#  > the second row has 3 stars; it has added 2 stars around the location of the star in the previous row; so there are stars at
#      > middle - 1, middle, and middle + 1     (= 4, 5, 6)
#  > the third row has 5 stars; it has added 2 stars around the location of the outer stars in the previous row; so there are stars at
#      > middle - 2, middle - 1, middle, middle + 1, middle + 2     (= 3, 4, 5, 6, 7)
#  > the fourth row has 7 stars; it has added 2 stars around the location of the outer stars in the previous row;
#      so, there are stars located at:
#      > middle - 3, middle - 2, middle - 1, middle, middle + 1, middle + 2, middle + 3
#  > the fifth row is full with stars <=> stars at all possible 9 locations
#  > row 6 is equivalent to row 4 described above
#  > row 7 is equivalent to row 3 described above
#  > row 8 is equivalent to row 2 described above
#  > row 9 is equivalent to row 1 described above

# Algorithm:
# 1. print an empty row (before the nxn grid is printed)
# 2. start an index variable that initially points to the value of 1
# 3. start a looping construct that will keep iterating until the index is greater than the number "n" passed into the method:
#     i. print an index number of stars that are located w/in the middle of the row
#           <=> each row has "n" locations/places, where "n" is always an odd number, so the pure middle is always (n / 2) - 1
#           <=> universal logic behind printing space(s) then star(s) then space(s) to fill a row w/ "n" location(s) where n >= 1:
#                 print (n - index) / 2 # of spaces then print index # of stars then print (n - index) / 2 # of spaces
#     ii. add 2 to the index number
# 4. reassign the index variable to the point to the number value of "n"
# 5. start another looping construct that will keep iterating until the the index's value is less than zero and in each iteration:
#      i. subtract 2 from the index
#      ii. print (n - index) / 2 # of spaces then print index # of stars then print (n - index) / 2 # of spaces

# Code:
def row_star_print(total_num_stars, idx)
  spaces = " " * ((total_num_stars - idx) / 2)
  puts spaces + "*" * idx + spaces
end
 
def diamond(n)
  puts ""
  index = 1
  loop do
    row_star_print(n, index)
    index += 2
    break if index > n
  end
  index = n
  loop do
    index -= 2
    break if index < 0
    row_star_print(n, index)
  end
end

# check work:
diamond(1)

# *

diamond(3)

# *
#***
# *

diamond(9)

#    *
#   ***
#  *****
# *******
#*********
# *******
#  *****
#   ***
#    *

# Further Exploration:
# Modify your method to print only the outer shell of a diamond

# Example:
#diamond(5)
#
#  *
# * *
#*   *
# * *
#  *

def row_star_space_print(n, num_middle_spaces)
  num_spaces = (n - 2 - num_middle_spaces) / 2
  if num_spaces > 0
    space = " " * num_spaces
    puts space + "*" + " " * num_middle_spaces + "*" + space
  else
    puts "*" + " " * num_middle_spaces + "*"
  end
end

def diamond_shell(n)
  puts ""
  row_star_print(n, 1)
  num_spaces_in_middle = 1
  loop do
    row_star_space_print(n, num_spaces_in_middle)
    num_spaces_in_middle += 2
    break if num_spaces_in_middle == n
  end
  num_spaces_in_middle -= 2
  loop do
    num_spaces_in_middle -= 2
    break if num_spaces_in_middle < 0
    row_star_space_print(n, num_spaces_in_middle)
  end
  row_star_print(n, 1)
end

diamond_shell(5)
#
#  *  
# * * 
#*   *
# * * 
#  * 

diamond_shell(3)
#
# *
#* *
# *

diamond_shell(7)
#
#   *  
#  * *
# *   * 
#*     *
# *   * 
#  * *   
#   *
