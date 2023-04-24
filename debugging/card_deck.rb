# update the method to produce an actual integer value sum and then figure
#  out why the sum is too low
#cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

#deck = { :hearts   => cards,
#         :diamonds => cards,
#         :clubs    => cards,
#         :spades   => cards }

# Update how the deck is created, so that the sum isn't too low:
deck = { :hearts   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :diamonds => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :clubs    => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :spades   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace] }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# give random cards to the player and remove them from the deck
player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end


# calc score of the cards left in the deck
#sum = deck.reduce(0) do |sum, (_, remaining_cards)|
#  remaining_cards_values = remaining_cards.map do |card|
#    score(card)
#  end

#  sum += remaining_cards_values.sum
#end

# run 1: player_cards
#p player_cards
# => [:king, :queen, 9, 4]

#puts sum
# => 248 for run 1

# total value of the deck:
#4 * (2 + 3 + 4 + 5 + 6+ 7 + 8 + 9 + 10 + 41)
# => 380

# what sum should be for run 1 = 380 - 33 = 347
# why the sum is too low:
#   >> it's because of how the deck is initialized; the cards array is assigned
#       as the value in each key/value pair in the deck
#   >> so, when the card array is mutated during one iteration of the dealing cards
#       loop, all values that point to the card_array point to the mutated card_array
#  >> accordingly, when the remaining cards in the deck are summed, all 4 cards that
#     are in the players_hand have been removed from each suit unintentionally and
#      the sum doesn't reflect all the cards that it should

# Debugged mapping code:
remaining_values = deck.map do |(_, card_arr)|
  card_arr.map do |card_value|
    score(card_value)
  end
end.flatten

# check debugged deck initialization + mapping code:
p player_cards
# => [:queen, 4, 2, 6] = 10 + 4 + 2 + 6 = 22

# what sum should be for the player_cards above:
# = 380 - 58 

puts remaining_values.reduce(:+) # the sum
# => 358     <=> return value is as expected
