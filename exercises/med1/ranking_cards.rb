# Part 1: Add to the card class, so that the min and max functions
#  can be used to compare cards. A card's suit doesn't matter for
#  rankings. So, if 2 or more cards have the same rank, the min
#  and max methods should return one of the matching cards.

# Part 2: Add a #to_s method that returns a String representation
#   of the card, eg "Jack of Diamonds"

# > Based on Ruby docs, the min and max methods leverage the <=>
#   method to compare objects. In order to compare cards, I will
#   need to define a custom <=> method for the Card class.
#      > I want to compare ranks specifically, but based on the
#        example test cases, ranks can be either integers or strings,
#        so the string ranks (Ace, Queen, Jack, and King) will need
#        to be mapped to numerical values
#     > In this specific program, the numerical ranks for strings should
#          be: Ace > King > Queen > Jack > 10
#         > So, can simply add 1 and increment upwards from 10 in assigning
#            numerical values for all these face cards
# > Part 2 seems necessary for the test cases to work, b/c if passed in a new
#    Card object to the puts method without implementing a custom to_s method
#    for the Card class then an encoded Card object and descriptive id number
#    would be returned, which would make the test cases not comparing ranks
#    specifically fail even if the 2 cards being compared had the same rank.

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

# Test Cases:
cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
a = puts cards.min
b = puts Card.new(2, 'Hearts')
puts a == b
# => true
puts cards.max
# => Ace of Clubs

cards = [Card.new(5, 'Hearts')]
puts cards.min
# => 5 of Hearts
puts cards.max
# => 5 of Hearts

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
# => true
puts cards.max
# => 10 of Clubs

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min
# => 7 of Diamonds
puts cards.max.rank == 'Jack'
# => true

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
# => true
puts cards.max.rank == 8
# => true