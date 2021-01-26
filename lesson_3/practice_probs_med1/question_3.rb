def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

puts factors(5)
puts factors(0) # will return an empty factors array
puts factors(-1) # will return an empty factors array


# bonus 1:
# purpose of number % divisor == 0 is to make sure that ony numbers that 
# factor into the specified number argument passed into the defined method
# are pushed into the factors array 
# since number and divisor have been specified to be positive, this expression:
# number % divisor == 0 checks that the remainder is 0

# bonus 2:
# the purpose of line 8, factors, is so that the returned value when this defined method
# is called is the array of factors
