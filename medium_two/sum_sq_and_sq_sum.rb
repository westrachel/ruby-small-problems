# Problem:
# Create a method that
#     i. calculates the sum of all positive integers from 1 to the passed in integer n
#     ii. squares the sum in part i.
#     iii. squares each positive integer from 1 to the passed in integer n
#     iv. sums each of the squares calculated in step iii.
#     v. calculates the difference between the result from step ii. and the result from step iv.

# Examples:
#sum_square_difference(3) == 22
#sum_square_difference(1) == 0

# Data:
#  > input = positive integer n (>= 1)
#  > output = integer (>= 0)

# Algorithm:
# > laid out inner calculations of the method above in writing out the problem

# Code:
def sum_square_difference(num)
  integers = (1..num).to_a
  sqed_sum = (integers.sum) ** 2
  sum_of_sqs = integers.map {|x| x**2}.sum
  sqed_sum - sum_of_sqs
end

# check work:
p sum_square_difference(3) == 22
# => true
p sum_square_difference(10) == 2640
# => true
p sum_square_difference(1) == 0
# => true
p sum_square_difference(100) == 25164150
# => true
