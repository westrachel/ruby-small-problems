# the method name or its parameters could be renamed to be a bit more specific to 
# what the method actually does
# so, instead of naming the method "tricky_method" could name it:
# create_new_string_mutate_existing_array 
# this is a longer name, but now you don't have to remember what the innards of the method
# looks like / reference back to the method definition
# instead, the method's name states directly that it will create a new string object
# (which is done through reassignment of the a_string_param) and that 
# the existing array will be mutated (which is done through the usage of the #<< method in the method's definition)

# alternatively if you choose to alter the actual method definition itself:
# could alter the program so that you use the same method on both the string and the array 
# arguments passed into the method and have #<< called on both the string and the array
# so, that both the original my_string and my_array variables' referenced objects are mutated
# within the method 
# if do this, would be good to rename the method definition more clearly to:
# postpend