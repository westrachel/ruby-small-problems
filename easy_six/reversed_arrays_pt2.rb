# Problem:
# Create a method that takes an array and returns a new array that contains the
#  elements of the passed in array but in reverse order
# don't use Array#reverse or Array#reverse!

def reversed(arr)
  reversed_arr = []
  index = arr.size - 1
  loop do
    break if arr.empty? # added so that reversed([]) == [] # => true
    reversed_arr << arr[index]
    index -= 1
    break if index < 0
  end
  reversed_arr
end

# Check Work:
# Examples:
puts reversed([1,2,3,4]) == [4,3,2,1]          # => true
puts reversed(%w(a b e d c)) == %w(c d e b a)  # => true
puts reversed(['abc']) == ['abc']              # => true
puts reversed([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reversed(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

# FURTHER EXPLORATION:
# refactor using each_with_object or inject
def reversed(arr)
  index = arr.size - 1
  arr.each_with_object([]) do |element, arr|
    arr[index] = element
    index -= 1
  end
end

# Check Work:
# Examples:
puts reversed([1,2,3,4]) == [4,3,2,1]          # => true
puts reversed(%w(a b e d c)) == %w(c d e b a)  # => true
puts reversed(['abc']) == ['abc']              # => true
puts reversed([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reversed(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
  