require './lib/game'
# require './lib/welcome'

class Gameover
  attr_reader :player_won,
              :computer_won

  def initialize
    @player_won = puts "You win!\n Press 'm' to return to the main menu"
    @computer_won = puts "I win!\n Press 'm' to return to the main menu"
  end

  def player_won
    @player_won
    string = gets.chomp
    if string.length > 0
      welcome.start
    end
  end
end
