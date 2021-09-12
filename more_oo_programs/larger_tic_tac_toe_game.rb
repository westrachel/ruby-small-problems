# Tic Tac Toe Bonus Features Expansion:
# i. Expand the game to a 5x5 board
# ii. Add another computer player
require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15],
                   [16, 17, 18, 19, 20], [21, 22, 23, 24, 25]] + # rows
                  [[1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23],
                   [4, 9, 14, 19, 24], [5, 10, 15, 20, 25]] + # cols
                  [[1, 7, 13, 19, 25], [5, 9, 13, 17, 21]] # diagonals

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
      if identical_markers?(squares, 5)
        return squares.first.marker
      end
    end
    nil
  end

  def one_away_from_winning?(player_marker)
    WINNING_LINES.each do |line|
      sqs = @squares.values_at(*line)
      if identical_markers?(sqs, 4) && sqs.map(&:marker).count(" ") == 1
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
      if sqs_markers.count(player_marker) == 4 && sqs_markers.count(" ") == 1
        line[sqs_markers.find_index(" ")]
      end
    end
    squares_for_a_win.select { |nil_or_sq_position| nil_or_sq_position }.sample
  end

  def reset
    (1..25).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |     |    |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  |  #{@squares[4]} |  #{@squares[5]}"
    puts "     |     |     |    |"
    puts "-----+-----+-----+----+-----"
    puts "     |     |     |    |"
    puts "  #{@squares[6]}  |  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]} |  #{@squares[10]}"
    puts "     |     |     |    |"
    puts "-----+-----+-----+----+-----"
    puts "     |     |     |    |"
    puts "  #{@squares[11]}  |  #{@squares[12]}  |  #{@squares[13]}  |  #{@squares[14]} |  #{@squares[15]}"
    puts "     |     |     |    |"
    puts "-----+-----+-----+----+-----"
    puts "     |     |     |    |"
    puts "  #{@squares[16]}  |  #{@squares[17]}  |  #{@squares[18]}  |  #{@squares[19]} |  #{@squares[20]}"
    puts "     |     |     |    |"
    puts "-----+-----+-----+----+-----"
    puts "     |     |     |    |"
    puts "  #{@squares[21]}  |  #{@squares[22]}  |  #{@squares[23]}  |  #{@squares[24]} |  #{@squares[25]}"
    puts "     |     |     |    |"
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
  attr_reader :board, :human, :computer1, :computer2

  def initialize
    @board = Board.new
    @human = Player.new
    @computer1 = Player.new("", ["Yoda", "R2D2", "Snape", "Spock"].sample)
    @computer2 = Player.new("", ["Kronk", "Dory", "Mushu", "Chip"].sample)
    @player_that_chooses_first_mover = [@human, @computer1, @computer2].sample
    @first_mover = ""
    @current_marker = ""
    # not adding human key to score since human.name is currently empty
    @score = { computer1.name => 0, computer2.name => 0 }
  end

  def play
    clear
    display_welcome_message
    human_selects_name
    human_selects_marker
    assign_computer_markers
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
    puts "Choose your marker: X, O, or Z"
    selection = nil
    loop do
      selection = gets.chomp
      break if ["X", "O", "Z"].include?(selection)
      puts "Sorry, that's not a valid choice"
    end
    human.marker = selection
  end

  def assign_computer_markers
    markers_left = case human.marker
                   when "X" then ["O", "Z"]
                   when "O" then ["X", "Z"]
                   else          ["X", "O"]
                   end
    shuffled_markers_left = markers_left.shuffle
    computer1.marker = shuffled_markers_left[0]
    computer2.marker = shuffled_markers_left[1]
  end

  def display_goodbye_message
    display_overall_winner
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def select_a_comp
    [computer1, computer2].sample.marker
  end

  def human_chooses_first_mover
    puts "Enter y to move first, otherwise enter n"
    ans = nil
    loop do
      ans = gets.chomp.downcase
      break if ["y", "n"].include?(ans)
      puts "Sorry, that's not a valid choice."
    end
    @current_marker = (ans == "y" ? human.marker : select_a_comp)
    @first_mover = @current_marker
  end

  def computer_chooses_first_mover
    @current_marker = [computer2, computer1, computer1].sample.marker
    if @current_marker == computer1.marker
      puts "#{computer1.name} is going first"
    else
      puts "#{computer2.name} is going first"
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

  def display_markers
    puts " => #{human.name} is #{human.marker}"
    puts " => #{computer1.name} is #{computer1.marker}"
    puts " => #{computer2.name} is #{computer2.marker}"
  end

  def display_board
    display_markers
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
    [computer1.marker, computer2.marker, human.marker].each do |marker|
      player = marker if board.one_away_from_winning?(marker)
    end
    player
  end

  def computer_moves(computer_player)
    position = if player_close_to_winning
                 board.winning_square_for(player_close_to_winning)
               elsif board.unmarked_keys.include?(13)
                 13
               else
                 board.unmarked_keys.sample
               end
    board[position] = computer_player.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer1.marker
    elsif @current_marker == computer1.marker
      computer_moves(computer1)
      @current_marker = computer2.marker
    else
      computer_moves(computer2)
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board
    round_winner = [human, computer1, computer2].select do |plyr|
      plyr.marker == board.winning_marker
    end
    round_winner.empty? ? (puts "It's a tie") : (puts "#{round_winner[0]} won!")
    puts "The overall score is:"
    current_score
  end

  def current_score
    puts "  => #{human.name}: #{@score[human.name]}"
    puts "  => #{computer1.name}: #{@score[computer1.name]}"
    puts "  => #{computer2.name}: #{@score[computer2.name]}"
  end

  def update_score
    case board.winning_marker
    when human.marker
      @score[human.name] += 1
    when computer1.marker
      @score[computer1.name] += 1
    when computer2.marker
      @score[computer2.name] += 1
    end
  end

  def five_wins?
    @score.values.include?(5)
  end

  def highest_score
    @score.values.max
  end

  def overall_winner
    winners = @score.select { |_, pts| pts == highest_score }
    winners.size == 1 ? winners.keys[0] : "tie"
  end

  def display_overall_winner
    if overall_winner != "tie"
      puts "#{overall_winner} is the ultimate winner!"
    else
      puts "There was no ultimate winner! You all tied."
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
