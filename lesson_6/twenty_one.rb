require 'pry'

PLAYERS = ['Player', 'Dealer']

def prompt(msg)
  puts "=> #{msg}"
end

suits = %w(hearts clubs spades diamonds)
possible_cards = [{"two" => 2}, {"three" => 3}, {"four" => 4}, {"five" => 5},
                  {"six" => 6}, {"seven" => 7}, {"eight" => 8}, {"nine" => 9},
                  {"ten" => 10}, {"jack" => 10}, {"queen" => 10}, {"king" => 10}, {"ace" => [1, 11]}]
deck = []
suits_idx = 0
possible_cards_idx = 0

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


  


  



