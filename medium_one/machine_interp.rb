# Problem:
# Create a method that functions as a mini stack-and-register lang
# method's submethods/instructions should include:
#     i. n = push a value to the register only; n = an integer value
#     ii. PUSH = push the register value to the stack (it should remain as the current register value too)
#     iii. ADD = remove a value from the stack and add it to the current register value to arrive at the new register value
#     iv. SUB = remove a value from the stack and subtract it from the register value to arrive at the new register value
#     v. MULT = remove a value from the stack and multiply it by the register value to arrive at the new register value
#     vi. DIV = remove a value from the stack and divide the register value by it to arrive at the new register value
#     vii. MOD = remove a value from the stack and divide the register value by it and establish a new register value as the integer
#           remainder from the division
#     viii. POP = remove the topmost element from the stack and store it as the new register value
#     ix. PRINT = prints the register value

# Examples:
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
# operation explanation for the above example:
#   > register is reassigned from 0 to 3
#   > 3 is pushed to the stack
#   > register is reassigned from 3 to 4
#   > 4 is pushed to the stack
#   > register is reassigned from 4 to 5
#   > 5 is pushed to the stack
#   > the register is printed on a new line (<=> 5 = printed)
#   > the topmost element from the stack is removed (= 5) and is added to the current register to arrive
#       at the new register value ( = 10 = 5 + 5)
#   > the register is printed on a new line (<=> 10 = printed)
#   > replace the current register value w/ the topmost element in the stack (this removes the topmost element 
#       from the stack, so it's no longer in it)
#   > the register is printed on a new line (<=> 4 = printed)
#   > the topmost element from the stack is removed from the stack and added to the current register to arrive at
#       the new register value

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
# operation explanation for the above example:
#   > register is reassigned from 0 to 3
#   > 3 is pushed to the stack
#   > 3 is pushed again to the stack
#   > register is reassigned from 3 to 7
#   > 3 is removed from the stack and the register (7) is divided by it, which returns 2; the
#      register is reassigned from 7 to 2
#   > 3 is removed the strom and multiplied by the current register (2) to arrive at the new
#     register 6
#   > the current register (6) is printed

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

# minilang('-3 PUSH 5 SUB PRINT')
# 8

# minilang('6 PUSH')
#
# <=> nothing prints

# Data:
# Input:
#  > a string w/ only valid commands and string integer values
#  > based on examples, commands and input values are separated by single spaces
#  > explicit requirement = implicit input: the register should be established as 0

# Output:
#  > either nothing or the register value if PRINT is included in the string input

# Algorithm:
# 1. Initialize a variable called register that initially points to the value zero
# 2. Initialize a variable called stack that initially points to an empty array
# 3. Iterate over the inputted string and separate all groups of characters in the string
#      into elements of an array delimiting the elements to be pushed to the array by single space characters
#   ex: '5 PUSH POP PRINT' <=> should be converted to the array: ['5', 'PUSH', 'POP', 'PRINT']
# 4. Iterate over the returned array from step 3 and transform each element of the array to an integer
#      if the element is a string integer
#     a. test if the string array element is a string integer w/ the following:
#          x = a string
#          x.to_i.to_s == x     <=> if this returns true, then convert x to an integer and restore it in the array
# 5. Iterate over the transformed array returned from step 4 and perform the relevant command/function depending
#       on the transformed array element's value
#     a. if the array element's value is an integer, then reassign the register variable to the integer value of the
#            element being iterated over
#     b. if the array element's value being iterated over is the string word 'PUSH', then push the register value to the
#         array pointed to by the stack variable initialized in step 2
#     c. if the array element's value being iterated over is the string word 'ADD', then remove the topmost integer element from the stack
#          and add it to the integer value the register variable points to and reassign the register variable to the result of that
#          summation
#     ... <=> won't write out all the functions again, b/c their functions are fully described above
#      i. will note that if the array element's value being iterated over is the string word 'PRINT' then make sure the integer value
#         the current register variable points to is printed on a new line

# Code:
def minilang(str)
  register = 0
  stack = []
  parsed_command = str.split(' ').map do |x|
    x.to_i.to_s == x ? x.to_i : x
  end
  parsed_command.each do |subcommand|
    register = subcommand if subcommand.is_a?(Integer)
    case subcommand
    when 'PUSH' then stack << register
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
  end
end

# check work:
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
