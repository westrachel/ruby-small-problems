# Problem:
# rewrite the recusive fibonacci method (that calculates the nth value of the
#     fibonacci sequence using recursion) w/o using recursion

# Examples:
# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501

# think through how to create the fibonacci sequence through pushing summations elements to an array:
# arr = [1, 1]
# arr << (arr[0] + arr[1])
# => arr = [1, 1, 2]
# arr.last = 2
# arr << (arr[1] + arr[2])
# => arr = [1, 1, 2, 3]
# arr.last = 3
# arr << (arr[2] + arr[3])
# => arr = [1, 1, 2, 3, 5]
# arr.last = 5

def fibonacci(n)
  return 1 if n <= 2
  arr = [1, 1]
  index = 0
  until arr.size == n
    arr << (arr[index] + arr[index + 1])
    index += 1
  end
  arr.last
end

# check work:
p fibonacci(20) == 6765
# => true
p fibonacci(100) == 354224848179261915075
# => true
p fibonacci(1_001)
# => 70330367711422815821835254877183549770181269836358732742604905087154537118196933579742249494562611733487750449241765991088186363265450223647106012053374121273867339111198139373125598767690091902245245323403501
