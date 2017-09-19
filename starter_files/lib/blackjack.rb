puts "TODO Implement the game of blackjack."

require_relative "deck"
require_relative "card"
require_relative "hand"



class Blackjack
  def initialize(games: 1)
    @hand = Hand.new
    @games = games
    @cash = 100
  end

def run
  @games.times do
    run_game
  end
end

def get_hit_or_stand
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
  #TODO - code if more than one :A
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

def run_game
  puts @hand
  @hand.deal
  player_card_1 = @hand.player_cards[0].rank
  player_card_2 = @hand.player_cards[1].rank
  total = get_total(@hand.player_cards)

  puts "Hello and welcome to the game of blackjack! Let's begin."
  puts "You have $#{@cash} and bet $10."
  puts "You have a #{player_card_1} and a #{player_card_2} in your hand. Your total is #{total}."
  puts "Do you want to (h)it or (s)tand?"

  answer = get_hit_or_stand

  if answer == true
    @hand.player_hits
    player_card_3 = @hand.player_cards[2].rank
    total = get_total(@hand.player_cards)
    puts "You have a #{player_card_1}, a #{player_card_2} and a #{player_card_3} in your hand. Your total is #{total}."
    puts "Do you want to (h)it or (s)tand?"
    answer = get_hit_or_stand
    if answer == true
      @hand.player_hits
      player_card_4 = @hand.player_cards[3].rank
      total = get_total(@hand.player_cards)
      puts "You have a #{player_card_1}, a #{player_card_2}, a #{player_card_3} and a #{player_card_3} in your hand. Your total is #{total}."
      puts "Do you want to (h)it or (s)tand?"
    end
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
