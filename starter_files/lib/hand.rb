require_relative "deck"

class Hand
  attr_accessor :player_cards, :dealer_cards

  def initialize
    @player_cards = []
    @dealer_cards = []
    @deck = Deck.new.shuffle
  end

  def deal
    2.times{deal_player}
    2.times{deal_dealer}
  end

  def deal_player
    card = @deck.shift
    @player_cards.push(card)
    puts "player cards: " + @player_cards.to_s
  end

  def deal_dealer
    card = @deck.shift
    @dealer_cards.push(card)
    puts "dealer cards: " + @dealer_cards.to_s
  end

end
