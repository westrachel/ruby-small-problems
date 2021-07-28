# Bugged Method:
def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
# Expected Output:
#[]
# Actual Output:
#[]
p my_method([3])
# Expected Output:
#[21]
# Actual Output:
#nil
p my_method([3, 4])
# Expected Output:
#[9, 16]
# Actual Output:
#nil
p my_method([5, 6, 7])
# Expected Output:
#[25, 36, 49]
# Actual Output:
#nil

# Explanation:
# Ruby methods return the last statement evaluated, which in this case is
#   the if statement. The first branch of the if statement is evaluated
#   only if array.empty? is true. If the array isn't empty, then the next
#   branch of the if statement will be considered. Technically, there is no
#   condition for the second branch, at least not in the elsif row. So, as 
#   long as they array is empty, then the both the 2nd and 3rd branches are
#   competing to be evaluated, but neither are and nil is returned.

# Debugged Method
# Note: I believe the intent is that the second branch should be expected only if the array
#   has a size greater than 1.
def my_method(array)
  if array.empty?
    []
  elsif array.size >= 2
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

# check work:
p my_method([]) == []
# => true
p my_method([3]) == [21]
# => true
p my_method([3, 4]) == [9, 16]
# => true
p my_method([5, 6, 7]) == [25, 36, 49]
# => true

# Edit to Explanation Above:
#  It's not actually true that the 2nd and 3rd branches are competing to be evaluated.
#   It is true that the second elsif doesn't have a condition, but what happens is that
#    Ruby looks for the condition on the next line and then accepts the next line, with the
#    map invocation with a block, as the elsif condition.
#    The return value of a map invocation with a block is a new array, and all values except nil and
#     false are considered truthy in Ruby, so the second branch is always evaluated as long as the first
#     branch doesn't get evaluated. Since the map invocation w/ a block is taken as the conditional
#     expression, there's nothing left after it to get evaluated, so the return value for the second
#     branch is nil.
