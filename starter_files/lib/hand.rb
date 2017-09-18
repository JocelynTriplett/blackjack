require_relative "deck"

class Hand
  attr_accessor :player_cards, :dealer_cards

  def initialize
    @player_cards = []
    @dealer_cards = []
    @deck = Deck.new.shuffle
  end

  def deal
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

  def player_hits
    card5 = @deck.shift
    @player_cards.push(card5)
    puts "player cards: " + @player_cards.to_s

  end

end
