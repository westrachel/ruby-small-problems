# Problem:
# establish a a method that outputs/returns the last digit of the nth
#   fibonacci number

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

def fibonacci_last_digit(n)
  str = fibonacci(n).to_s
  str[(str.size - 1)].to_i
end

# check work
p fibonacci_last_digit(15) == 0   # 15th number in Fibonacci seq = 610
# => true
p fibonacci_last_digit(20) == 5   # 20th number in Fibonacci seq = 6765
# => true
p fibonacci_last_digit(100) == 5        # 100th number in Fibonacci seq = 354224848179261915075
# => true
p fibonacci_last_digit(100_001) == 1
# => true

# Further Exploration:
# write a method that calculates the last digit of the nth fibonacci number
#    that can handle extremelty large values of n

# Example:
# > method should be able to hand calculating the last digit of the
#     123,456,789,987,745th Fibonacci number = 5

# The last digits of the fibonacci sequence should ultimately repeat
#   specifically, the last digits repeat every 60 numbers
FIRST_60_FIBONACCI_NUMS = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597,
                           2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418,
                           317811, 514229, 832040, 1346269, 2178309, 3524578,5702887, 9227465,
                           14930352, 24157817, 39088169, 63245986, 102334155, 165580141, 267914296,
                           433494437, 701408733, 1134903170, 1836311903, 2971215073, 4807526976,
                           7778742049, 1258626269025]

LAST_DIGITS_OF_FIRST_60_FIBS = FIRST_60_FIBONACCI_NUMS.each_with_object([]) do |num, new_arr|
  new_arr << num.to_s.chars.last.to_i
end

# subtract 1 from the remainder before looking up the index that corresponds with that value
#   in the last_digits_of_first_60_fibs (since indices of arrays start at 0 and not 1)
#  <=> since last digits repeat can store all possible digits in an array and simply look up
#    the relevant digit 
def fib_last_digit(n)
  remainder = n % 60
  LAST_DIGITS_OF_FIRST_60_FIBS[(remainder - 1)]
end

# check work <=> fib_last_digit should be able to handle extremely large numbers quickly:
p fib_last_digit(123456789) == 4
# => true
p fib_last_digit(123456789987745) == 5
# => true
