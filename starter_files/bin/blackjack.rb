# puts "TODO Implement the game of blackjack."
# TODO - if player runs out of money
# TODO - "not a valid response" after player quits

require_relative "../lib/deck"
require_relative "../lib/card"
require_relative "../lib/hand"

class Blackjack
  def initialize
    @hand = Hand.new
    @cash = 100
    @total = 0
    @games_won = 0
  end

  def run
    begin_game
  end

  def speak_slower
    sleep(1)
  end

  def hit_or_stand
    puts "Do you want to (h)it or (s)tand?"
    while true
      speak_slower
      print "Please enter (h)it or (s)tand: "
      answer = gets.chomp.downcase
      if answer[0] == "h"
        player_hits
        return false
      elsif answer[0] == "s"
        player_stands
        return false
      end
      puts "That is not a valid answer!"
    end
  end



  def report_values(hand)
    @total = @hand.get_total(hand)
    last_card = hand.last
    other_cards = hand.reverse.drop(1).reverse.map { |card| card.rank  }.join(", a ")
    if hand === @hand.player_cards
      speak_slower
      puts "You have a #{other_cards} and a #{last_card.rank} in your hand. Your total is #{@total}."
      speak_slower
      puts "The dealer has a #{@hand.dealer_cards[0].rank} and one hidden card."
      if @total === 21
        win_or_lose
      end
    else
      speak_slower
      puts "The dealer has a #{other_cards} and a #{last_card.rank} in their hand. Their total is #{@total}."
    end
  end

  def make_bet
    speak_slower
    puts "You have $#{@cash} and bet $10."
  end

  def play_again
    speak_slower
    puts "Do you want to play again?"
    print "Please enter (y)es or (n)o: "
    answer = gets.chomp.downcase
    if answer[0] == "y"
      run_game
      # return false
    elsif answer[0] == "n"
      quit_game
      # return false
    else
      puts "That is not a valid answer!"
      play_again
    end
  end

  def quit_game
    cash_left = @cash - 100
    speak_slower
    puts "Thanks for playing! You won #{@games_won} games and $#{cash_left}."
    exit
  end

  def end_hand
    hidden_card = @hand.dealer_cards.last.rank
    # speak_slower
    # puts "The dealer's hidden card was a #{hidden_card}"
    speak_slower
    puts "You now have $#{@cash}."
    play_again
  end

  def win_or_lose
    if (@total === 21)
      @cash = @cash + 10
      @games_won = @games_won + 1
      puts "You win!"
      end_hand
    elsif @total > 21
      @cash = @cash - 10
      puts "You lose!"
      end_hand
    elsif @total < 21
      hit_or_stand
    end
  end

  def player_stands
    report_values(@hand.dealer_cards)
    dealer_total = @hand.get_total(@hand.dealer_cards)
    player_total = @hand.get_total(@hand.player_cards)
    while dealer_total < 17
      @hand.deal_card(@hand.dealer_cards)
      last_card = @hand.dealer_cards.last.rank
      speak_slower
      puts "The dealer draws a #{last_card}."
      dealer_total = @hand.get_total(@hand.dealer_cards)
      speak_slower
      puts "Their total is now #{dealer_total}."
    end
    if dealer_total > 21
      speak_slower
      puts "dealer busts!"
    end
    if player_total >= dealer_total || dealer_total > 21
      @cash = @cash + 10
      @games_won = @games_won + 1
      speak_slower
      puts "You win!"
      speak_slower
      puts "You have $#{@cash} left."
      play_again
    else
      @cash = @cash - 10
      speak_slower
      puts "You lose."
      speak_slower
      puts "You have $#{@cash} left."
      play_again
    end
  end

  def player_hits
    @hand.deal_card(@hand.player_cards)
    last_card = @hand.player_cards.last.rank
    speak_slower
    puts "The dealer deals you a #{last_card}."
    report_values(@hand.player_cards)
    win_or_lose
  end

  def begin_game
    puts "Hello and welcome to the game of blackjack! Let's begin."
    run_game
  end

  def run_game
    @hand = Hand.new
    speak_slower
    @hand.deal
    make_bet
    report_values(@hand.player_cards)
    hit_or_stand
  end

end

Blackjack.new.run
