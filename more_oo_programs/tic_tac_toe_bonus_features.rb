# Bonus Features to Build in:
# i. Alter the message showing remaining square positions available, so that
#    "or" is set as the default delimeter between the last 2 available
#     positions (if 2 or more are available) with the option to change to a
#     different string and with another optional parameter to replace comma
#     separaters with semicolons
# ii. Keep score of how many times each player wins; end the game if a player
#     wins 5 times
#       > can add a new instance variable, score, with 2 key value pairs, with
#         each key representing the 2 different markers of the players in the
#         game and the values representing the number of times that player has
#         won (increment the key's value if there is a win)
#       > add a method to check for 5 wins by checking the key values
# iii. Update the computer's selection process to be defensive minded, so that
#      if there are 2 squares in a winning sequence marked by the computer's
#      opponent, then the computer will pick the 3rd square (if it's open) in
#      that sequence to keep their opponent player from winning
#         > define a board class method that checks for a certain player being
#           1 away from winning and returns a boolean
#         > alter the computer's move to include conditional logic that makes a
#           defensive play if there is an immediate threat (pass human.marker as
#           an argument into the method defined to check for 1 away from winning
#           to check for an immediate threat to the computer) or chooses
#           randomly from unmarked squares
#         > define another submethod that returns the square position of where
#           the computer needs to play if there is an immediate threat
# iv. Update the computer's selection process to be offensive minded as well, so
#     that if there are 2 squares in a winning sequence of squares already
#     marked by the computer, and the 3rd square of the sequence is open, the
#     computer will pick the 3rd square in that sequence to win instead of a
#     random square or instead of playing defense
#       > update the conditional logic in the computer's move method to look for
#         an immediate win opportunity first, then second look for an immediate
#         threat, and then lastly plays a random square
#       > pass computer.marker as an argument to the one_away_from_winning?()
#         method previously defined to achieve the iii. bonus feature
#       > mark the board with the computer's marker at the position of the board
#         where there is an immediate win opportunity (so pass the computer's
#         marker into the one_away_from_winning?() method previously defined
# v. Update the computer's selection process to pick the middle square
#    (the fifth square) if there is no immediate win opportunity nor an
#    immediate threat
# vi. Change the game flow to randomly select the computer or the human player
#     to choose who gets to move first
#       > remove the FIRST_MOVER constant, and establish a new TTTGame instance
#         variable that has an equal chance of selecting between the human and
#         the computer
#       > define another TTTGame class instance method that checks if the human
#         marker was selected to pick the first mover and if so, then allows the
#         user to enter the first mover through a looping construct; if the
#         computer gets to choose the first marker, then arbitrarily reassign
#         the current_marker instance variable to the return value from sampling
#         from an array where the computer marker is included more times than
#         the human marker
#       > to ensure method isn't too long, can create methods for the different
#         player selection processes
#           > add the first_mover_selection method to the play TTTGame instance
#             method not the main_game instance method, b/c only want to select
#             a first mover once
#           > change the display_board method invocation in main_game, so that
#             the board is displayed initially only if the human player ends up
#             getting selected first (so that the board is displayed for their
#             selection; don't want to display the board if the computer goes
#             first, as that would lead to unecessary duplicate displays and
#             would not display as well if the computer goes first and the
#             computer was one to select as would have to scroll up to see the
#             messages showing that the. computer went first)
#          > will need to keep track of which marker was selected as the
#            first_mover and update the board reset instance method to
#            reassign the current_mover to the first_mover (choosing to keep
#            the same first_mover for each subsequent game after the first
#            game)
# vii. Create names for the player and computer
#       > will randomly sample names for the computer while allowing the human
#         player to choose their name
#       > need to update Player class to add a @name instance variable upon
#         instantiation
#       > for the human, need to add an instance method to the TTTGame class to
#         let the human reassign their name
#          > will need to add getter/setter methods to allow for reassignment of
#            the player's name and to display the player's name in the various
#            messages that are displayed in different instance methods invoked
#            after invoking the TTTGame#play method invocation
#          > will need to change how the @score instance variable gets
#            instantiated and then updated to include the human.name, b/c the
#            human's name won't be selected until after instantiation and the
#            default human.name == "", and I don't want the key corresponding
#            with the human's number of wins value to be ""
# viii. Allow the player to pick any marker
#       > create 2 new instance methods for the TTTGame:
#           i. one wil let the human player pick between X and O
#           ii. the second will assign the computer player to the other marker
#       > will need to add a setter method for the marker instance variable of
#         the player class, since the state of this variable is not static
#         anymore
#       > removing the HUMAN_MARKER and COMPUTER_MARKER constants, since
#         marker assignments are no longer constant; this means will need to
#         replace all instances of these constants w/ the human.marker and
#         computer.marker getter method invocations
require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if identical_markers?(squares, 3)
        return squares.first.marker
      end
    end
    nil
  end

  def one_away_from_winning?(player_marker)
    WINNING_LINES.each do |line|
      sqs = @squares.values_at(*line)
      if identical_markers?(sqs, 2) && sqs.map(&:marker).count(" ") == 1
        if sqs.select { |sq| sq.marker != " " }.first.marker == player_marker
          return true
        end
      end
    end
    nil
  end

  def winning_square_for(player_marker)
    squares_for_a_win = WINNING_LINES.map do |line|
      squares = @squares.values_at(*line)
      sqs_markers = squares.map(&:marker)
      if sqs_markers.count(player_marker) == 2 && sqs_markers.count(" ") == 1
        line[sqs_markers.find_index(" ")]
      end
    end
    squares_for_a_win.select { |nil_or_sq_position| nil_or_sq_position }.sample
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def identical_markers?(squares, number_of_identical_markers)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != number_of_identical_markers
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :name, :marker

  def initialize(marker="", name="")
    @marker = marker
    @name = name
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new("", ["Yoda", "R2D2", "Snape", "Spock"].sample)
    @player_that_chooses_first_mover = [@human, @computer].sample
    @first_mover = ""
    @current_marker = ""
    # not adding human key to score since human.name is currently empty
    @score = { computer.name => 0 }
  end

  def play
    clear
    display_welcome_message
    human_selects_name
    human_selects_marker
    assign_computer_marker
    first_mover_selection
    main_game
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def human_selects_name
    puts "What is your name?"
    human.name = gets.chomp
    # update score to include human.name
    @score[human.name] = 0
  end

  def human_selects_marker
    puts "Choose your marker: X or O"
    selection = nil
    loop do
      selection = gets.chomp
      break if ["X", "O"].include?(selection)
      puts "Sorry, that's not a valid choice"
    end
    human.marker = selection
  end

  def assign_computer_marker
    computer.marker = case human.marker
                      when "X" then "O"
                      else          "X"
                      end
  end

  def display_goodbye_message
    display_overall_winner
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def human_chooses_first_mover
    puts "Enter y to move first, otherwise enter n"
    ans = nil
    loop do
      ans = gets.chomp.downcase
      break if ["y", "n"].include?(ans)
      puts "Sorry, that's not a valid choice."
    end
    @current_marker = (ans == "y" ? human.marker : computer.marker)
    @first_mover = @current_marker
  end

  def computer_chooses_first_mover
    puts "#{computer.name} was chosen to pick the first mover!"
    @current_marker = [human, computer, computer, computer].sample.marker
    if @current_marker == human.marker
      puts " => #{computer.name} chose you to pick first"
    else
      puts " => #{computer.name} chose to pick first"
    end
  end

  def first_mover_selection
    case @player_that_chooses_first_mover
    when @human then human_chooses_first_mover
    else             computer_chooses_first_mover
    end
  end

  def joinor(arr, sep=', ', word_sep=" or ")
    most_nums_left = arr[0, (arr.size - 1)]
    # choosing to return an empty string if there are no numbers left
    last_num = arr[arr.size - 1].to_s
    arr.size >= 2 ? most_nums_left.join(sep) + word_sep + last_num : last_num
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def main_game
    loop do
      display_board if @current_marker == human.marker
      player_move
      update_score
      display_result
      break if five_wins? # enforcing 5 wins guarantees overall winner
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    puts "Markers:"
    puts " => #{human.name} is #{human.marker}"
    puts " => #{computer.name} is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def player_close_to_winning
    player = nil
    [computer.marker, human.marker].each do |marker|
      player = marker if board.one_away_from_winning?(marker)
    end
    player
  end

  def computer_moves
    position = if player_close_to_winning
                 board.winning_square_for(player_close_to_winning)
               elsif board.unmarked_keys.include?(5)
                 5
               else
                 board.unmarked_keys.sample
               end
    board[position] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker then puts "You won!"
    when computer.marker then puts "#{computer.name} won!"
    else                      puts "It's a tie!"
    end
    puts "The overall score is:"
    current_score
  end

  def current_score
    puts "  => #{human.name}: #{@score[human.name]}"
    puts "  => #{computer.name}: #{@score[computer.name]}"
  end

  def update_score
    case board.winning_marker
    when human.marker
      @score[human.name] += 1
    when computer.marker
      @score[computer.name] += 1
    end
  end

  def five_wins?
    @score.values.include?(5)
  end

  def overall_winner
    if @score[human.name] > @score[computer.name]
      human.name
    elsif @score[human.name] < @score[computer.name]
      computer.name
    end
  end

  def display_overall_winner
    case overall_winner
    when human.name then puts "You are the ultimate winner!"
    when computer.name then puts "#{computer.name} is the ultimate winner!"
    else                    puts "You and #{computer.name} tied!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = @first_mover
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
