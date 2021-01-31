# expected output:
# "My string looks like this now: 'pumpkins' "
# "My array looks like this now: ["pumpkins", "rutabaga"]"


# my_string variable that references the String whose value is "pumpkins" is passed into
# the tricky method as the a_string_param argument
# so, initially, a_string_param and my_string reference the same object, the String whose value is "pumpkins"
# within a tricky_method, a_string_param gets reassigned to a String whose value is "rutabaga"
# reassignment has been defined to not change the object the variable initially referenced,
# so, athough a_string_param now references a new object, the my_string variable still references
# the original "pumpkins" String, which hasn't been changed 
# accordingly, the puts of my_string after the tricky_method call prints that my_string is "pumpkins" via string interpolation

# my array has been mutated because of the method used w/in the tricky_method
# my_array is initially set to reference an array with 1 string element whose value is "pumpkins"
# my_array gets passed into the tricky_method as the an_arry_param argument 
# an_array_param thus references the same array as my_array
# within the tricky method, the Array#<< method is called on the an_array_param
# Array#<< will add the "rutabaga" string to the original array in a mutating way
# such that a new array isn't returned, but rather the original array referenced by both
# an_array_param and my_array is changed to contain an additional string whose value is "rutabaga"
# accordingly, the puts of my_array after the tricky_method call prints that my_array is ["pumpkins","rutabaga"] via string interpolation
