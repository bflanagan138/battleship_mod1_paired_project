#Computer can place ships randomly in valid locations
#User can enter valid sequences to place both ships
#Entering invalid ship placements prompts user to enter valid placements
require './lib/board'
require './lib/cell'
require './lib/ship'


class Setup

  def initialize
  end

  def start_game
    board = Board.new
    cruiser = Ship.new(cruiser, 3)
    submarine = Ship.new(submarine, 2)
    #computer places pieces
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts board.render(option = false)
    puts "Enter the squares for the Cruiser (3 spaces):"
    squares_cruiser = gets.chomp.upcase.split(' ')

    until board.valid_placement?(cruiser, squares_cruiser) == true
      puts "Those are invalid coordinates. Please try again:"
      squares_cruiser = gets.chomp.upcase.split(' ')
    end
    board.place(cruiser, squares_cruiser)
      
    puts "Enter the squares for the Submarine (2 spaces):"
    squares_submarine = gets.chomp.upcase.split(' ')
    until board.place(submarine, squares_submarine) == true
      puts "Those are invalid coordinates. Please try again:"
      squares_submarine = gets.chomp.upcase.split(' ')
    end
    board.place(submarine, squares_submarine)
    puts board.render(true)
  end
end
