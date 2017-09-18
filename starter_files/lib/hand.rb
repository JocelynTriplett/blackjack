require_relative "deck"

class Hand
  attr_accessor :player_cards, :dealer_cards

  def initialize
    @player_cards = []
    @dealer_cards = []
  end

  def deal
    @deck = Deck.new.shuffle
    card1 = @deck.shift
    @player_cards.push(card1)
    card2 = @deck.shift
    @dealer_cards.push(card2)
    card3 = @deck.shift
    @player_cards.push(card3)
    card4 = @deck.shift
    @dealer_cards.push(card4)
    puts "player cards: " + @player_cards.to_s
    puts "dealer cards: " + @dealer_cards.to_s
  end
end
