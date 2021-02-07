# The last expression of the select method provided is truthy ('hi' is truthy), 
# so each element of the array that is iterated over will be selected.
# The collecton returned will be equivalent to the original array:
# => [1, 2, 3]       <-- expected return value

# extra note to add to my solution above to increase its precision:
# select returns a *new* array, and this *new* array is equivalent to the original array