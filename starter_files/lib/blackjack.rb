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
    @cash = 100
  end


def run
  @games.times do
    run_game
  end
end

def total_cards (card1, card2, total)
  if (card1 === :J) ||
     (card1 === :Q) ||
     (card1 === :K)
     card1 = 10

  elsif (card1 === :A) && (total < 11)
    card1 = 11
  elsif (card1 === :A) && (total > 10)
    card1 = 1
  end
  if (card2 === :J) ||
     (card2 === :Q) ||
     (card2 === :K)
     card2 = 10
  elsif (card2 === :A) && (total < 11)
    card2 = 11
  elsif (card2 === :A) && (total > 10)
    card1 = 1
  end
  card1 + card2
end


def run_game
  puts @hand
  @hand.deal
  player_card_1 = @hand.player_cards[0].rank
  player_card_2 = @hand.player_cards[1].rank
# TODO - add logic to total cards that aren't numbers
  # total = player_card_1.to_i + player_card_2.to_i
  total = total_cards(player_card_1, player_card_2, 0)


puts "Hello and welcome to the game of blackjack! Let's begin."
# puts "You have $#{cash} and bet $10."
puts "You have a #{player_card_1} and a #{player_card_2} in your hand. Your total is #{total}."
# Do you want to (h)it or (s)tand? H
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
