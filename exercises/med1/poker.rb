# Add to the PokerHand class so that it accepts a set of 5 cards
#   from a deck and evaluates those cards as a Poker hand

# Types of poker hands:
#  One pair = 2 cards of the same rank
#  Two pair = 2 different sets of one pair
#  Three of a kind = 3 cards of same rank
#  Four of a kind = 4 cards of same rank
#  Flush = 5 cards in same suit
#  Straight = 5 cards in sequence (4, 5, 6, 7, 8)
#  Full House = 3 cards of 1 rank and 2 of another
#  High card = if no one has a pair, the highest card wins
#  Straight Flush = 5 cards of the same suit in sequence
#  Royal Flush = 5 cards of same suit and the cards are A, K, Q, J, 10

class Card
  attr_reader :rank, :suit

  NUMERICAL_RANKS = {'Jack' => 11,
                     'Queen' => 12,
                     'King' => 13,
                     'Ace' => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def mapped_rank
    rank.is_a?(Integer) ? rank : NUMERICAL_RANKS[rank]
  end

  def <=>(other)
    mapped_rank <=> other.mapped_rank
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  attr_accessor :full_deck

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @full_deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        full_deck << Card.new(rank, suit)
      end
    end
    full_deck.shuffle!
  end

  def draw
    reset if full_deck.empty?
    full_deck.pop
  end

  def reset
    initialize
  end
end

class PokerHand
  attr_reader :hand, :card

  def initialize(deck)
    @hand = []
    5.times { |_| @hand << deck.draw }
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end


  private

  def ranks
    hand.map { |card| card.mapped_rank }
  end

  def suits
    hand.map { |card| card.suit }
  end

  def rank_counts
    counts = {}
    ranks.each do |rank|
      if counts.keys.include?(rank)
        counts[rank] += 1
      else
        counts[rank] = 1
      end
    end
    counts
  end

  def number_same_ranks(n)
    rank_counts.values.count(n) == 1
  end

  def royal_flush?
    ranks.sort == [10, 11, 12, 13, 14] && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    number_same_ranks(4)
  end

  def full_house?
    three_of_a_kind? && ranks.uniq.size == 2
  end

  def flush?
    suits.uniq.size == 1
  end

  def straight?
    incremented_rank = ranks.sort[0]
    recreated_ranks = []
    until recreated_ranks.size == 5
      recreated_ranks << incremented_rank
      incremented_rank += 1
    end
    recreated_ranks == ranks.sort
  end

  def three_of_a_kind?
    number_same_ranks(3)
  end

  def two_pair?
    ranks.uniq.size == 3
  end

  def pair?
    number_same_ranks(2)
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'
# => true

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'
# => true

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'
# => true

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'
# => true

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'
# => true

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'
# => true

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'
# => true

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'
# => true

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'
# => true

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'
# => true

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
# => true
