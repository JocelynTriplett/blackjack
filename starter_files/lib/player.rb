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
end
