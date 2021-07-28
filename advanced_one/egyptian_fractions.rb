# Problem:
# 1. Create a method that accepts a rational number argument and returns an array
#        of the denominators in the egyptian fraction representation of the number
# 2. Create a method that accepts an array of numbers and returns the rational number

# Rational Number: any number that can be shown as a fraction
# Unit Fraction: fraction w/ the numerator = 1
# Egyptian fraction: sum of a series of unique unit fractions 
#   ex: 1/2 + 1/3 + 1/13 + 1/15

# Every positive fraction can be written as an egyptian fraction 
# ex: 2 = 1/1 + 1/2 + 1/3 + 1/6 

# Data structure for the first method:
# > input: rational number
# > output: array of integers, where each integer represents a unique denominator of all the egyptian fractions that sum to the inputted
#    rational number

# Algorithm for the first method:
# > initialize a denominator variable that points to 1
# > initialize an empty array called denoms
# > initialize a sum variable that points to 0.0 that will keep track of the running total summation of all the eqyptian fractions
# > start a loop
# > during each iteration check if (1.0/the integer that the denominator variable points to) added to the integer that sum points to results in a value <= the Rational number argument
#     > if it is, then push the integer that the denominator variable points to to the denoms array and
#            add the eqyptian fraction to integer that the sum variable points to
#     > if it's not, then add 1 to the integer that the denominator variable points to
#     > break if all the eqyptian fractions that are represented by in the denoms array sum exactly to the rational number argument (checking condition is whether
#           or not the fraction that the sum variable points to is equivalent to the rational number argument)
# > return the denoms array

# Code:
def egyptian(rat_num)
  denominator = 1
  denoms = []
  sum = 0.0
  loop do
    if rat_num >= ((1.0/denominator.to_f) + sum)
      denoms << denominator
      sum += (1.0/denominator.to_f)
    end
    denominator += 1
    break if sum == rat_num
  end
  denoms
end

# Examples for the first method:
p egyptian(Rational(2, 1)) == [1, 2, 3, 6]
# => true
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
# => true
p egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
# => true


# Data structure for the second method:
# input: array of unique integers where each integer represents the denominator of an egyptian fraction
# output: the rational number that represents the sum of all the egyptian fractions that are represented by the argument array of integers

# Algorithm for the second method:
# > transform each unique integer of the array argument into an egyptian fraction by creating a rational number
#       with each integer as the denominator and 1 always as the numerator  (can do this w/ a map method invocation)
# > sum the egyptian fractions created in step 1

# Code:
def unegyptian(arr)
  arr.map do |num|
    Rational(1, num)
  end.sum
end

# check work:
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# => true
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# => true
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# => true
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# => true
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# => true
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
# => true
