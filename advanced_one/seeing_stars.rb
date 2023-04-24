# Problem/Data:
# Create a method that accepts one positive odd integer input, n (where the minimum value of n inputted
#   is 7) and outputs an 8-pointed star in an nxn grid.

# Examples:
#star(7)

#*  *  *
# * * *
#  ***
#*******
#  ***
# * * *
#*  *  *

#star(9)

#*   *   *
# *  *  *
#  * * *
#   ***
#*********
#   ***
#  * * *
# *  *  *
#*   *   *

# Patterns observed in start output examples above:
# > each row, except the middle row, contains 3 stars
# > the middle row contains 'n' number of stars
# > the spaces between the 3 stars in the other rows expand as the row
#     gets farther away from the middle
#     >> in the (middle - 1) and (middle + 1) row all 3 stars are next to each other w/ the spaces
#           evenly spread out around the 3 stars to fill the n spaces around the 3 stars
#     >> # of spaces in non-middle rows = (n - 3)

# n = 7:
# * ((n - 3) / 2) spaces * ((n - 3) / 2) spaces *
# ((n - 3) / 2 / 2) spaces * ((n - 3) / 2 / 2) spaces * ((n - 3) / 2 / 2) spaces *
# n star's (middle row = (n / 2) + 1 )
# repeat (middle - 1) row
# repeat (middle - 2) row

# Algorithm:
# 0. Print a space row (based on examples, there's a space row before the star is displayed)
# 1. initialize a number of inner spaces variable and set it equal to the ((n - 3) / 2)
# 2. initialize a number of outer spaces variable and set it equal to zero
# 3. start a loop during each iteration:
#      i. in the same line print:
#         "num_outer_spaces" # of spaces, a star, "num_inner_spaces" # of spaces, a star, "num_inner_spaces" # of spaces, a star and "num_outer_spaces" # of spaces
#      ii. add 1 to the num_outer_spaces variable
#      iii. subtract 1 from the num_inner_spaces variable
#      iv. break if num_inner_spaces is a negative number
# 4. print a row of 'n' number of stars
# 5. repeat the loop construct from step 3, but reverse it such that the num_inner_spaces variable initially
#    points to a value of 0, while the num_outer_spaces variable initially points to the value

# Code:
# initial method
def stars(n)
  puts ""
  inner_sp = ((n-3) / 2)
  outer_sp = 0
  loop do
    puts " " * outer_sp + '*' + " " * inner_sp + '*' + " " * inner_sp + '*' + " " * outer_sp
    outer_sp += 1
    inner_sp -= 1
    break if inner_sp < 0
  end
  puts '*' * n
  inner_sp = 0
  outer_sp = ((n-3) / 2)
  loop do
    puts " " * outer_sp + '*' + " " * inner_sp + '*' + " " * inner_sp + '*' + " " * outer_sp
    outer_sp -= 1
    inner_sp += 1
    break if outer_sp < 0
  end
end

# refactor initial method to split out underlying logic into sub-methods:
def print_non_middle_rows(n, before_or_after_middle)
  case before_or_after_middle
  when "before_middle"
    x1 = ((n-3) / 2) & x1_sign = -1
    x2 = 0 & x2_sign = 1
  when "after_middle"
    x1 = 0 & x1_sign = 1
    x2 = ((n-3) / 2 ) & x2_sign = -1
  end
  loop do
    puts " " * x2 + '*' + " " * x1 + '*' + " " * x1 + '*' + " " * x2
    x1 += (1 * x1_sign)
    x2 += (1 * x2_sign)
    break if x1 < 0 || x2 < 0
  end
end

def star(num)
  puts " "
  print_non_middle_rows(num, "before_middle")
  puts '*' * num
  print_non_middle_rows(num, "after_middle")
end

# check work:
star(7)
 
*  *  *
 * * * 
  ***  
*******
  ***  
 * * * 
*  *  *

star(11)

*    *    *
 *   *   * 
  *  *  *  
   * * *   
    ***    
***********
    ***    
   * * *   
  *  *  *  
 *   *   * 
*    *    *
