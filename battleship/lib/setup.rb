require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/turn'

class Setup
  # attr_reader :computer
  def initialize
  end

  def computer
    board = Board.new
    cruiser = Ship.new(cruiser, 3)
    submarine = Ship.new(submarine, 2)
    def place_ships
        computer_cruiser = board.cells.keys.shuffle.slice(0..2)
        while board.valid_placement?(cruiser, computer_cruiser) == false
          computer_cruiser = board.cells.keys.shuffle.slice(0..2)
        end
        board.place(cruiser, computer_cruiser)
      computer_submarine = board.cells.keys.shuffle.slice(0..1)
      while board.valid_placement?(submarine, computer_submarine) == false
        computer_submarine = board.cells.keys.shuffle.slice(0..1)
      end
      board.place(submarine, computer_submarine)
      board.render
    end
  end

  def start_game
    computer
    board = Board.new
    cruiser = Ship.new(cruiser, 3)
    submarine = Ship.new(submarine, 2)

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
    until board.valid_placement?(submarine, squares_submarine) == true
      puts "Those are invalid coordinates. Please try again:"
      squares_submarine = gets.chomp.upcase.split(' ')
    end
    board.place(submarine, squares_submarine)

    def turn
      puts "=============COMPUTER BOARD=============" 
      require 'pry'; binding.pry
      puts computer.board.render
      puts "==============PLAYER BOARD==============" 
      puts board.render(true)
    end
    turn
  end
  
end
# end
# turn