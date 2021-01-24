# ! vs ? in Ruby 
# ! is the not operator & it returns the opposite boolean value of whatever object is put after it 

# ? is part of the ternary operator:
# within the ternary operator, ? acts as a separator between the expression being evaluated
# and the returns to be evaluated if 
# <expression to test> ? <evaluate this if expression is true> : <evaluate this if expression is false>

# subcases:
# i. 
# != means does not equal to 
# one usage for != is in conditionals to validate user input

# ii. 
# !user_name
# as long as user_name has been defined as a valid user_name variable
# and is not empty/nil or false, user_name will be considered truthy
# and !user_name should return false


# iii. 
# words.uniq!
# here, ! signals that the words object is likely to be permanently mutated upon this method call 
# assuming words is non-empty/has duplicate values and is of an object type that can have .uniq called on it 

# iv. 
# tested in irb:
# if enter ?2 
# the return value is a string "2"


# v. 
# if enter in irb 2?, the subsequent line has a space
# there's an expectation for me to finish the ternary operator expression that I started by only entering 2?
# but also, there are some methods that end in ? 
# for example, "A".nil? will return false


# vi. 
# if establish user_name as a truthy value
# !!user_name returns true
# if user_name is nil or false, then !!user_name returns false
