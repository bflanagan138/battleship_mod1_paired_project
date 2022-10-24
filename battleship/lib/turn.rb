require './lib/board'
require './lib/cell'
require './lib/setup'

class Turn
#display game boards
#take a guess against computer
#display feedback??? 
#check for win/game over???
#iteration pattern indicates we don't display feedback or check for game over until after both player and computer take turn
#what if player wins and computer wins?
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
    #check if guess is valid
    ##invalid for guesses if already guessed that cell
    #check if guess is a miss, hit, hit & sunk
  end
end