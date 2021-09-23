# Update the number guessing game to:
#   i. allow a flexible range of numbers to guess between
#  ii. change the number of guesses to be flexible based on the
#        size of the range of guess

class GuessingGame
  attr_accessor :num_guesses_left, :guesses, :goal_number, :range

  def initialize(range_min=1, range_max=100)
    @num_guesses_left = Math.log2((range_min..range_max).to_a.size).to_i + 1
    @guesses = []
    @goal_number = rand(range_min..range_max)
    @range = (range_min..range_max)
  end

  def guesses_remaining_msg
    case @num_guesses_left
    when 1 then "You have 1 guess remaining."
    else "You have #{num_guesses_left} guesses remaining."
    end
  end

  def range_string
    "#{range.to_a[0]} and #{range.to_a.last}"
  end

  def prompt_guess
    puts guesses_remaining_msg
    puts "Enter a number between #{range_string}."
  end

  def valid_guess_attempt
    choice = nil
    loop do
      choice = gets.chomp
      break if valid_guess?(choice)
      puts "Invalid guess. Enter a number between #{range_string}:"
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
    num.to_i.to_s == num && (range).include?(num.to_i)
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

game = GuessingGame.new(200, 700)
game.play
