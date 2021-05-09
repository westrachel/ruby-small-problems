def valid_integer?(string)
  string.to_i.to_s == string
end

#def guess_number(max_number, max_attempts)
#  winning_number = (1..max_number).to_a.sample
#  attempts = 0

#  loop do
#    attempts += 1
#    break if attempts > max_attempts

#    input = nil
#    until valid_integer?(input)
#      print 'Make a guess: '
#      input = gets.chomp
#    end

#    guess = input.to_i

#    if guess == winning_number
#      puts 'Yes! You win.'
#    else
#      puts 'Nope. Too small.' if guess < winning_number
#      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
#      guess_number(max_number, max_attempts)
#    end
#  end
#end

#guess_number(10, 3)
# The guess_number(10, 3) call above allowed more than 3 attempts to guess
# and in one return stated that 4 is too big but then in the subsequent return that my guess of 3 is too small, which is nonsensical.
# The code is resetting and calling guess_number again within the else branch of the ifelse statement
#   above, so that guessing could potentially go on indefinitely if the wrong number is continually guessed
#   and as long as the user doesn't exit/end the program.

# updated code to run properly:
def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0
  if max_attempts > 1
    puts "You have #{max_attempts} tries to guess a number between 1 and #{max_number}"
  else
    puts "You have 1 try to guess a number between 1 and #{max_number}"
  end

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
    break if guess == winning_number # this prevents the # of tries left line below from printing if you've already won
    puts "You have #{(max_attempts - attempts)} tries left to guess."
  end
end

guess_number(10, 3)
