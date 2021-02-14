# a = 2
# b = [5, 8]
# arr = [a, b]

# arr[0] += 2
# arr[1][0] -= a

# explain what the above final values of a and b are:
# a = 2     <-- final value of a equals the original value of a
# the a variable points to the integer 2, which is immutable (integers are immutable). The a value is used to 
# create the arr array. Specifically, the element at the 0th index of the arr array is the integer value that a points to.
# When arr[0] += 2 is called, the variable a is not modified to point to a new value in memory. Instead, the element
# at the 0th index of the array arr gets reassigned to the value 4.

# arr[1][0] -= a will subtract 2 from the element at the 0th index in the b sub-array within arr.
# The b variable array is modified in tandem when arr[1][0] -= 2 reassigns 5 to 3, since that array it points to is being
# modified.

# So, the final value of b is: [3, 8]