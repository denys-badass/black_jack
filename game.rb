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

  def first_start
    money_menu
    start_game_menu
  end

  def play_game
    @bank = @user.blind(10) + @diler.blind(10)
    2.times do
      @user.hand_cards << give_card(card_pack)
      @diler.hand_cards << give_card(card_pack)
    end
    display_game
  end
end
