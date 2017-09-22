require_relative "deck"

class Hand
  attr_accessor :player_cards, :dealer_cards

  def initialize
    @player_cards = []
    @dealer_cards = []
    @deck = Deck.new.shuffle
  end

  def deal
    2.times{deal_card(@player_cards)}
    2.times{deal_card(@dealer_cards)}
  end

  def deal_card(hand)
    card = @deck.shift
    hand.push(card)
    puts "#{hand}: " + hand.to_s
  end

end
