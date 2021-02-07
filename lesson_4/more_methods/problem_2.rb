# Based on referencing Array Ruby documentation, Array#count evaluates a block's return value
# in order to determine which values in the block it will count.
# So, during the iteration process, if a block's return value is truthy, then that element 
# will be counted & the return value is the total/final count.

# Additional test run to confirm understanding above:
# The Ruby documentation states that it counts "elements for which the block returns a true value"
# and I interpreted "true" as "truthy". To confirm that that is reasonable as not all truthy values are true,
# in irb I tested:
# arr = [1, 2, 4, 2]
# arr.count { |num| 'hi' }
# => 4
# <=> the above test confirms that as long as the return value of the block is truthy ('hi' is truthy),
#      the element is counted, so the above example counts all elements in arr as the block is always truthy.
