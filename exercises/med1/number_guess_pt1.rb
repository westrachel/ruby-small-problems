# Create an object oriented number guessing game where the user has 7
#   attempts to guess a number between 1 and 100 correctly

class GuessingGame
  attr_accessor :num_guesses_left, :guesses, :goal_number

  GAME_RANGE = 1..100
  MAXIMUM_NUMBER_OF_GUESSES = 7

  def initialize
    @num_guesses_left = MAXIMUM_NUMBER_OF_GUESSES
    @guesses = []
    @goal_number = rand(GAME_RANGE)
  end

  def guesses_remaining_msg
    case @num_guesses_left
    when 1 then "You have 1 guess remaining."
    else "You have #{num_guesses_left} guesses remaining."
    end
  end

  def prompt_guess
    puts guesses_remaining_msg
    puts "Enter a number between 1 and 100:"
  end

  def valid_guess_attempt
    choice = nil
    loop do
      choice = gets.chomp
      break if valid_guess?(choice)
      puts "Invalid guess. Enter a number between 1 and 100:"
    end
    choice.to_i
  end

  def guess_loop
    loop do
      prompt_guess
      guesses << valid_guess_attempt
      self.num_guesses_left -= 1
      break if num_guesses_left == 0 || guesses.last == goal_number
      hint
    end
  end

  def valid_guess?(num)
    num.to_i.to_s == num && (1..100).include?(num.to_i)
  end

  def hint
    if guesses.last < goal_number
      puts "Your guess is too low"
    else
      puts "Your guess is too high"
    end
    puts ""
  end

  def display_result
    if guesses.last == goal_number
      puts "That's the number!"
      puts ""
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def play
    guess_loop
    display_result
  end
end

game = GuessingGame.new
game.play
