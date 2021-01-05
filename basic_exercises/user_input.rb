#1. Repeat after me
#write a program that asks for user to type something
# and have the program display what was entered
puts "Enter something!"
input = gets.chomp
puts input

#2. Your Age in Months
#write a program that asks the user for their age in 
# years and then converts that age to mnths 
puts "What's your age in years?"
age_in_years = gets.chomp.to_i
age_in_months = age_in_years * 12
puts "You are #{age_in_months} months old."

#3. Print Something (Part 1)
#write a program that asks if the user
# wants to print something 
#print something if some form of yes is entered
#otherwise print nothing 
puts "Do you want me to print something?"
response = gets.chomp
if (response == 'y' || response == 'Y' ||  response == 'yes' || response == 'YES' || response == 'Yes')
  puts "something"
end 

#4. Print Something (Part 2)
#Modify your program so it prints an error message for any inputs that aren't y or n, and then asks you to try again.
#Keep asking for a response until you receive a valid y or n response. 
#In addition, your program should allow both Y and N (uppercase) responses;
#case sensitive input is generally a poor user interface choice. 
#Whenever possible, accept both uppercase and lowercase inputs.

puts "Do you want me to print something? (y/n)"
ans = gets.chomp 
loop do 
if (ans == 'Y' || ans == 'y')
  puts "something"
  break
elsif (ans == 'n' || ans == 'N')
  break
else 
  puts "Invalid input! Please enter y or n"
  ans = gets.chomp
end 
end 

#alternative solution:
choice = nil
loop do 
  puts 'Do you want me to print something? (y/n) '
  choice = gets.chomp.downcase
  break if %w(y n).include?(choice)    # %w(element1 element2) denotes an array of strings; element1 and element2 are the strings in the array 
  puts 'Invalid input! Please enter y or n'
end
puts 'something' if choice == 'y'

#5. Launch School Printer (Part 1)
#write a program that prints launch school is great
# until a certain number of lines have been printed
# the number of times should be specified by the user and should
# insit that at least 3 lines are printed 
# don't worry about edge cases when it comes to acceptable 
# user inputted numbers for now
puts "How many output lines do you want? Enter a number >= 3?"
num = gets.chomp.to_i 
while num <= 3
    puts "Error. Enter a number >= 3."
    num = gets.chomp.to_i
end
num.times {puts "Launch school is great." }




#6. Passwords
#bad password exercise <=> ie you would not store an actual password as clear tet 
# you'd store it in encrypted form 
#write a program that displays a welcome message
# after the user enters the correct password
# where the password is a string that's defined 
# as a constant in your pogram 
lame_pw = 1234
puts "Please enter your password:"
input_pw = gets.chomp.to_i
while input_pw != lame_pw 
  puts "Invalid password"
  puts "Please enter your password:"
  input_pw = gets.chomp.to_i
  break if input_pw == lame_pw
end 
puts "You're in. Welcome!"

#7. Username & Password
# require inputting correct username and pw 
# username should also be specified as a constant
# if either username or pw is incorrect have them retype both 
# and don't say which is incorrect or if both are incorrect
username = 'Bob'
lame_pw = 1234
puts "Please enter your username:"
user_input = gets.chomp
puts "Please enter your password:"
pw_input = gets.chomp.to_i

while (pw_input != lame_pw || user_input != username )
  puts "Authorization failed."
  puts "Please enter your username:"
  user_input = gets.chomp
  puts "Please enter your password:"
  pw_input = gets.chomp.to_i
end 
puts "You're in. Welcome!"

#alternate loop solution; specify user_input & pw_input fewer times
loop do 
  puts 'Enter your username:'
  user_input = gets.chomp 
  
  puts 'Enter your password:'
  pw_input = gets.chomp.to_i
  
  break if (username == user_input && lame_pw == pw_input)
  puts 'Authorization failed.'
end
puts 'You are in. Welcome!'

#8. Dividing Numbers
# divide the 2 integers the user gives you 
# valide the integers w/ the following
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end
# the above defined method returns true if 
# the input string can be converted to an Integer and back to a string
# without loss of info 
# and returns false otherwise

loop do 
  puts "Please enter the numerator:"
  numerator = gets.chomp
  
  puts "Please enter the denominator:"
  denominator = gets.chomp
  
  until valid_number?(numerator) && valid_number?(denominator) && denominator.to_i != 0 
    if valid_number?(numerator) == false
      puts "Invalid input. Integers only are allowed."
      puts "Please enter the numerator:"
      numerator = gets.chomp
    elsif valid_number?(denominator) == false
      puts "Invalid input. Integers only are allowed."
      puts "Please enter the denominator:"
      denominator = gets.chomp
    elsif denominator.to_i == 0 
      puts "Invalid input. A denominator of 0 is not allowed."
      puts "Please enter the denominator:"
      denominator = gets.chomp
    else 
    end
  end 

  
  ans = numerator.to_i / denominator.to_i
  puts "#{numerator} / #{denominator} is #{ans}" 
  break 
end 

#alternative solution: break out input asks into separate loops 
num = nil 
loop do 
  puts 'Please enter the numerator:'
  num = gets.chomp 
  
  break if valid_number?(num)
  puts 'Invalid input. Only integers are allowed.'
end 

denom = nil 
loop do 
  puts 'Please enter the denominator.'
  denom = gets.chomp 
  
  if denom == '0' #note the alternative way to check for 0 denominators; don't need to necessarily convert to integer 
    puts 'Invalid input. A denom of 0 is not allowed'
  else 
    break if valid_number?(denom)
    puts 'Invalid input. Only integers are allowed.'
  end 
end 

quotient = num.to_i / denom.to_i
puts "#{num} / #{denom} is #{quotient}"
 
#9 Launch School Printer (Part 2)
#modify the program, so that it repeats itself after each input/print iteration
# asking for a new number of times to print
# the program should keep running until the user enters q or Q
number_of_lines = nil
loop do
  puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit):'
  number_of_lines = gets.chomp
  if number_of_lines.to_i >= 3
    number_of_lines.to_i.times { puts 'Launch School is the best!' }
  elsif number_of_lines == 'Q' || number_of_lines.upcase == 'Q'    #allows user to enter q & quit 
    break 
  else 
    puts ">> That's not enough lines."
  end 
end


#10 Opposites Attract
#write a program that asks for 2 integers from the user, adds them and displays result
# require one positive number and one negative number input, but the order in which the 
# two integers are entered does not matter
# start completey over if the requirement is not met 
# following defined method validates that integers are inputted
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do 
    puts "Please enter a positive or negative integer:"
    integer1 = gets.chomp 
    puts "Please enter another positive or negative integer"
    integer2 = gets.chomp 
    
    if valid_number?(integer1) == false || valid_number?(integer2) == false
      puts "Invalid input. Only non-zero integers are allowed"
    elsif ((integer1.to_i > 0 && integer2.to_i > 0) || (integer1.to_i < 0 && integer2.to_i < 0))
      puts "Sorry, one integer must be positive, and one must be negative."
    else 
    end 
    
    answer = integer1.to_i + integer2.to_i
    break puts "#{integer1} + #{integer2} = #{answer}" if 
      valid_number?(integer1) && valid_number?(integer2) && ((integer1.to_i < 0 && integer2.to_i > 0) || (integer2.to_i < 0 && integer1.to_i > 0))
  
end 
  
