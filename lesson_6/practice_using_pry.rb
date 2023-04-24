require 'pry'

puts "Pick an option: 1 or 2"
user_input = gets.chomp
binding.pry
# Calling binding.pry will stop the program's execution and allows for the coder to examine the user_input variable
# already inputted up to the binding.pry call. Can call different methods on user_input, such as user_input.is_a?(String)
# which returns true and confirms that the logic of this code is off. Specifically, the user_input string is being compared to an 
# integer, so even if a user inputs 1, it will always output that an invalid option has been inputted
if user_input == 1
  puts "You picked option 1"
elsif user_input == 2
  puts "You picked option 2"
else
  puts "Invalid option!"
end