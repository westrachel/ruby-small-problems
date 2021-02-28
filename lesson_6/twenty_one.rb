require 'pry'

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
POSSIBLE_CARDS = [{ "Two" => 2 }, { "Three" => 3 }, { "Four" => 4 },
                  { "Five" => 5 }, { "Six" => 6 }, { "Seven" => 7 },
                  { "Eight" => 8 }, { "Nine" => 9 }, { "Ten" => 10 },
                  { "Jack" => 10 }, { "Queen" => 10 }, { "King" => 10 },
                  { "Ace" => [1, 11] }]
deck = []
suits_idx = 0
possible_cards_idx = 0

players_cards = []
dealers_cards = []

def deal_card!(hand, current_deck)
  random_card = current_deck.sample
  hand.push(random_card)
  current_deck.delete_if { |card| card == random_card }
end

def card_value_key(hand, card_idx)
  hand[card_idx].values[0].keys[0]
end

def card_suit(hand, card_idx)
  hand[card_idx].keys[0]
end

def number_of_aces(hand)
  ace_arr = hand.map do |suit_card_sub_hash|
    suit_card_sub_hash.values[0].include?("Ace")
  end # this map will return new array w/ booleans
  # the boolean = true if card is an "ace"
  ace_arr.count(true) # number of aces
end

def numeric_card_vals(hand)
  hand.map do |card_sub_hash|
    card_sub_hash.values[0].values
  end
end

def calc_total(hand)
  numeric_card_vals(hand).flatten.inject { |sum, x| sum + x }
end

# ignoring the rubocop message that line 64 is too long
def calc_total_exclude_aces(hand)
  numeric_card_vals(remove_multivalue_aces(hand)).flatten.inject { |sum, x| sum + x }
end

def remove_multivalue_aces(hand)
  hand.select do |suit_card_sub_hash|
    suit_card_sub_hash.values[0] != { "Ace" => [1, 11] }
  end
end

# Assign generic "Suit" key to the replacement Ace cards
#      i. I don't care to display final cards' suits &
#      ii. This doesn't impede gameplay functionality
# Could build out additional methodology to have the
# replacement ace's suit be the correct suit
# For the initial deals, there are several cases to account for:
#      i. player receive 2 aces
#     ii. player receives 1 ace and a non-ace
#     iii. player receives no aces
# What program needs to do for each situation given other
#              existing method definitions:
#      i. remove the 2 aces from the initial hand and add one ace
#            w/ value of 11 and 1 ace w/ value of 1
#      ii. remove the ace & add 1 ace w/ value = 11 b/c max value initial
#           hand can have excluding aces is 10
#      iii. nothing particular needs to be done b/c
#                 non-ace cards have straightforward values
def mutate_aces_in_initial_hand(hand)
  if number_of_aces(hand) == 2
    hand = remove_multivalue_aces(hand)
    hand.push({ "Suit" => { "Ace" => 11 } }).push({ "Suit" => { "Ace" => 1 } })
  elsif number_of_aces(hand) == 1
    hand = remove_multivalue_aces(hand).push({ "Suit" => { "Ace" => 11 } })
  end
  hand
end

def mutate_added_ace(hand)
  if calc_total_exclude_aces(hand) <= 10
    hand = remove_multivalue_aces(hand).push({ "Suit" => { "Ace" => 11 } })
  elsif calc_total_exclude_aces(hand) > 10
    hand = remove_multivalue_aces(hand).push({ "Suit" => { "Ace" => 1 } })
  end
  hand
end

# return value of busted?(participants_cards) is nil
# if the total hand value of that player's hand is <= 21
def busted?(hand)
  true if calc_total(hand) > 21
end

# the following method will not declare the correct winner if someone has busted
# for example, if player's card total == 22 and dealer's card total == 18
# then the following method would state that the player won
# b/c 21 - 22 = -1, which is less than 21 - 18
def declare_winner_if_no_busts(plyr_hand, dealer_hand)
  if (21 - calc_total(plyr_hand)) == (21 - calc_total(dealer_hand))
    prompt "It's a tie!"
  elsif (21 - calc_total(plyr_hand)) < (21 - calc_total(dealer_hand))
    prompt "You won!"
  else
    prompt "The Dealer won!"
  end
end

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

# check deck initialization
# p deck
# puts deck.size # should be 52 unique card + suit combos
# p deck.sample

# deal cards
2.times { deal_card!(players_cards, deck) }
2.times { deal_card!(dealers_cards, deck) }
# for testing ace cases:
# players_cards = [{"Spades"=>{"Ace"=>[1, 11]}}, {"Hearts"=>{"Ace"=>[1, 11]}}]
# dealers_cards = [{"Diamonds"=>{"Ace"=>[1, 11]}}, {"Clubs"=>{"Ace"=>[1, 11]}}]

# print welcome messages and starting hands of the different players
# the player will only see the dealer's first card
prompt "Welcome to the game of 21! The initial cards have been delt."
prompt "The Dealer has:"
list "#{card_value_key(dealers_cards, 0)} of " + card_suit(dealers_cards, 0)
list "Unknown card"
new_line
prompt "You have:"
list "#{card_value_key(players_cards, 0)} of " + card_suit(players_cards, 0)
list "#{card_value_key(players_cards, 1)} of " + card_suit(players_cards, 0)

players_cards = mutate_aces_in_initial_hand(players_cards)
dealers_cards = mutate_aces_in_initial_hand(dealers_cards)

prompt "It's your turn!"
prompt "Your current total is: #{calc_total(players_cards)}"

loop do
  prompt "Enter hit or stay"
  choice = gets.chomp
  break if choice == "stay" || busted?(players_cards)
  deal_card!(players_cards, deck)
  delt_card_suit = card_suit(players_cards, (players_cards.size - 1))
  delt_card_val_key = card_value_key(players_cards, (players_cards.size - 1))
  prompt "You received the:"
  list "#{delt_card_val_key} of #{delt_card_suit}"

  if players_cards.last.values[0].keys[0] == "Ace"
    players_cards = mutate_added_ace(players_cards)
  end

  prompt "Your hand's new current total is: #{calc_total(players_cards)}."
  break if busted?(players_cards)
end

if busted?(players_cards)
  prompt "You've been busted! The dealer won."
else
  prompt "It's the dealer's turn."
end

while busted?(players_cards) != true
  break if calc_total(dealers_cards) >= 17
  deal_card!(dealers_cards, deck)

  if dealers_cards.last.values[0].keys[0] == "Ace"
    dealers_cards = mutate_added_ace(dealers_cards)
  end
end

prompt "The Dealer busted. You won!" if busted?(dealers_cards)

if busted?(players_cards) != true && busted?(dealers_cards) != true
  prompt "The final score is:"
  list "You: #{calc_total(players_cards)}"
  list "Dealer: #{calc_total(dealers_cards)}"
  declare_winner_if_no_busts(players_cards, dealers_cards)
end
