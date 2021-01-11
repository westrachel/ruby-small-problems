#PEDAC:
#Problem:
#      write a method that returns true if the number's absolute value is odd 
#Examples:
#       puts is_odd?(2)     => false
#       puts is_odd?(-17)   => true
#       puts is_odd?(0)     => false
#       puts is_odd?(-8)    => false
#Data Structure:
#    the input is one integer argument 
#       > this integer can be positive, negative, or zero 
#       > also, allowed to assume the input is a valid integer value (don't have to worry about converting float inputs to integers)

#Algorithm:
#    i. define a method that accepts one integer argument
#    ii. if a negative integer is inputted convert that input to absolute value/a positive value
#    iii. leverage % to check if integer input is even & divisible by 2
#              > core concept: integer % 2 == 0 will return true if the integer is positive & 0 
#              > return false if the output to -1 * negative integer % 2 == 0 (this makes the method return false if the absolute value is divisible by 2 and thus even aka not false)
#              > if input is 0, add 1 to 0 before leveraging % to get a false message (since 0 is not odd)          
#             > return false if have positive integer input that will make the expression integer % 2 == 0 evaluate to true

#Code:
def is_odd?(integer)
  if integer < 0 
    if -1 * integer % 2 == 0 
      false 
    else 
      true      # this nested if statement forces the code to return true if -1 * integer % 2 != 0, so it will make puts is_odd(-17) return true
    end
  elsif integer == 0 
    integer + 1 % 2 == 0
  elsif integer % 2 == 0
    false 
  else 
    true     #this provides a return value for all integer inputs that are positive that aren't even and make the expression integer % 2 == 0 evaluate to true
  end 
end 

puts is_odd?(2)    
puts is_odd?(5)   
puts is_odd?(-17)  
puts is_odd?(-8)   
puts is_odd?(0)    
puts is_odd?(7)     



#simpler solution:
# why I thuoght I needed the more complicated solution:
# I thought I needed to manipulate negative integers to avoid using % on negative integers
# however, % will always return a non-negative if the <num> is positive on the right side of <%> in the expression: num % num 
# also, I was adding an extra step by returning the opposite of num % 2 == 0 
# I was indirectly checking if numbers were odd by checking if they were even 
# instead just check if they're odd using num % 2 == 1
def odd_integer?(int)
  int % 2 == 1
end 

#rewrite #is_odd? to use Integer#remainder insead of %
#explore remainders of different cases in irb:
2.remainder(2) #returns 0 
5.remainder(2) #returns 1
-17.remainder(2) #returns -1
-8.remainder(2) #returns 0
0.remainder(2) #returns 0
7.remainder(2) #returns 1

#observation:
#all cases of integer_input that should return false if passed as an argument into is_odd?
# will return 0 when call .remainder(2) on them
# solution to rewriting is_odd? to use remainder:
def is_odd?(integer)
  if integer.remainder(2) == 0 
    false
  else
    true
  end
end

#check solution w/ remainder:
puts is_odd?(2)    
puts is_odd?(5)   
puts is_odd?(-17)  
puts is_odd?(-8)   
puts is_odd?(0)    
puts is_odd?(7)    