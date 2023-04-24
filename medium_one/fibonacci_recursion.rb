# Problem:
# write a method that calculates the nth fibonacci number

# fibonacci sequence:
# 1 1 2 3 5 8 13 21 34 55 89 144

# examples:
# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2 = 1 + 1
# fibonacci(4) == 3 = 2 + 1
# fibonacci(5) == 5 = 3 + 2
# fibonacci(12) == 144
# fibonacci(20) == 6765

def fibonacci(n)
  if n <= 2
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

# check work:
p fibonacci(1) == 1
# => true
p fibonacci(2) == 1
# => true
p fibonacci(3) == 2
# => true
p fibonacci(4) == 3
# => true
p fibonacci(5) == 5
# => true
p fibonacci(12) == 144
# => true
p fibonacci(20) == 6765
# => true

# code explanation to flesh out recursion:
# When n = 3, the first branch of the if statement in the method does not get evaluated
#     > the else statement tries to calculate fibonacci(3 - 1) + fibonacci(3 - 2) = fibonacci(2) + fibonacci(1)
#     > the fibonacci sequence traces back to fibonacci(1), which evaluates as 1
#     > after returning fibonacci(1) = 1, the method calls fibonacci(2), which also evaluates as 1
# Not that there are values for fibonacci(1) and fibonacci(2), fibonacci(3) can be calculated
#    fibonacci(3) = fibonacci(2) + fibonacci(1) = 1 + 1 = 2

# Further exploration:
# Are there any weaknesses of your defined method?
#     > my method wouldn't be considered tail recursion, which means if larger n's are inputted, like 230, it takes a long time to calculate
#           and I'm not 100% sure about the tipping point, but likely the method can't support extremely large n values
#     > my method doesn't validate inputs; if negative numbers or zero are inputted my method will return 1 no matter what
#          but that's not necessarily accurate of what the actual fibonacci sequence is (there are are 2 ones in the sequence and those
#           correspond with the first two numbers in the sequence, so from my point of view only F(1) and F(2) should evaluate
#            as 1)
#             <=> I could change this and set other conditions, so that F(x) where x <= 0 doesn't evaluate to 1