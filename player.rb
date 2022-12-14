class Player
  attr_accessor :money, :hand_cards
  attr_reader :name

  def initialize(name)
    @name = name
    validate!
    @money = 100
    @hand_cards = []
  end

  def points
    sum = 0
    hand_cards.each { |card| sum += card.cost }
    unless hand_cards.select { |card| card.value == "A" }.empty?
      sum -= 10 if sum > 21
    end
    sum
  end

  def blind(cost)
    self.money -= cost
    cost
  end

  def validate!
    raise "Name can`t be an empty" if name.empty?
  end
end
