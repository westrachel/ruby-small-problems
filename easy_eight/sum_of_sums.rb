# Problem:
# Create a method that takes a array containing only numbers and returns a number
#  that represents the sum of all the sums of each unique sequence of numbers of
#  the passed in array.

# Examples:
# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35

# Data:
# Input:
#  > an array of numbers (doesn't matter if floats or integers)

# Output:
#  > a number (doesn't matter if float or integer)

# <=> there is no implicit/explicit requirement to convert any inputs to integers
# if they are passed in as floats; if there are any passed in floats, then the final
#  returned sum = a float, but that's okay
# <=> there is no implicit/explicit requirement stating that the passed in array can't be mutated

# Algorithm:
# 1. Initialize a new variable w/in the method called final_sum that initially points to the value 0
# 2. Start a loop that doesn't break until the passed in array is empty
#     i. W/in each loop's iteration use inject and map to sum all the numbers in the array
#     ii. Add the sum calculated in (2.i.) to the final_sum variable
#     iii. Call the pop method to delete the last number element from the passed in array before
#           starting the next iteration of the loop
# 3. List the final_sum variable after the loop breaks, so that this variable is the last expression
#     evaluated by the method and is therefore the return value of the method

# Code:
def sum_of_sums(arr)
  final_sum = 0
  until arr.size == 0
    final_sum += arr.inject(:+)
    arr.pop
  end
  final_sum
end

# Check Work:
p sum_of_sums([3, 5, 2]) == 21
# # => true
p sum_of_sums([1, 5, 7, 3]) == (36)
# # => true
p sum_of_sums([4]) == 4
# # => true
p sum_of_sums([1, 2, 3, 4, 5]) == 35
# # => true

# Further Exploration:
# Create a method that doesn't mutate the originally passed in array like the solution above

def summation_of_sums(arr)
  final_sum = 0
  length_of_slice = arr.size
  until length_of_slice == 0
    final_sum += arr[0, length_of_slice].inject(:+)
    length_of_slice -= 1
  end
  final_sum
end

# Check work:
p summation_of_sums([3, 5, 2]) == 21
# # => true
p summation_of_sums([1, 5, 7, 3]) == (36)
# # => true
p summation_of_sums([4]) == 4
# # => true
p summation_of_sums([1, 2, 3, 4, 5]) == 35
# # => true

# Show that the second created definition doesn't mutate the passed in array:
a = (1..10).to_a
p a
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p summation_of_sums(a)
# => 220
p a
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]    <=> array is not mutated
p sum_of_sums(a)
# => 220
p a 
# => [] 
# <=> first method created mutates the passed in array and
#   deletes all the elements as it iterates through it
