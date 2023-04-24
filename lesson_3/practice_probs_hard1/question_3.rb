# A)

# line 13 should print: "one is 'one'"
# line 14 should print: "two is 'two'"
# line 15 should print: "three is 'three'"
# <=> the mess_with_vars method call in line 11 doesn't change what the 
# variables one, two, and three reference
# also, the mess_with_vars method call should raise an exception
# b/c one = two isn't valid variable assignment within the method's scope
# two should be 'two' or should be :two (symbol), can't just set the variable one = two b/c two w/o quotes or : is undefined
# <=> same for two = three and three = one assignments in mess_with_vars method call, these assignments should raise exceptions

# B)
# line 13 should print: "one is 'one'"
# line 14 should print: "two is 'two'"
# line 15 should print: "three is 'three'"
# <=> the mess_with_vars method call in line 11 doesn't change what the 
# variables one, two, and three reference
# <=> difference between A) and B) is that the variable assignments within the mess_with_vars method 
# defined in B) shouldn't raise exceptions, b/c the variables are assigned to strings 

# C)
# line 13 should print: "one is 'two'"
# line 14 should print: "two is 'three'"
# line 15 should print: "three is 'one'"
# <=> the mess_with_vars method call in line 11 does MUTATE the objects that the 
# variables one, two, and three reference
# this is b/c the method #gsub! is called w/in mess_with_vars 
# and gsub! is mutating