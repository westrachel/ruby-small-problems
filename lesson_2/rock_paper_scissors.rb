VALID_CHOICES = ["rock", "paper", "scissors"]

def test_method
  prompt('test message')
end

# test_method <=> returns undefined method 'prompt' error

def player_win_scenarios(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    "You won!"
  end
end

def player_lose_scenarios(player, computer)
  if (player == 'rock ' && computer == 'paper') ||
     (player == 'scissors' && computer == 'rock') ||
     (player == 'paper' && computer == 'scissors')
    "Computer won!"
  end
end

# break down the following method into separate methods to appease rubocop
# def display_results(player, computer)
# if (player == 'rock' && computer == 'scissors') ||
# (player == 'paper' && computer == 'rock') ||
# (player == 'scissors' && computer == 'paper')
# "You won!"
# elsif (player == 'rock ' && computer == 'paper') ||
#    (player == 'scissors' && computer == 'rock') ||
#    (player == 'paper' && computer == 'scissors')
# "Computer won!"
# else
#  "It's a tie!"
# end
# end

# program stil works if move the display_results method above the prompt method
def prompt(message)
  puts "=> #{message}"
end

# test_method # when move test_method after prompt, there's no error

loop do
  player = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player = gets.chomp

    if VALID_CHOICES.include?(player)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = ["rock", "paper", "scissors"].sample

  puts "You chose: #{player}; Computer chose: #{computer}."

  if !player_win_scenarios(player, computer).nil?
    prompt(player_win_scenarios(player, computer))
  elsif !player_lose_scenarios(player, computer).nil?
    prompt(player_lose_scenarios(player, computer))
  else
    prompt("It's a tie!")
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing! Goodybe.")
