#Exercises 1, 3, & 4:
puts "Please enter your first name"
first_name = gets.chomp

puts "Great, now enter your last name"
last_name = gets.chomp

puts "Nice. How's it going, #{first_name} #{last_name}?"

puts "Hey look everybody! Look who is here. It's:"
10.times {puts "#{first_name} #{last_name}"}