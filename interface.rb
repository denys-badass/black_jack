class Interface
  def welcome_start
    puts "WELCOME TO BLACK JACK GAME"
    puts "=" * 30
    print "Enter your name: "
    name = gets.chomp
    # call create user
    # call create diler
    # call start game method
  end

  def start_menu(user, diler)
    menu = {
      play: # play_round_method,
      exit: # exit
    }
    # show info about user
    # show info about diler
    # choice method call
  end

  def display_game
    # show play info about diler
    # show info about bank
    # show play info about user
    # show actions
  end
end
