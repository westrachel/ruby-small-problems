require 'pry'
require 'pry-byebug'
# use next command to step through code

def fizzbuzz(arr)
  arr.map do |num|
    binding.pry
    if num % 5 == 0 && num % 3 == 0
      'Fizzbuzz'
    elsif num % 5 == 0
      'Buzz'
    elsif num == 3
      'Fizz'
    else
      num
    end
  end
end

# test case: following should return true --
p fizzbuzz([1, 3, 5, 6, 7, 8, 10, 3, 15, 9]) == [1, 'Fizz', 'Buzz', 'Fizz', 7, 8, 'Buzz', 'Fizz', 'FizzBuzz', 'Fizz']