require './lib/game'

class Welcome
  attr_reader :main_menu

  def initialize
    @main_menu = start
  end

  def quit
    exit
  end

  def start
    game = Game.new
    puts ""
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit"
    answer = gets.chomp.downcase
    if answer == 'q'
      quit
    elsif answer == 'p'
      game.start_game
    else
      puts 'invalid entry. please try again.'
      start
    end
  end
end
