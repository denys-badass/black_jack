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
  end

  def first_start
    money_menu
    start_game_menu
  end

  def game_round
    loop do
      finish_game if @diler.hand_cards.size == 3 && @user.hand_cards.size == 3
      results if @user.points > 21
    
      display_game
      action_menu
    end
  end

  def play_game
    @card_pack = shuffle_pack(fill_card_pack)
    @user.hand_cards.clear
    @diler.hand_cards.clear
    @bank = @user.blind(10) + @diler.blind(10)
    2.times do
      @user.hand_cards << give_card(card_pack)
      @diler.hand_cards << give_card(card_pack)
    end
    game_round
  end

  def start_game_menu
    case show_menu(START_GAME_MENU)
    when 1 then play_game
    when 2 then exit_game
    end
  end

  def display_game
    money_menu
    show_cards(@diler, :close)
    show_cards(@user, :open)
    show_points(@user)
  end

  def action_menu
    case show_menu(ACTION_MENU)
    when 1 then diler_game
    when 2 then add_card(@user)
    when 3 then finish_game
    end
  end

  def diler_game
    add_card(@diler) if @diler.points < 17
  end

  def add_card(player)
    player.hand_cards << give_card(@card_pack)
    diler_game unless player.name == "Diler"
  end

  def finish_game
    money_menu
    show_cards(@diler, :open)
    show_points(@diler)
    show_cards(@user, :open)
    show_points(@user)
    results
    start_game_menu
  end

  def results
    user_result = 21 % @user.points
    diler_result = 21 % @diler.points
    if user_result < diler_result
      player_win(@user)
    elsif diler_result < user_result
      player_win(@diler)
    else
      draw
    end
  end
end
