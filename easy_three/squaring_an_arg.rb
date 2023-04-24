def multiply(arg1, arg2)
  arg1 * arg2 
end 

def square(number)
  multiply(number, number)
end

# check solution:
puts square(5) == 25
puts square(-8) == 64

# Further exploration:
# generalize this method to a "power to the n" type method, cubed, 4th power 
# how do we do that, while still using multiply mehtod?
# the following should work for even powers only
# the following definition is the most efficient way to write a method that powers to the n 
# but it does fulfill the request of using the multiply method to power to whatever "n" specified 
def multipower(number, power)
  x = 1 
  if power.odd?
    power.times { x *= multiply(number, number) }
    power.times { x /= number }
  else 
    power /= 2
    power.times { x *= multiply(number, number) }
  end
  puts x
end

# check multipower:
multipower(2, 2) # should print 4
multipower(2, 4) # should print 16
multipower(7, 6) # should print 117649
multipower(3, 3) # should print 27
multipower(3, 5) # should print 243


# odd power logic think through for multipower definition
# (n * n)(n * n)(n * n) #power of 3 => power of 6 => to get back to power of 3 divide by n 3 times
# (n * n)(n * n)(n * n)(n * n)(n * n) # power of 5 => power of 10 => to get back to power of 5 divdie by n r times