# Problem:
# Create a method that combines 2 arrays to form a new array with
# only unique elements

# Example:
# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

def merge_arrays(array1, array2)
  (array1 + array2).uniq!
end

# Check Work:
a = [1, 3, 5]
b = [3, 6, 9]
p merge_arrays(a, b) == [1, 3, 5, 6, 9]
# => true
# The uniq! method is mutating, but it's called on the return value of adding the
#   2 passed in arrays together, so the 2 passed in arrays should be unchanged
# Confirm this understanding by printing a and b post merge_arrays method call:
p a
# => [1, 3, 5] <=> confirms a is unchanged
p b
# => [3, 6, 9] <=> confirms b is unchanged
