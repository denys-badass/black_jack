module Interface

  START_GAME_MENU = {1 => "Play", 2 => "Exit"}.freeze
  ACTION_MENU = {1 => "Skip", 2 => "Add card", 3 => "Open cards"}.freeze

  def welcome_start
    puts "WELCOME TO BLACK JACK GAME"
    puts "=" * 30
    print "Enter your name: "
    name = gets.chomp
  end

  def show_money
    puts "=" * 30
    puts "Diler has $#{@diler.money}"
    puts "#{@user.name} has $#{@user.money}"
    puts "Bank has $#{@bank}"
  end

  def show_menu(menu)
    puts "=" * 30
    puts "What do you want to do?: "
    menu.each { |key, value| puts "#{key} - #{value}" }
    gets.to_i
  end

  def show_cards(player, param)
    puts "=" * 30
    print "#{player.name} cards: "
    puts "* " * player.hand_cards.size if param == :close
    player.hand_cards.each { |card| print "#{card.value}#{card.suite} " } if param == :open
    puts
  end

  def show_points(player)
    puts "#{player.name} has #{player.points} points"
  end

  def draw
    puts "=" * 30
    puts "It`s Draw"
    puts "#{@user.name} get $#{@bank / 2}"
    @user.money += @bank / 2
    puts "#{@diler.name} get $#{@bank / 2}"
    @diler.money += @bank / 2
    @bank = 0
  end

  def player_win(player)
    puts "=" * 30
    puts "#{player.name} win $#{@bank}"
    player.money += @bank
    @bank = 0
  end

  def exit_game
    puts "GAME OVER"
    puts "We will wait you!!!"
  end
end
