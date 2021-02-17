
require 'pry'

def my_method(num)
  a = 1
  binding.pry
  b = 2
end

c = 3

my_method(c)

# pry's scope:
# pry(main)> a
# => 1
# pry(main)> b
# => nil         # pry recognizes that the variable b exists, but can't see what the variable assignment is
# pry(main)> c
# => NameError: undefined local variable or method 'c' for main:Object
