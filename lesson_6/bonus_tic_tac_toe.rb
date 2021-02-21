require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # row winning lines
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # column winning lines
                [[1, 5, 9], [3, 5, 7]]              # diagonal winning lines

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  #system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
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
    prompt "Choose a square: #{joinor(empty_squares(brd), ', ', 'or ')}"
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
  relevant_line = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  defense_position_arr = relevant_line.flatten.select do |key|
    brd[key] == INITIAL_MARKER
  end
  defense_position_arr[0] # based on the filtering, defense_position_arr will contain 1 element at most
  # specifically, the element will be the key associated w/ the position the computer should play
  # to play strong defense and prevent the player from easily getting 3 in a row
  # or it will return nil if relevant_line.flatten returns an empty array
end

def computer_places_piece!(brd)
  if comps_defense_position(brd).nil?
    square = empty_squares(brd).sample
  else
    square = comps_defense_position(brd)
  end
  brd[square] = COMPUTER_MARKER
end

num_player_wins = 0
num_computer_wins = 0

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    
    # binding.pry

    computer_places_piece!(board)
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
