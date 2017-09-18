class Player
  attr_reader :cash, :name, :wins, :losses, :hand

  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @hand = []
    @cash = 100
  end

  def start_game
    @cash = 100
  end

  # def start_turn
  #   @turn_score = 0
  #   @turn_over = false
  #   @turn_rolls = 0
  # end
  #
  # def record_roll(roll)
  #   if roll == 1
  #     @turn_score = 0
  #     @turn_over = true
  #     @turn_rolls += 1
  #   else
  #     @turn_score += roll
  #     @turn_rolls += 1
  #   end
  # end
  #
  # def end_turn
  #   @score += @turn_score
  # end
  #
  # def end_game
  #   if score >= 100
  #     @wins += 1
  #   else
  #     @losses += 1
  #   end
  # end
  #
  # def roll_again?
  #   !@turn_over
  # end
end
