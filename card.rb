class Card
  attr_reader :value, :suite, :cost
  
  def initialize(value, suite, cost)
    @value = value
    @suite = suite
    @cost = cost
  end
end
