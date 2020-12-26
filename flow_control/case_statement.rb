a = 5


#only need to specify the variable for testing, a, once as the argument to case
case a 
when 5
  puts "a is 5"
when 6 
  puts "a is 6"
else 
  puts "a is neither 5, nor 6"
end

#save the case statement result into a varaible
c = 10
answer = case c
  when 8
    "c is 8"
  when 9
    "c is 9"
  else 
    "c is neither 5, nor 6"
  end
  
puts answer

#no argument case statement

l = 30 
case 
when l == 30 
  puts "l is 30"
when l = 31 
  puts "l is 31"
else 
  puts "l is neither 30, nor 31"
end 