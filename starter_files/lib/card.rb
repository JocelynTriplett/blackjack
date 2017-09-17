class Card
  RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]

  attr_reader :rank

  def initialize(rank)
    @rank = rank
  end
  
end
