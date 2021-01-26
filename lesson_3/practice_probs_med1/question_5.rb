#limit = 15

#def fib(first_num, second_num)
#  while first_num + second_num < limit
#    sum = first_num + second_num
#    first_num = second_num
#    second_num = sum
#  end
#  sum
#end

#result = fib(0, 1)
#puts "result is #{result}"

# the problem with the above code is that a defined method's scope is self-contained
# so, limit needs to be passed in as an argument for it to be accessed w/in the method definition

# solution 1:
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"