# Bonus Features to Build into RPS:
# 1. Score tracking - build in a way to track the game score
#  (unless the user quits playing first; first player to 10 wins)
#    > score seems like an attribute or state of the RPSGame class
#    > a score for 2 players is based on each player's number of wins,
#       so can initialize a win_count instance variable for each player
#       object that starts at zero
#    > establish getter & setter methods for the @win_count instance variable
#    > add instance methods to the RPSGame class to update the
#        player's scores and to display the score

# 2. Keep a log of moves made by both the human and computer
#     > establish a tracker instance variable that stores qualities
#        of the state of the RPSGame class
#     > the tracker instance variable could be a hash
#          > each key in the hash is a number (corresponding with the round)
#          > each value is an array of hashes
#               > each sub-hash has a:
#                   > key that references the player's name
#                   > each value references the player's move during the round

class Move
  VALUES = ['rock', 'paper', 'scissors']

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :win_count

  def initialize
    set_name
    @win_count = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Choop', 'Yogi', 'STL'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer, :moves_log

  def initialize
    @human = Human.new
    @computer = Computer.new
    @round_number = 1
    @moves_log = {}
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing! Good bye!"
  end

  def track_moves
    players = [human, computer]
    round_moves = {}
    players.each do |player|
      round_moves[player.name] = player.move
    end
    @moves_log[@round_number] = round_moves
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_entire_move_history
    @moves_log.each do |round_number, subhash|
      puts "During round ##{round_number}:"
      subhash.each do |player_name, move|
        puts "  - #{player_name} chose #{move.value}"
      end
      puts ""
    end
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_player_scores
    if human.move > computer.move
      human.win_count += 1
    elsif human.move < computer.move
      computer.win_count += 1
    end
  end

  def display_player_scores
    puts "The score is:"
    puts "  > #{human.name}: #{human.win_count}"
    puts "  > #{computer.name}: #{computer.win_count}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must by y or n."
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      track_moves
      display_moves
      @round_number += 1
      display_winner
      update_player_scores
      display_player_scores
      break if human.win_count == 10 || computer.win_count == 10
      break unless play_again?
    end

    display_entire_move_history
    display_goodbye_message
  end
end

RPSGame.new.play
