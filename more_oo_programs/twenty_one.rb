# Problem: Build out the Twenty-One Game as an Object Oriented Program:
# require 'pry'

class Participant
  attr_accessor :hand, :name

  def initialize
    @hand = []
  end

  def hit(cards)
    hand << cards
  end

  def busted?
    true if total > 21
  end

  def convert(raw_card_value, current_hand_sum)
    if raw_card_value.is_a?(Integer)
      raw_card_value
    elsif raw_card_value == "ace" && (current_hand_sum + 11 <= 21)
      11
    elsif raw_card_value == "ace"
      1
    else # raw card must be jack/queen/king
      10
    end
  end

  def total
    sum = 0
    hand.map(&:value).each do |raw_card_value|
      sum += convert(raw_card_value, sum)
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
    @deck.delete_if do |original_card|
      original_card.suit == card.suit && original_card.value == card.value
    end
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

  def play
    display_welcome_message
    player_selects_name
    deal_cards
    display_initial_cards
    player_moves
    dealer_moves if player.busted?.nil?
    display_result
    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome to Twenty-One!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye"
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

  def display_card(num, participant)
    card = participant.hand[num]
    "#{card.value} of #{card.suit}"
  end

  def display_initial_cards
    puts "#{player.name}, you've been dealt the:"
    puts " => #{display_card(0, player)}"
    puts " => #{display_card(1, player)}"
    puts ""
    puts "The dealer has:"
    puts " => #{display_card(0, dealer)}"
    puts " => unknown card"
  end

  def player_moves
    loop do
      puts "Do you want to hit or stay? Enter n to stay otherwise hit."
      choice = gets.chomp.downcase
      puts ""
      choice == "n" ? break : player.hit(deck.deal)
      display_card_dealt(player)
      break if player.busted?
    end
  end

  def display_card_dealt(participant)
    last_card = participant.hand[participant.hand.size - 1]
    puts "You received the:"
    puts " => #{last_card.value} of #{last_card.suit}"
    puts ""
  end

  def dealer_moves
    loop do
      break if dealer.total >= 17
      dealer.hit(deck.deal)
    end
  end

  def abs_value(num)
    num < 0 ? num * -1 : num
  end

  def winner
    plyr_abs_diff_to_goal = abs_value(21 - player.total)
    dealer_abs_diff_to_goal = abs_value(21 - dealer.total)
    if winner_bc_of_bust.nil? == false
      winner_bc_of_bust
    elsif plyr_abs_diff_to_goal > dealer_abs_diff_to_goal
      "Dealer"
    elsif plyr_abs_diff_to_goal < dealer_abs_diff_to_goal
      player.name
    end
  end

  def winner_bc_of_bust
    winner = nil
    [player, dealer].each do |contender|
      if contender.busted?
        winner = (contender == dealer ? player.name : "The Dealer")
      end
    end
    winner
  end

  def final_score_msg
    scores = "#{player.name}: #{player.total} vs Dealer: #{dealer.total}"
    puts "The final score is: #{scores}"
  end

  def bust_message
    case winner_bc_of_bust
    when "The Dealer"
      puts "You busted!"
    when player.name
      puts "The Dealer busted!"
    end
  end

  def display_result
    case winner
    when nil then puts "It's a tie!"
    else puts "#{winner} won!"
    end
    winner_bc_of_bust.nil? ? final_score_msg : bust_message
  end
end

Game.new.play
