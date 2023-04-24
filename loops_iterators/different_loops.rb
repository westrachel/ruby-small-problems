#simple loop break:
i = 0 
loop do 
  i += 1
  puts i 
  break 
end 
  
# if statement loop break:  
loop {
  i *= 5
  p i 
  break if i > 40       #one-line if statement: expression if boolean
}

# alt if statement loop break:
i = 0  #reassign i from 125 to 0
loop do 
  i += 2
  puts i 
  if i == 10
    break 
  end 
end 

#next to skip the rest of the current iteration & proceed to the next iteration
puts "next_loop"
m = 0 
loop do 
  m += 2
  if m == 4
    next        #skips the rest of the code in this iteration, so won't print 4 
  end 
  puts m 
  if m == 10
    break 
  end 
end 

#countdown while loop:
puts "Enter a number:"
num = gets.chomp.to_i

puts "The countdown to takeoff begins:"
while num > 0   #don't want to print -1; counting down only to 0
  num -= 1
  puts num    
end 
puts "Blastoff"

#different way to execute the conditional:
puts "Enter another number"
number = gets.chomp.to_i
while number >= 0
  puts number     #if have the puts line before the subtraction/reassignment then make the boolean based on >=
  x -= 1
end
puts "Done"


