module Interface
  def welcome_start
    puts "WELCOME TO BLACK JACK GAME"
    puts "=" * 30
    print "Enter your name: "
    name = gets.chomp
  end

  def money_menu
    puts "=" * 30
    puts "Diler has $#{@diler.money}"
    puts "#{@user.name} has $#{@user.money}"
    puts "Bank has $#{@bank}"
  end

  def start_game_menu
    menu = {
      1 => {:title => "Play", :method => :play_game},
      2 => {:title => "Exit", :method => :exit_game}
    }
    puts "=" * 30
    puts "What do you want to do?: "
    menu.each { |key, value| puts "#{key} - #{value[:title]}" }
    send(menu[gets.to_i][:method])
  end

  def display_game
    money_menu
    player_info(@diler)
    player_info(@user)
    show_points(@user)
    action_menu
  end

  def player_info(player)
    puts "=" * 30
    print "#{player.name} cards: "
    player.name == "Diler" ? show_cards(player, :close) : show_cards(player, :open)
  end

  def close_diler_cards
    puts "* " * diler.hand_cards.size
  end

  def show_cards(player, param)
    puts "* " * player.hand_cards.size if param == :close
    player.hand_cards.each { |card| print "#{card.value}#{card.suite} " } if param == :open
    puts
  end

  def show_points(player)
    puts "#{player.name} has #{player.points} points"
  end

  def action_menu
    menu = {
      1 => {:title => "Skip", :method => :diler_game},
      2 => {:title => "Add card", :method => :add_card},
      3 => {:title => "Open cards", :method => :open_cards}
    }
    puts "=" * 30
    puts "What do you want to do?: "
    menu.each { |key, value| puts "#{key} - #{value[:title]}" }
    send(menu[gets.to_i][:method], player)
  end

  def diler_game
    
  end
end
