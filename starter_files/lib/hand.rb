require_relative "deck"

class Hand
  attr_accessor :player_cards, :dealer_cards

  def initialize
    @player_cards = []
    @dealer_cards = []
    @deck = Deck.new.shuffle
    @card = []
  end

  def deal
    "The dealer deals you two cards and draws two."
    2.times{deal_card(@player_cards)}
    2.times{deal_card(@dealer_cards)}
  end

  def deal_card(hand)
    @card = @deck.shift
    @card_rank = @card.rank
    hand.push(@card)
    # if hand == @player_cards
    #   puts "The dealer deals you a #{@card.rank}."
    # else
    #   puts "The dealer draws a #{@card.rank}."
    # end
  end

end
