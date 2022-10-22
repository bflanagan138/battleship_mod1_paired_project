require './lib/board'
require './lib/cell'
require './lib/ship'

board = Board.new
cruiser = Ship.new(cruiser, 3)
submarine = Ship.new(submarine, 2)

def start
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit"
  answer = gets.chomp
  if answer == 'p' || 'P'
    start_game
  elsif answer == 'q' || 'Q'
    quit
  else
    puts 'invalid entry. please try again.'
    start
  end
end

def start_game
  #computer places pieces
  puts "I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The Cruiser is three units long and the Submarine is two units long."
  @board.render
  puts "Enter the squares for the Cruiser (3 spaces):"
end

def quit
  #exit terminal
end

start
