# edit loop to print true if user enters 4 and incorrect; try again! if a wrong answer = entered
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer.to_s.downcase == "four" || answer.to_i == 4
    # added .to_s to the left operand so that code doesn't return undefined method on an integer
    puts "Correct!"
    break
  else 
    puts "Incorrect. Try again!"
  end
end

