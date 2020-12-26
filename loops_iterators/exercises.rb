#Exercise 1:
x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1 
end 

puts x

#each returns the array, so this should just return x = [1, 2, 3, 4, 5]
# the each method doesn't permanently change x (I don't think) 
# ran it and puts x does print the original elements in the x array

#Exercise 2:
#create while loop only broken if enter STOP
x = "stop"
while x != "STOP"
  puts "Enter anything to roll the die or enter exit or stop to stop"
  y = gets.chomp 
  if y == 'exit'
    x = x.upcase 
  elsif y == 'stop'
    x = x.upcase
  else 
    puts "You rolled: #{rand(6)}"
  end
end 
  
#Exercise 3:
#write a method that counts down to zero using recursion 
puts "The countdown begins:"
def countdown(num)
  if num == 0
    puts "Blastoff!"
  elsif num < 0 
    num = num * -1 
    puts "You've already taken off! It's been #{num} seconds since blastoff."
  else 
    puts num 
    countdown(num - 1)
  end
end

countdown(5)
countdown(-3)
countdown(0)


  
