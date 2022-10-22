require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/setup'
require 'pry'

def quit
  exit
end

def start
  setup = Setup.new
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit"
  answer = gets.chomp.downcase
  #binding.pry

  if answer == 'q'
    quit
  elsif answer == 'p'
    setup.start_game
  else
    puts 'invalid entry. please try again.'
    start
  end

  #Computer can place ships randomly in valid locations
  #User can enter valid sequences to place both ships
  #Entering invalid ship placements prompts user to enter valid placements

end



start
