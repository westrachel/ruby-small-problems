VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_ABBREVIATED = %w(r p s l sp)

def prompt(message)
  puts "=> #{message}"
end

winning_cases = { scissors: %w(paper lizard),
                  paper: %w(rock spock),
                  rock: %w(lizard scissors),
                  spock: %w(rock scissors),
                  lizard: %w(spock paper) }

valid_choice_conversion = { s: "scissors",
                            p: "paper",
                            r: "rock",
                            l: "lizard",
                            sp: "spock" }

def display_results(player, computer, winning_cases)
  if winning_cases[player.to_sym].include?(computer)
    "You won!"
  elsif winning_cases[computer.to_sym].include?(player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

player_total_wins = 0
computer_total_wins = 0

loop do
  player = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
    prompt("Acceptable inputs include the full name (i.e. 'rock' for 'rock')
    or the first letter(s) (i.e. 's' for scissors & 'sp' for 'sp')")
    player = gets.chomp

    if VALID_CHOICES.include?(player)
      break
    elsif VALID_CHOICES_ABBREVIATED.include?(player.downcase)
      player = valid_choice_conversion[player.downcase.to_sym]
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = VALID_CHOICES.sample

  puts "You chose: #{player}; Computer chose: #{computer}."

  prompt(display_results(player, computer, winning_cases))

  if display_results(player, computer, winning_cases) == "Computer won!"
    computer_total_wins += 1
  elsif display_results(player, computer, winning_cases) == "You won!"
    player_total_wins += 1
  end

  prompt("The current score is")
  prompt("Computer: #{computer_total_wins}, You: #{player_total_wins}.")
  break if computer_total_wins == 5 || player_total_wins == 5

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Game over!")
prompt("Final score:")
prompt("Computer: #{computer_total_wins}, You: #{player_total_wins}.")

if computer_total_wins == 5
  prompt("Computer was the grand winner!")
elsif player_total_wins == 5
  prompt("You were the grand winner!")
else
  prompt("You exited early! There was no grand winner.")
end

prompt("Thank you for playing! Goodybe.")
