

  def initialize
  end
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

  end

  def quit
    #exit terminal
  end

  start
