def multiply(arg1, arg2)
  arg1 * arg2 
end 

# check method; the following should print true:
puts multiply(5, 3) == 15

#Further Exploration:
# if first argument = an array, then the array's elements get repeated the # of times specified by the second argument 
# it's as if the array is being treated as one unit, and that unit gets multiplied by a number
# still an array is returned, but it's an array w/ all elements of the initial array repeated the 2nd argument's # of times

# can't multiply an array by an array
# ie multiply(array1, 2) will return a valid output as long as array1 is deined beforehand
# but multiply(array1, another_array) is invalid