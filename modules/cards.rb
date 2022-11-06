module Cards
  attr_accessor :card_pack

  CARD_SUITE = ["+", "<3", "<>", "^"].freeze
  CARD_VALUES = {
    "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7,
    "8" => 8, "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11
  }.freeze

  def fill_card_pack
    @card_pack = []
    CARD_SUITE.each do |suite|
      CARD_VALUES.each do |value, cost|
        card_pack << Card.new(value, suite, cost)
      end
    end
    @card_pack
  end

  def shuffle_pack(pack)
    pack.shuffle
  end

  def give_card(pack)
    pack.pop
  end
end
