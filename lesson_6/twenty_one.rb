require 'pry'

PLAYERS = ['Player', 'Dealer']

def prompt(msg)
  puts "=> #{msg}"
end

def new_line
  puts ""
end

suits = %w(hearts clubs spades diamonds)
possible_cards = [{"two" => 2}, {"three" => 3}, {"four" => 4}, {"five" => 5},
                  {"six" => 6}, {"seven" => 7}, {"eight" => 8}, {"nine" => 9},
                  {"ten" => 10}, {"jack" => 10}, {"queen" => 10}, {"king" => 10}, {"ace" => [1, 11]}]
deck = []
suits_idx = 0
possible_cards_idx = 0

players_cards = []
dealers_cards = []

def deal_card!(participants_cards, current_deck)
  random_card = current_deck.sample
  participants_cards.push(random_card)
  current_deck.delete_if { |card| card == random_card }
end

def card_value(participants_cards, card_idx)
  participants_cards[card_idx].values[0].values[0]
end

def card_suit(participants_cards, card_idx)
  participants_cards[card_idx].keys[0]
end

def contains_aces?(participants_cards)
  participants_cards.any? do |card_sub_hash|
    card_sub_hash.values[0].keys[0] == "ace"
  end
end

def extract_card_values(participants_cards)
  participants_cards.map do |card_sub_hash|
    card_sub_hash.values[0].values
  end
end

def busted?(participants_cards)
  if contains_aces?(participants_cards) == false
    true if (extract_card_values(participants_cards).flatten.inject {|sum, x| sum + x}) > 21
  end
end

# initialize the deck
loop do

  while possible_cards_idx < 13
    deck.push({suits[suits_idx]=> possible_cards[possible_cards_idx]})
    possible_cards_idx += 1
  end
  
  possible_cards_idx -= 13
  suits_idx += 1
  
  break if suits_idx == 4

end

# check deck initialization
p deck
puts deck.size # should be 52 unique card + suit combos
p deck.sample

# deal cards
2.times { |counter| deal_card!(players_cards, deck) }
2.times { |counter| deal_card!(dealers_cards, deck) }

# print welcome messages and starting hands of the different players
# the player will only see the dealer's first card
prompt "Welcome to the game of 21! The initial cards have been delt."
prompt "The dealer has:"
prompt "   #{card_value(dealers_cards, 0)} of " + card_suit(dealers_cards, 0) + " and an unknown card."
new_line
prompt "You have:"
prompt "   #{card_value(players_cards, 0)} of " + card_suit(players_cards, 0) + " and #{card_value(players_cards, 1)} of " + card_suit(players_cards, 0) + "." 

prompt "It's your turn!"

loop do
  prompt "Enter hit or stay"
  choice = gets.chomp
  break if choice == "stay" || busted?(players_cards)
end

if busted?(players_cards)
  prompt "You've been busted! Your hand's total is:"
  prompt "#{extract_card_values(participants_cards).inject {|sum, x| sum + x}} "
end

# check basic summation of cards
# note: will need to update method to handle the fact that aces can have different values
# in different situations
p extract_card_values(players_cards).flatten.inject {|sum, x| sum + x}
