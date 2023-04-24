require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # row winning lines
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # column winning lines
                [[1, 5, 9], [3, 5, 7]]              # diagonal winning lines

FIRST_MOVER_OPTIONS = ['Player', 'Computer', 'Choose']

def prompt(msg)
  puts "=> #{msg}"
end

def new_line_display
  puts ""
end

def correct_if_needed(choice)
  if choice != 1 && choice != 2
    prompt "Invalid selection. Random player will be selected to go first."
    choice = FIRST_MOVER_OPTIONS[0, 2].sample
  end
  choice
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  # system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "_____+_____+_____"
  puts "     |     |"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array_input, delimiter, word_delimeter)
  last_arr_item = array_input.pop
  arr_separated = array_input.join(delimiter)
  if arr_separated.empty? == false
    puts arr_separated + delimiter + word_delimeter + last_arr_item.to_s
  else
    puts last_arr_item.to_s
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square:"
    puts joinor(empty_squares(brd), ', ', 'or ').to_s
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def comps_defense_position(brd)
  threatening_line = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
      brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  defense_position_arr = threatening_line.flatten.select do |key|
    brd[key] == INITIAL_MARKER
  end
  defense_position_arr[0]
  # Based on the filtering, defense_position_arr will contain 1
  # element at most. Specifically, the element will be the key
  # associated w/ the position containing the INITIAL_MARKER
  # that the the computer should play to play strong defense
  # and prevent the player from easily getting 3 in a row
  # or it will return nil if relevant_line.flatten returns an empty array
end

def comps_offense_position(brd)
  offensive_line = WINNING_LINES.select do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
      brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  offensive_position_arr = offensive_line.flatten.select do |key|
    brd[key] == INITIAL_MARKER
  end
  offensive_position_arr[0]
end

# current order of computer's position strategy:
# play offense first, defense second,
# pick square 5 if it's available as the third strategy,
# and then pick a random empty square
def computer_places_piece!(brd)
  square = if comps_offense_position(brd)
             # next line assigns square to offense position as long
             # as comps_offense_position isn't nil
             comps_offense_position(brd)
           elsif comps_defense_position(brd)
             comps_defense_position(brd)
           elsif brd[5] == INITIAL_MARKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, curr_player)
  case curr_player
  when 'Player'
    player_places_piece!(brd)
  when 'Computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(curr_player)
  case curr_player
  when 'Player'
    curr_player = 'Computer'
    # ignored rubocop comment about the above line
    # this reassignment is useful as it reassigns
    # current_player before the loop below iterates again
    # and makes the game functional
  when 'Computer'
    curr_player = 'Player'
    # ignored rubocop comment about the above line
    # this reassignment is useful as it reassigns
    # current_player before the loop below iterates again
    # and makes the game functional
  end
end

num_player_wins = 0
num_computer_wins = 0

new_line_display
first_mover = FIRST_MOVER_OPTIONS.sample

if first_mover == 'Choose'
  prompt "Enter 1 to go first or 2 for the computer to go first."
  user_choice = gets.chomp.to_i
  first_mover = FIRST_MOVER_OPTIONS[correct_if_needed(user_choice) - 1]
  # binding.pry
end

prompt "#{first_mover} was selected to go first!"
current_player = first_mover

loop do
  board = initialize_board
  display_board(board) if current_player == 'Player'

  loop do
    place_piece!(board, current_player)
    display_board(board)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    case detect_winner(board)
    when 'Player'
      num_player_wins += 1
    when 'Computer'
      num_computer_wins += 1
    end
  else
    prompt "It's a tie!"
  end

  prompt "Current Score:"
  prompt "Player = #{num_player_wins} vs Computer = #{num_computer_wins}"

  break if num_player_wins == 5 || num_computer_wins == 5

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Final Score:"
prompt "Player = #{num_player_wins} vs Computer = #{num_computer_wins}"

prompt "Thanks for playing Tic Tac Toe. Bye for now!"
