# The return value of the map method invocation with a block should be the array:
#           [1, nil, nil]
# The map method is called on an array with 3 integer elements [1, 2, 3]
# The block of the method method invocation includes an if statement that will
# return nil if the integer element of the called on array is greater than one,
# otherwise the if statement will return the integer element of the called on array.
# This is because the if statement evaluates a puts call if the integer element is >1,
# and the return value of puts is nil. Otherwise, if the integer element isn't greater than 1,
# the if statement returns the integer itself, which is considered a truthy value in Ruby.
# The last 2 integers of the array that this map method is called on are greater than 1,
# so when the map method iterates over them, the map method's block return value is nil/"falsey",
# and the map method will push nil to the returned array.
