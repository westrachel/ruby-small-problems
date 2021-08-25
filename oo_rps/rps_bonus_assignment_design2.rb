# Bonus Features RPS Design 2
# Problem: Adapt design 1 (prior to including computer personalities into design 1)
#   to create a class for each move (rock, paper, scissors, spock, lizard)

# What Changes & the Corresponding Implications:
# i. extra conditional logic is needed to align the user's inputted
#     choice (a string) w/ the corresponding class object
# ii. logic underlying the sampling of the computer's choice changes
#    as can no longer pull from an array of strings the value argument
#    to pass into the move new object creation, but rather must sample
#     from an array of new objects for each of the possible 5 move class objects
# iii. in terms of object oriented concepts, rock/scissors/paper/etc are moves
#    and follows the is-a relationship that corresponds with subclassing/class inheritance
#    from a superclass; however, given the current game set-up that adds a lot of classes and
#     each move type (rock, paper, scissors, etc) class doesn't necessarily need to be split out
#       into its own class and have the option to overwrite its inherited methods or
#         have additional unqiue behaviors built for it
# iv. now, the "move" instance variable for computer class objects and player class objects reference
#     a wide range of class object types. Previously, in design 1, all move instance variables referenced
#      Move class objects, but now they can reference Paper class objects, Rock class objects, Scissor class
#       objects, Spock class objects, and Lizard class objects. This adds additional flexibility/option for
#        depth/character to the game if I added more instance methods and/or instance variables for each respective
#        move type class. For example, for the lizard move type class I could add instance variables that
#        keep track of the attributes of the lizard object created. These instance variables could sample
#         from a data bank (array or hash) and select from a range of types of lizards with varying levels
#          of poison, different eating/attacking of prey styles, etc. These randomly sampled attributes
#          could then be integrated into each round in the display in a madlibs fashion so that there is more detail/
#          character displayed instead of the current messages: "#{human.name} chose #{human.move}" and "#{computer.name}
#           chose #{computer.move}"

class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
  
  WINNING_SCENARIOS = { 'scissors' => %w(paper lizard),
                        'paper' => %w(rock spock),
                        'rock' => %w(lizard scissors),
                        'spock' => %w(rock scissors),
                        'lizard' => %w(spock paper)}

   LOSING_SCENARIOS = { 'scissors' => %w(rock spock),
                        'paper' => %w(lizard scissors) ,
                        'rock' => %w(paper spock) ,
                        'spock' => %w(paper lizard) ,
                        'lizard' => %w(rock scissors) }

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_SCENARIOS[value].include?(other_move.value)
  end

  def <(other_move)
    LOSING_SCENARIOS[value].include?(other_move.value)
  end

  def to_s
    @value
  end
end

class Rock < Move
  attr_reader :value
  def initialize
    @value = 'rock'
  end
end

class Paper < Move
  attr_reader :value
  def initialize
    @value = 'paper'
  end
end

class Scissors < Move
  attr_reader :value
  def initialize
    @value = 'scissors'
  end
end

class Spock < Move
  attr_reader :value
  def initialize
    @value = 'spock'
  end
end

class Lizard < Move
  attr_reader :value
  def initialize
    @value = 'lizard'
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
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    case choice
      when 'rock' then self.move = Rock.new
      when 'scissors' then self.move = Scissors.new
      when 'paper' then self.move = Paper.new
      when 'lizard' then self.move = Lizard.new
      else               self.move = Spock.new
    end
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Choop', 'Yogi', 'STL'].sample
  end

  def choose
    self.move = [Paper.new, Rock.new, Scissors.new, Spock.new, Lizard.new].sample
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
    puts "Welcome to Rock, Paper, Scissors, Lizard, or Spock!"
  end

  def display_goodbye_message
    puts "The Rock, Paper, Scissors, Lizard, Spock winner is:"
    if human.win_count > computer.win_count
      puts " #{human.name}"
    elsif computer.win_count > human.win_count
      puts " #{computer.name}"
    else
      puts ""
    end
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
    puts " > #{human.name} chose #{human.move}."
    puts " > #{computer.name} chose #{computer.move}."
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
