def add_three(number)
  number + 3
end

returned_value = add_three(4)

puts returned_value

def add_four(num)
  return num + 4
  num + 5 #this line isn't executed bc used return in the prior line
end 

returned_val = add_four(4)
puts returned_val
