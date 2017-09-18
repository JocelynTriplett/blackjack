puts "TODO Implement the game of blackjack."

require_relative "deck"
require_relative "card"
require_relative "hand"

# def get_yes_or_no
#   # loop until you get a good answer and return
#   while true
#     print "Please enter (y)es or (n)o: "
#     answer = gets.chomp.downcase
#     if answer[0] == "y"
#       return true
#     elsif answer[0] == "n"
#       return false
#     end
#     puts "That is not a valid answer!"
#   end
# end

class Blackjack
  def initialize(games: 1)
    @hand = Hand.new
    @games = games
  end


def run
  @games.times do
    run_game
  end
end

def run_game
  puts @hand
  @hand.deal
  player_card_1 = @hand.player_cards[0].rank
  player_card_2 = @hand.player_cards[1].rank
  total = player_card_1.to_i + player_card_2.to_i


  # puts "Hello and welcome to the game of blackjack! Let's begin."
puts "You have a #{player_card_1} and a #{player_card_2} in your hand. Your total is #{total}."
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
