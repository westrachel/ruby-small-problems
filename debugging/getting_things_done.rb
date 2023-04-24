# debug the following:
#def move(n, from_array, to_array)
#  to_array << from_array.shift
#  move(n - 1, from_array, to_array)
#end

# Example
todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

#move(2, todo, done)

# I think the stack level too deep error is because the recursion that keeps
#  specifying to refer back to move(n - 1,...) could keep going into the negatives
# and there's nothing to stop it
# So, when the move call above specifies n = 2,
# move(2, ...) is called, which calls move(1, ...), which then calls move(0, ...) and so on

def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# check:
todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo == ['coffee with Tom']
# => true
p done == ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
# => true

# Further Exploration:
# if the size of the from_array is smaller than n, then nil is going
#   to be pushed to the to_array b/c there is nothing left in the from_array
#   to push to the to_array

# example:
todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

# the following move method call with n = 4 should result in:
#todo = []
#done = ['apply sunscreen', 'go to the beach', 'study', 'walk the dog', 'coffee with Tom', nil]
move(4, todo, done)
