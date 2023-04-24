#first program:
# x = 0
# 3.times do 
#   x += 1
# end 
# puts x

## I'm expecting this to return 3 (= 0 + 1 + 1 + 1) 

#second program: 
# y = 0 
# 3.times do 
#   y += 1
#   x = y 
# end 
# puts x

## I'm expecting this to return an error b/c the the do/end is called after a method (times)
#      and therefore the variable x is defined w/in an inner scope only 
#      and what I've learned from this chapter is that inner scope variables aren't 
#      accessible to the outer scope 


#okay, now type the programs again (building muscle memory here)
# and run this script to see if my expectations are correct:
##NOTE: will need to change x to be something else to accurately reflect the second program
## b/c the first program defines x in the outer scope, so reassigning x in the 2nd program to be q
x = 0 
3.times do 
    x += 1 
end 
puts x

y = 0 
3.times do 
  y += 1
  q = y 
end 
puts q 

## prints out expected items when execute exercise_five.rb
## 3 and then prints error : '<main>': underfined local variable or method 'q'
