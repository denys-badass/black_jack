require_relative 'interface_module'
require_relative 'player'
require_relative 'cards_module'
require_relative 'card'

class Game
  include Interface
  include Cards

  def initialize
    @user = Player.new(welcome_start)
    @diler = Player.new("Diler")
    @card_pack = shuffle_pack(fill_card_pack)
    @bank = 0
  end

  def play
    money_menu
    start_game_menu
  end
end
