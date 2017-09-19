puts "TODO Implement the game of blackjack."

require_relative "deck"
require_relative "card"
require_relative "hand"

class Blackjack
  def initialize(games: 1)
    @hand = Hand.new
    @games = games
    @cash = 100
    @total = 0
    @games_won = 0
  end

def run
  @games.times do
    run_game
  end
end

def hit_or_stand
  puts "Do you want to (h)it or (s)tand?"
  # loop until you get a good answer and return
  while true
    print "Please enter (h)it or (s)tand: "
    answer = gets.chomp.downcase
    if answer[0] == "h"
      return true
    elsif answer[0] == "s"
      return false
    end
    puts "That is not a valid answer!"
  end
end

def get_total(cards)
  @card_values = cards.map { |card| card.rank  }
  @card_values.map! { |value| (value === :J || value === :Q || value === :K ? 10 : value) }
# if the hand includes an Ace
  if @card_values.include?(:A)
    @card_values.delete_at(@card_values.find_index(:A))
# if the hand includes another Ace
    if @card_values.include?(:A)
      @card_values.delete_at(@card_values.find_index(:A))
      @card_values.push(1)
    else
      if @card_values.inject(&:+) < 11
        @card_values.inject(&:+) + 11
      else
        @card_values.inject(&:+) + 1
      end
    end
  else
    @card_values.inject(&:+)
  end
end

def report_values
  @total = get_total(@hand.player_cards)
  last_card = @hand.player_cards.last
  other_cards = @hand.player_cards.reverse.drop(1).reverse.map { |card| card.rank  }.join(", a ")
  puts "you have a #{other_cards} and a #{last_card.rank} in your hand. Your total is #{@total}."
end

def make_bet
  puts "You have $#{@cash} and bet $10."
end

def play_again
  puts "Do you want to play again?"
  while true
    print "Please enter (y)es or (n)o: "
    answer = gets.chomp.downcase
    if answer[0] == "y"
      run_game
    elsif answer[0] == "n"
      quit_game
      return false
    else
      puts "That is not a valid answer!"
    end
  end
end

def quit_game
  cash_left = @cash - 100
  puts "Thanks for playing! You won #{@games_won} games and #{cash_left} dollars"
end

def win_or_lose
  if (@total === 21)
    @cash = @cash + 10
    puts "You win!"
    puts "You have $#{@cash} left."
    play_again
  elsif @total > 21
    @cash = @cash - 10
    puts "You lose!"
    puts "You have $#{@cash} left."
    play_again
  elsif @total < 21
    puts "What is going on here???"
    answer = hit_or_stand
    if answer === true
      player_hits
    else
      puts "What did the dealer get?"
    end
  end
end

def player_hits
  @hand.deal_player
  report_values
  win_or_lose
end

def run_game
# Begin game
puts "Hello and welcome to the game of blackjack! Let's begin."

  @hand = Hand.new
  @hand.deal
  make_bet
  report_values

  if hit_or_stand === true
    player_hits
  end
end
end

Blackjack.new.run
