# Array#reject evaluates the truthiness of the block to determine which elements of the array it's called on to delete.
# In the given example, I expect the return value of reject to be an array equivalent to the array that reject is called on
#        ( => [1, 2, 3]). The return value is an array containing the same elements as the array called on, because the block's
#        last expression is puts num, and the return value of puts is nil. Based on Enumerator#reject documentation, when the 
#        block's return value is falsey, which it's always falsey in the given example, none of the elements in the passed in
#        array will be deleted as the array is iterated over.


# Additional note to add the above solution to increase precision/clarification:
# reject returns a *new* array, so the return value in this case is a *new* array containing the same elements as the array
#     reject was called on