require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require 'pry'

def quit
  exit
end

def start
  game = Game.new
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit"
  answer = gets.chomp.downcase
  if answer == 'q'
    quit
  elsif answer == 'p'
    game.start_game
  else
    puts 'invalid entry. please try again.'
    start_game
  end
end
start
