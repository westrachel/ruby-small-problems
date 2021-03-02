require 'pry'

# Refactoring Ideas to Implement:
# i. Make the deck simpler:
#   Instead of the deck being an array w/ sub-hashes
#   for each unique suit + card combo, and each of
#   these sub-hashes containing an additional sub-hash
#   specifying the card and the card value, could just
#   have an array w/ a sub-hash whose key = suit and whose
#   value = card type
# <=> This removes the extra key/value pair that indicates a "ten" card= 10

# Note: could also change deck to an array of nested arrays
#        containing unique suit card combos
# <=> An array containing arrays may be even simpler to work w/,
#     but I'm keeping the usage of sub-hashes as practice for working w/ hashes

# ii. In tandem w/ i., don't overwrite sampled ace cards to
#     adjust their value to be either 1 or 11. Instead, alter
#     the card summation logic based on knowledge that a hand w/ 2
#     or more aces will assign at most one ace's value to 11 and
#     all other aces to a value of 1.

# iii. Can sample a card from the initialized deck and remove it
#      from the initialized deck at the same time. This is more
#      efficient than how I previously sampled a random card and assigned
#      the random card to a local variable, so that I could first push
#      this local random card variable to either the player's hand or the
#      dealer's hand and then iterate back through the initialized deck to
#     remove the local random card variable.
# iv. Embed game into a loop to give the player the option to play again

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
def busted?(hand)
  true if total(hand) > 21
end

# The following method will not declare the correct
# winner if someone hasn't busted. For example, if
# player's card total == 22 and dealer's card total == 18
# then the following method would state that the player won
# b/c 21 - 22 = -1, which is less than 21 - 18
def declare_winner_if_no_busts(plyr_cds, dealer_cds)
  if (21 - total(plyr_cds)) == (21 - total(dealer_cds))
    prompt "It's a tie!"
  elsif (21 - total(plyr_cds)) < (21 - total(dealer_cds))
    prompt "You won!"
  else
    prompt "The Dealer won!"
  end
end

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

  # print welcome messages and starting hands of the different players
  # the player will only see the dealer's first card
  prompt "Welcome to the game of 21! The initial cards have been delt."
  prompt "The Dealer has:"
  list "#{card_val(dealer_hand, 0)} of #{card_suit(dealer_hand, 0)}"
  list "Unknown card"
  new_line
  prompt "You have:"
  list "#{card_val(plyr_hand, 0)} of #{card_suit(plyr_hand, 0)}"
  list "#{card_val(plyr_hand, 1)} of #{card_suit(plyr_hand, 1)}"
  prompt "Your hand's total is: #{initial_deal_total(plyr_hand)}"

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
    prompt "Your hand's current total is: #{total(plyr_hand)}"
    break if busted?(plyr_hand)
  end

  if busted?(plyr_hand)
    prompt "You've been busted! The dealer won."
  else
    prompt "It's the dealer's turn."
  end

  while busted?(plyr_hand) != true
    break if initial_deal_total(dealer_hand) >= 17
    dealer_hand.push(deck.pop)
    break if total(dealer_hand) >= 17
  end

  prompt "The Dealer busted. You won!" if busted?(dealer_hand)

  if busted?(plyr_hand) != true && busted?(dealer_hand) != true
    prompt "The final score is:"
    list "You: #{total(plyr_hand)}"
    list "Dealer: #{total(dealer_hand)}"
    declare_winner_if_no_busts(plyr_hand, dealer_hand)
  end

  # add option to let player play again if they want
  prompt "Enter y to play again, otherwise exit"
  choice = gets.chomp
  break if choice.downcase != 'y'
end # end of outer full game loop

prompt "Thanks for playing! Goodbye now."
