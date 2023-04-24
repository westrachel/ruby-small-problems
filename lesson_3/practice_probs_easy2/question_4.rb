advice = "Few things in life are as important as house training your pet dinosaur."

# does "Dino" appear in the string above

puts advice.include?("Dino") # => false 
puts advice.include?("dino") # => true 
# note on the above: case matters, also I'm assuming that it's okay that dino can match part of word in the given string

# alternative solution 
puts advice.match?("Dino") # => false
puts advice.include?("dino") # => true
