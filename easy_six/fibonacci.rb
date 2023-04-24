# Problem:
# Create a method that calculates and returns the index of the 1st Fibonacci number that
# has the number of digits specified as an argument

# first create program that prints fibonacci sequence to understand
# how to create the sequence first:
def create_fibonacci_sequence_up_to_digit_length(number)
  fib_seq_arr = []
  x = 1
  y = 1
  fib_seq_arr.push(x).push(y)
  loop do
    z = x + y
    fib_seq_arr.push(z)
    break if z.to_s.size == number
    x = y
    y = z
  end
  fib_seq_arr
end

p create_fibonacci_sequence_up_to_digit_length(2)
# => [1, 1, 2, 3, 5, 8]

def find_fibonacci_index_by_length(length)
  if length == 1
    0
  else
    create_fibonacci_sequence_up_to_digit_length(length).size
  end
end

# Check Work:
p find_fibonacci_index_by_length(2) == 7         
p find_fibonacci_index_by_length(3) == 12   
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
