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

def win_or_lose
  if (@total === 21)
    puts "you win!"
  elsif @total > 21
    puts "you lose!"
  elsif @total < 21
    puts "What is going on here???"
    answer = hit_or_stand
    if answer === true
      player_hits
    else
      puts "what did the dealer get?"
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
  puts @hand
  @hand.deal
  make_bet
  report_values

  # Begin hit_or_stand loops

  if hit_or_stand === true
    player_hits
  end
#
# You hit. You now have a 9, 8, and 4 in your hand. Your total is 19.
# Do you want to (h)it or (s)tand? S
#
# You stand. Your total is 19.
#
# The dealer hits.
# The dealer stands. The dealer has a total of 20. You lose!
#
# ---
#
# You have $90 and bet $10.
# You have an A and a 7 in your hand. Your total is 18.
# Do you want to (h)it or (s)tand? H
#
# You hit. You now have an A, 7, and 9 in your hand. Your total is 17.
# Do you want to (h)it or (s)tand? H
#
# You hit. You now have an A, 7, 9, and 5 in your hand. Your total is 22.
# You bust!
#
# ---
#
# You have $80 and bet $10.
# You have a 5 and a 5 in your hand. Your total is 10.
# Do you want to (h)it or (s)tand? H
#
# You hit. You now have a 5, 5, and A in your hand. Your total is 21.
#
# The dealer stands. The dealer has a total of 19. You win!
#
# ---
#
# You have $90 and bet $10.
# ...
# ```
  # @players.shuffle!
  #
  # @players.each do |player|
  #   player.start_game
  # end
  #
  # @players.cycle.each do |player|
  #
  #   player.start_turn
  #
  #   while player.roll_again?
  #     roll = roll_die
  #     if roll == 1
  #       log(player, "rolls a 1 and loses their turn.")
  #     else
  #       log(player, "rolls a #{roll}.")
  #     end
  #     player.record_roll(roll)
  #
  #   end
  #
  #   log(player, "ends their turn with a score of #{player.score}.")
  #   player.end_turn
  #
  #   if player.score >= 100
  #     log(player, "has won!")
  #     break
  #   end
  # end
  #
  # @players.each do |player|
  #   player.end_game
  # end
end
end

Blackjack.new.run

  # def log(player, message)
  #   puts "#{player.name} #{message}" unless @silent
  # end
  #
  # def roll_die
  #   rand(6) + 1
  # end
  #
  #
  #   @players.each do |player|
  #     puts "#{player.name} won #{player.wins} game(s) and lost #{player.losses} game(s)."
  #   end
  # end
