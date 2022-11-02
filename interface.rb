class Interface
  def welcome_start
    puts "WELCOME TO BLACK JACK GAME"
    puts "=" * 30
    print "Enter your name: "
    name = gets.chomp
    # call start game method
  end
end
