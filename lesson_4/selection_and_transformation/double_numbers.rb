# define method that mutates the inputted array
# and doubles each number w/in the passed in array

# solution 1:
def double_numbers!(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end
  numbers = doubled_numbers
  numbers
end

# check work
my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]

# alternative solution:
def double_numbers!(numbers)
  numbers = numbers.map do |num|
    num = num * 2
  end
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]


# another solution:
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2

    counter += 1
  end

  numbers # return value of method = reference to the mutated original array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]