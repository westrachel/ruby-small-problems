# expected output:
# "My string looks like this now: 'pumpkinsrutabaga' "
# "My array looks like this now: ["pumpkins"]"

# my_string variable that references the String whose value is "pumpkins" is passed into
# the tricky method as the a_string_param argument
# so, initially, a_string_param and my_string reference the same object, the String whose value is "pumpkins"
# within the tricky method, the #<< method is called on a_string_param and the String whose value is "rutabaga"
# gets pushed to the string a_string_param references
# Since #<< is mutating, the original string referenced by both a_string_param and my_string is changed 
# to include "rutabaga" attached to the end of it; a new string isn't created 
# accordingly, the puts of my_string after the tricky_method call prints that my_string is "pumpkinsrutabaga" via string interpolation

# my array has not been mutated because of the method used w/in the tricky_method
# my_array is initially set to reference an array with 1 string element whose value is "pumpkins"
# my_array gets passed into the tricky_method as the an_arry_param argument 
# an_array_param thus references the same array as my_array
# in the tricky_method, an_array_param gets assigned to a different array that contains 2 string elements whose values are
# "pumpkin" and "rutabaga"; this reassignment is done through the #= method, which doesn't mutate the original array
# accordingly, the array that my_array references hasn't been changed, so the puts after the tricky_method call
# should print that my array is ["pumpkins"] via string interpolation
