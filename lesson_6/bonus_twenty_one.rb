require 'pry'

# Bonus Features:
# i. Call total method fewer times and instead assign total
#    to a variable and make sure this variable is updated
#    where necessary
#
# ii. Extract scoreboard & final card display to methods,
#     so that there is consistent output regardless if
#     someone busts or no one busts. This also avoids
#     repeating the same code to show what cards players have
#     at different points of the game.
#     Although, won't use this method to initially display the
#      Dealer's cards b/c only display the 1st Dealer card at
#      the start of the game.
#
# iii. Keep track of each player's wins. Break the game loop
#    as soon as someone reaches 5 wins. Regardless of whether
#    someone reaches 5 wins or not, display the larger game
#    scoreboard.
def prompt(msg)
  puts "=> #{msg}"
end

def list(msg)
  puts "    > #{msg}"
end

def new_line
  puts ""
end

SUITS = %w(Hearts Clubs Spades Diamonds)
POSSIBLE_CARDS = ['2', '3', '4', '5', '6', '7', '8', '9',
                  '10', 'Jack', 'Queen', 'King', 'Ace']

def card_val(hand, card_idx)
  hand[card_idx].values[0]
end

def card_suit(hand, card_idx)
  hand[card_idx].keys[0]
end

def num_of_aces(hand)
  hand.select { |hsh| hsh.values[0] == "Ace" }.size
end

# word string like "jack" converted to an integer is 0
#     <=> 'jack'.to_i = 0
# can use if statement to add relevant values to hand's total
# w/in if statement, set condition for case where card value == "Ace"
# first, b/c 'ace'.to_i = 0, like the jack/queen/king cases, but don't
# want to add 10 to the hand's total when there is an ace
def initial_deal_total(hand)
  sum = 0
  hand[0, 2].each do |card_hash|
    sum += if card_hash.values[0] == "Ace"
             11
           elsif card_hash.values[0].to_i == 0
             10
           else
             card_hash.values[0].to_i
           end
  end
  num_aces = num_of_aces(hand)
  sum -= 10 if num_aces > 1
  sum
end

def total(hand)
  sum = initial_deal_total(hand)
  last_idx = hand.size - 1
  hand[2, last_idx].each do |card_hash|
    sum += if card_hash.values[0] == "Ace" && sum <= 10
             11
           elsif card_hash.values[0] == "Ace"
             1
           elsif card_hash.values[0].to_i == 0
             10
           else
             card_hash.values[0].to_i
           end
  end
  sum
end

# The return value of below busted? method is nil if the
# total hand value of that player's hand is <= 21
def busted?(hand_total)
  true if hand_total > 21
end

def display_cards(hand)
  hand.each do |card_hash|
    list card_hash.values[0] + " of " + card_hash.keys[0]
  end
end

def scoreboard(players_total, dealers_total)
  prompt "The final score is:"
  list "You: #{players_total}"
  list "Dealer: #{dealers_total}"
end

# The following method will not declare the correct
# winner if someone hasn't busted. For example, if
# player's card total == 22 and dealer's card total == 18
# then the following method would state that the player won
# b/c 21 - 22 = -1, which is less than 21 - 18
def declare_winner_if_no_busts(players_total, dealers_total)
  if (21 - players_total) == (21 - dealers_total)
    prompt "It's a tie!"
  elsif (21 - players_total) < (21 - dealers_total)
    prompt "You won!"
  else
    prompt "The Dealer won!"
  end
end

def declare_lger_game_winner(num_plyr_wins, num_dealer_wins)
  if num_plyr_wins == num_dealer_wins
    prompt "It's a tie!"
  elsif num_plyr_wins < num_dealer_wins
    prompt "The Dealer was the ultimate winner!"
  else
    prompt "You were the ultimate winner!"
  end
end

dealer_wins = 0
player_wins = 0

