class Player
  attr_accessor :money, :hand_cards
  attr_reader :name

  def initialize(name)
    @name = name
    @money = 100
    @hand_cards = []
  end

  def points
    sum = 0
    hand_cards.each { |card| sum += card.cost }
    if sum > 21 && hand_cards.select { |card| card.value == "A" }
      sum -= 10
    end
    sum
  end

  def blind(cost)
    self.money -= cost
    cost
  end
end
