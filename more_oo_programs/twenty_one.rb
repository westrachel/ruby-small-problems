# Problem: Build out the Twenty-One Game as an Object Oriented Program:
require 'pry'

class Participant
  attr_accessor :hand, :name

  def initialize
    @hand = []
    @name = ""
  end

  def hit(cards)
    hand << cards
  end

  def stay
  end

  def busted?
    true if self.total > 21
  end

  def total
    values = self.hand.map { |card| card.value }
    sum = 0
    values.each do |value|
      sum += value if value.is_a?(Integer)
      sum += 10 if %w(jack queen king).include?(value)
      sum += 11 if value == "ace" && (sum + 11 <= 21)
      sum += 1 if value == "ace" && (sum + 11 > 21)
    end
    sum
  end

end

class Player < Participant
end

class Dealer < Participant
end

class Deck
  attr_reader :deck

  def initialize
    @deck = []
    Card::VALUES.each do |value|
      Card::SUITS.each do |suit|
        @deck << Card.new(suit, value)
      end
    end
  end

  def deal
    card = @deck.sample
    @deck.delete_if { |orig_card| orig_card.suit == card.suit && orig_card.value == card.value }
    card
  end
end

class Card
  attr_reader :suit, :value
  SUITS = %w(hearts diamonds clubs spades)
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]

  def initialize(suit, value)
    @suit = suit
    @value = value
  end
end

class Game
  attr_reader :player, :deck, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome_message
    player_selects_name
    deal_cards
    display_initial_cards
    player_moves
    #dealer_moves
    #display_result
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!"
    puts ""
  end

  def player_selects_name
    puts "What is your name?"
    player.name = gets.chomp
  end

  def deal_cards
    2.times do |_|
      player.hand << deck.deal
      dealer.hand << deck.deal
    end
  end

  def display_initial_cards
    puts "#{player.name}, you've been dealt the:"
    puts " => #{player.hand[0].value} of #{player.hand[0].suit} and"
    puts " => #{player.hand[1].value} of #{player.hand[1].suit}"
    puts ""
    puts "The dealer has:"
    puts " => #{dealer.hand[0].value} of #{dealer.hand[0].suit} and"
    puts " => unknown card"
  end

  def player_moves
    loop do
      puts "Do you want to hit or stay? Enter n to stay otherwise hit."
      choice = gets.chomp.downcase
      choice == "n" ? break : player.hit(deck.deal)
      binding.pry
      display_card_dealt(player)
      break if player.busted?
    end
  end

  def display_card_dealt(participant)
    last_card_idx = participant.hand.size - 1
    puts "You received the:"
    puts " => #{participant.hand[last_card_idx].value} of #{participant.hand[last_card_idx].suit}"
  end

  def dealer_moves
  end
  
end

Game.new.start