loop do # start of outer full game loop
  deck = []
  suits_idx = 0
  possible_cards_idx = 0

  plyr_hand = []
  dealer_hand = []

  # initialize the deck
  loop do
    while possible_cards_idx < 13
      deck.push({ SUITS[suits_idx] => POSSIBLE_CARDS[possible_cards_idx] })
      possible_cards_idx += 1
    end

    possible_cards_idx -= 13
    suits_idx += 1

    break if suits_idx == 4
  end

  # shuffle deck before calling pop on the deck
  # if chain .shuffle.pop methods on the deck, the deck
  # won't be mutated and there will still be 52 cards, which
  # would allow the player/dealer potentially to get the same
  # card twice, which is undesired
  deck = deck.shuffle

  # Refactored deal cards:
  # refactored to no longer use created deal_card! method,
  # but rather use pop method to remove the last card from
  # the shuffled deck
  2.times do
    plyr_hand.push(deck.pop)
    dealer_hand.push(deck.pop)
  end

  player_total = initial_deal_total(plyr_hand)
  dealer_total = initial_deal_total(dealer_hand)

  # print welcome messages and starting hands of the different players
  # the player will only see the dealer's first card
  prompt "Welcome to the game of 21! The initial cards have been delt."
  prompt "The Dealer has:"
  list "#{card_val(dealer_hand, 0)} of #{card_suit(dealer_hand, 0)}"
  list "Unknown card"
  new_line
  prompt "You have:"
  display_cards(plyr_hand)

  prompt "Your hand's total is: #{player_total}"

  prompt "It's your turn!"

  loop do
    prompt "Enter stay to stay, otherwise hit"
    choice = gets.chomp
    # impossible to bust in initial hand, so only initially
    # break if user entered stay
    break if choice == "stay"
    plyr_hand.push(deck.pop)
    last_cd = plyr_hand.size - 1
    prompt "You received the:"
    list "#{card_val(plyr_hand, last_cd)} of #{card_suit(plyr_hand, last_cd)}"
    player_total = total(plyr_hand)
    prompt "Your hand's current total is: #{player_total}"
    break if busted?(player_total)
  end

  if busted?(player_total)
    prompt "You've been busted!"
    new_line
    prompt "Your final cards were:"
    display_cards(plyr_hand)
    prompt "The Dealer's final cards were:"
    display_cards(dealer_hand)
    new_line
    scoreboard(player_total, dealer_total)
    prompt "The Dealer won!"
    dealer_wins += 1
  else
    new_line
    prompt "It's the Dealer's turn."
  end

  dealer_hit_tally = 0
  while busted?(player_total) != true
    break if dealer_total >= 17
    dealer_hand.push(deck.pop)
    dealer_total = total(dealer_hand)
    dealer_hit_tally += 1
    break if dealer_total >= 17
  end

  new_line
  if dealer_hit_tally == 1
    prompt "The Dealer hit!"
  elsif dealer_hit_tally >= 2
    prompt "The Dealer hit #{dealer_hit_tally} times!"
  else
    "The Dealer stayed!"
  end

  if busted?(dealer_total)
    prompt "The Dealer busted!"
    new_line
    prompt "Your final cards were:"
    display_cards(plyr_hand)
    prompt "The Dealer's final cards were:"
    display_cards(dealer_hand)
    new_line
    scoreboard(player_total, dealer_total)
    prompt "You won!"
    player_wins += 1
  end

  if busted?(player_total) != true && busted?(dealer_total) != true
    prompt "Your final cards were:"
    display_cards(plyr_hand)
    prompt "The Dealer's final cards were:"
    display_cards(dealer_hand)
    new_line
    scoreboard(player_total, dealer_total)
    # declare_winner_if_no_busts(player_total, dealer_total)
    case declare_winner_if_no_busts(player_total, dealer_total)
    when "The Dealer won!"
      dealer_wins += 1
    when "You won!"
      player_wins += 1
    end
  end

  break if player_wins == 5 || dealer_wins == 5

  # add option to let player play again if they want
  prompt "Enter y to play again, otherwise exit"
  choice = gets.chomp
  break if choice.downcase != 'y'
end # end of outer full game loop

prompt "Final Score:"
list "You won the Twenty-One Game #{player_wins} time(s)"
list "The Dealer won #{dealer_wins} time(s)"
declare_lger_game_winner(player_wins, dealer_wins)
prompt "Thanks for playing! Goodbye now."
