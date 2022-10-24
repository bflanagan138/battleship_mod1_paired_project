require './lib/board'
require './lib/cell'
require './lib/game'

class Turn
#display game boards
#take a guess against computer - cell.fire_upon method & cell.fired_upon? to check if valid
#display feedback??? 
#check for win/game over???
#computer plays their turn (behind the scenes)
#display feedback
#check for win/game over
#if game over, send to gameover.rb
##else start new turn
  def initialize(guess)
    @guess = guess
  end

  def turn
    puts "=============COMPUTER BOARD============="
      #require 'pry'; binding.pry
      puts computer_board.render
      puts "==============PLAYER BOARD=============="
      puts board.render(true)
  end

  def correct?
    #check if guess is valid cell.fired_upon?
    ##invalid for guesses if already guessed that cell
    #check if guess is a miss, hit, hit & sunk 
  end
end