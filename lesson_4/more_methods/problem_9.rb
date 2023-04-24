# The map should return a new array that looks like the following:
#     [nil, 'bear']
# The block of the map call in the provided example contains an if statement
# that only evaluates if the value of the hash for the iteration has more than
# 3 characters. In the hash that map is called on, only one of the two key-value
# pairs has a value that has more than 3 characters. For the first key-value pair,
# the value is ant, which doesn't have 3 characters, so the if statement is not 
# evaluated. Since there are no other expressions in the block besides the if statement,
# the block will return nil when the if statement isn't evaluated, which is the case for
# ant.

# As implied by the above discussion, but discussed here for clarification,
# the keys of the hash aren't included in the array returned by map. The keys aren't specified
# in the block of the map method invocation w/ a block, which is equivalent to saying that the keys
# are excluded from the transformation criterion specified to the map method. Only the values of the
# hash are specified in the transformation criterion, so only values of the hash can be passed
# into the array that map returns.
