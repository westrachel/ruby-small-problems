# add exit control to loop if "yes/Yes/y/Y are entered"
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer.downcase == 'yes' || answer.downcase == 'y'
end
