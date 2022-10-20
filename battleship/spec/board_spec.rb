require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do

  it 'exist' do
    board = Board.new

    expect(board).to be_a (Board)
  end

  it 'has cells' do
    board = Board.new

    expect(board.cells).to be_a (Hash)
    expect(board.cells.length).to eq (16)
    expect(board.cells.values.first).to be_a (Cell)
    expect(board.cells.keys.first).to eq ("A1")
    expect(board.cells.keys[7]).to eq ("B4")
  end

  it 'is a valid coordinate' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'has the same letter for all coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.letter_same?(["A1","A2"])).to eq (true)
    expect(board.letter_same?(["A1","B1"])).to eq (false)
  end

  it 'has the same number for all coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.number_same?(["A1","B1"])).to eq (true)
    expect(board.number_same?(["A1","A2"])).to eq (false)
  end

  xit 'is a valid placement' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser,["A1","A2"])).to eq (false)
    expect(board.valid_placement?(submarine,["A1","A2","A3"])).to eq (false)

  end

  xit "can sort by letter and number" do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  expect(board.coordinate_order?(cruiser,["A1", "B2", "C3"])).to be(true)
  expect(board.coordinate_order?(cruiser,["A1", "C2", "A3"])).to be(false)
  expect(board.coordinate_order?(cruiser,["A1", "A2", "A3"])).to be(true)
  expect(board.coordinate_order?(cruiser,["A1", "A3", "A2"])).to be(false)

  end

  it "cannot be diagonal" do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  expect(board.horizontal_or_vertical?(["A1", "B2", "C3"])).to be(false)
  expect(board.horizontal_or_vertical?(["A1", "A2", "A3"])).to be(true)
  expect(board.horizontal_or_vertical?(["A1", "B1", "C1"])).to be(true)
  end
end
