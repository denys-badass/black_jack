class Player
  attr_accessor :money, :hand_cards
  attr_reader :name

  def initialize(name)
    @name = name
    @money = 100
    @hand_cards = []
  end

  def player_point(hand_cards)
    puts hand_cards.select(&:cost)
  end
end
