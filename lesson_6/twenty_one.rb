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

def number_of_aces(participants_cards)
  ace_arr = participants_cards.map do |suit_card_sub_hash|
    suit_card_sub_hash.values[0].include?("ace")
  end # this map will return new array w/ booleans; boolean = true if card is an "ace"
  ace_arr.count("true") # number of aces
end

def remove_aces(participants_cards)
  participants_cards.select do |suit_card_sub_hash|
    suit_card_sub_hash.values[0].include?("ace") == false
  end
end

# basic value extraction method; if there are aces, need another method definition
# for the case where there are aces
# I don't think I need the following method anymore post adding calc_total() method
def extract_values_no_ace_case(participants_cards)
  participants_cards.map do |card_sub_hash|
    card_sub_hash.values[0].values
  end
end

# Possible cases to account for when calculating the total value of a player's hand:
# Since aces are worth 11 points there will never be a case where a player will add more than 1 ace worth 11 points
# b/c 11 + 11 = 22 > 21 = bust and automatic loss situation
# Accordingly, the program should add to the sub-total most 1 ace worth 11 points and if there are
def calc_total(participants_cards)
  num_aces = number_of_aces(participants_cards)
  sub_total_no_aces = extract_values_no_ace_case(remove_aces(participants_cards)).flatten.inject {|sum, x| sum + x}
  # sub_total_no_aces will be nil if the player's hand contains only aces
  if sub_total_no_aces == nil
    total = 11 + (num_aces - 1)*1
  elsif ((21 - sub_total_no_aces) >= 11) && num_aces >= 1
    total = sub_total_no_aces + 11 + (num_aces - 1)*1
  elsif ((21 - sub_total_no_aces) < 11) && num_aces >= 1
    total = sub_total_no_aces + num_aces
    # above formula assigns all instances of aces to the value of 1
    # to try to avoid having the player bust
  else # remaining situtation to account for is case where num_aces = 0
    total = sub_total_no_aces
  end
  total
end



def busted?(participants_cards)
  true if calc_total(participants_cards) > 21
end

def declare_winner(plyr1_cards, plyr2_cars)
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
  deal_card!(players_cards, deck)
  prompt "Your hand's current total is: #{calc_total(players_cards)}"
  # prompt "#{extract_values_no_ace_case(players_cards).inject {|sum, x| sum + x}} "
end

p players_cards

if busted?(players_cards)
  prompt "You've been busted! Your hand's total is: #{calc_total(players_cards)}"
  # prompt "#{extract_values_no_ace_case(players_cards).inject {|sum, x| sum + x}} "
end
