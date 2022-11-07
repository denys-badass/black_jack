require "./modules/interface"
require "./modules/cards"
require_relative "player"
require_relative "card"

class Game
  include Interface
  include Cards
  
  BLACK_JACK_POINT = 21

  def initialize
    @user = Player.new(welcome_start)
    @diler = Player.new("Diler")
    @bank = 0
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def play
    @break_flag = false
    while (@user.money.positive? && @diler.money.positive?) || !@break_flag
      break if @break_flag

      show_money
      start_game_menu
    end
    exit_game
  end

  def pre_round
    clear_hand_card
    @card_pack = shuffle_pack(fill_card_pack)
    blind
    2.times do
      @user.hand_cards << give_card(card_pack)
      @diler.hand_cards << give_card(card_pack)
    end
    round
  end

  def round
    show_money
    show_desk(:close)
    if @user.points > BLACK_JACK_POINT
      player_win(@diler)
    elsif @user.hand_cards.size == 3 && @diler.hand_cards.size == 3
      open_cards
    else
      action_menu
    end
  end

  def clear_hand_card
    @user.hand_cards.clear
    @diler.hand_cards.clear
  end

  def blind
    @bank = @user.blind(10) + @diler.blind(10)
  end

  def start_game_menu
    case show_menu(START_GAME_MENU)
    when 1 then pre_round
    when 2 then @break_flag = true
    end
  end

  def action_menu
    case show_menu(ACTION_MENU)
    when 1 then diler_game
    when 2 then add_card(@user)
    when 3 then open_cards
    else
      raise "Wrong Choice"
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def diler_game
    add_card(@diler) if @diler.points < 17
    round
  end

  def add_card(player)
    player.hand_cards << give_card(@card_pack) if player.hand_cards.size == 2
    diler_game unless player.name == "Diler"
  end

  def results
    return if draw? || overkill

    user_result = BLACK_JACK_POINT - @user.points
    diler_result = BLACK_JACK_POINT - @diler.points
    if user_result < diler_result
      player_win(@user)
    elsif diler_result < user_result
      player_win(@diler)
    else
      draw
    end
  end

  def draw?
    draw if @user.points > BLACK_JACK_POINT && @diler.points > BLACK_JACK_POINT || @user.points == @diler.points
  end

  def blackjack?(player)
    player.points == BLACK_JACK_POINT
  end

  def overkill
    if @user.points > BLACK_JACK_POINT
      player_win(@diler)
    elsif @diler.points > BLACK_JACK_POINT
      player_win(@user)
    end
  end
end
