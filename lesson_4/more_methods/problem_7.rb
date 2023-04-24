# BLOCK'S RETURN VALUE DISCUSSION:
# The block's return value is the return value of the last expression evaluated,
#    which is the return value of num.odd? in the provided example.
# In this code, the any? method is called on an array containing 3 integer elements,
#    with each element passed into the block as the num argument.
# So, with each iteration over the array, each integer is evaluated as odd or not,
#    and if the integer is odd then the block's return value is true. If the integer
#    is not odd, then the block's return value is false.
# The called on array is [1, 2, 3], which contains 2 odd integers and 1 even integer.
#    Accordingly, the block's return value will be true for the 1st & last iteration
#    and will be false for the 2nd iteration, when 2 is evaluated as odd or not.

# ANY? METHOD'S RETURN VALUE DISCUSSION:
# The any? method's return value will be true for the provided example.
#   This is because the any? method will return true if the block's return value
#   is true for *any* of the iterations over the provided collection. As discussed
#   above, two iterations will have a true return value, which more than satisfies
#   the required criterion of one iteration having the block return a true value.


# Additional note about any?
# It can be thought of as short-circuiting. In the context of the provided example,
# any? stops iterating over the called on array after the first iteration that evaluted
# as true.
