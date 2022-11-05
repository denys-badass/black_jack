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
    # show play info about diler
    # show info about bank
    # show play info about user
    # show actions
  end
end
