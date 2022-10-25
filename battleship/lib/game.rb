require './lib/board'
require './lib/cell'
require './lib/ship'

class Game
  attr_reader :board,
              :cruiser,
              :submarine,
              :computer_board,
              :computer_cruiser,
              :computer_submarine,
              :computer_guesses

  def initialize
    @board = Board.new
    @cruiser = Ship.new(cruiser, 3)
    @submarine = Ship.new(submarine, 2)
    @computer_board = Board.new
    @computer_cruiser = Ship.new(computer_cruiser, 3)
    @computer_submarine = Ship.new(computer_submarine, 2)
    @computer_guesses = board.cells.keys.shuffle
  end

  def start_game
      computer_cruiser_cells = computer_guesses.shuffle.slice(0..2)
      while computer_board.valid_placement?(computer_cruiser, computer_cruiser_cells) == false
        computer_cruiser_cells = computer_guesses.shuffle.slice(0..2)
      end
      computer_board.place(computer_cruiser, computer_cruiser_cells)

      computer_submarine_cells = computer_guesses.shuffle.slice(0..1)
      while computer_board.valid_placement?(computer_submarine, computer_submarine_cells) == false
        computer_submarine_cells = computer_guesses.shuffle.slice(0..1)
      end
      computer_board.place(computer_submarine, computer_submarine_cells)

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
        puts @computer_board.render
        puts "==============PLAYER BOARD=============="
        puts board.render(true)
        puts ""
        puts "Enter the coordinate for your shot:"
        guess = gets.chomp.upcase
          if computer_board.cells.keys.include?(guess) == false
            puts "Invalid choice. Try again"
            turn
          elsif computer_board.cells[guess].fired_upon == true
            puts "You have already fired on that cell. Try again"
            turn
          end

        computer_board.cells[guess].fire_upon
        if (computer_cruiser.sunk? && computer_submarine.sunk?) == true
          puts ""
          puts "You win!"
          puts "=============COMPUTER BOARD============="
          puts @computer_board.render
          puts "==============PLAYER BOARD=============="
          puts board.render(true)
          puts ""
          welcome = Welcome.new
          welcome.main_menu
        elsif computer_cruiser.sunk? == true
          puts "You sunk my cruiser!"
        elsif computer_submarine.sunk? == true
          puts "You sunk my submarine!"
        elsif computer_board.cells[guess].empty? == false
          if computer_board.cells[guess].ship.health == 0 && computer_cruiser.sunk? == true
            puts "You sunk my cruiser!"
          elsif computer_board.cells[guess].ship.health == 0 && computer_submarine.sunk? == true
          puts "You sunk my submarine!"
          end
        end

        computer_guess = computer_guesses.pop
        board.cells[computer_guess].fire_upon
        if (cruiser.sunk? && submarine.sunk?) == true
          puts ""
          puts "I win!"
          puts "=============COMPUTER BOARD============="
          puts @computer_board.render
          puts "==============PLAYER BOARD=============="
          puts board.render(true)
          puts ""
          welcome = Welcome.new
          welcome.main_menu
        elsif board.cells[computer_guess].empty? == true
          puts "My shot on #{computer_guess} was a miss."
        elsif board.cells[computer_guess].empty? == false
          puts "My shot on #{computer_guess} was a hit!"
          if board.cells[computer_guess].ship.health == 0 && cruiser.sunk? == true
              puts "I sunk your cruiser!"
          elsif board.cells[computer_guess].ship.health == 0 && submarine.sunk? == true
            puts "I sunk your submarine!"
          end
        end
        turn
      end
      turn
    end
  end
