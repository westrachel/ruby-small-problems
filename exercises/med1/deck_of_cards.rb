# Update Deck class to:
#  i. initializes a full 52 card deck and shuffles the deck
#  ii. includes a draw method that deals one card
#  iii. resets the deck if it runs out of cards

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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
# => true
puts drawn.count { |card| card.suit == 'Hearts' } == 13
# => true

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.
# => true