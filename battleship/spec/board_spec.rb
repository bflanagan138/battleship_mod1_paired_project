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
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
    expect(board.valid_coordinate?( ["A1", "A2"])).to be (true)
    expect(board.valid_coordinate?( ["B1", "C1", "D1"])).to be (true)
  end

  it 'has the same letter for all coordinates' do
    board = Board.new

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

  it 'is a valid placement' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq (false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq (false)
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq (false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq (false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq (false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq (false)
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq (false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq (false)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to be (true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be (true)
  end

  it "can sort by letter and number" do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  expect(board.coordinate_order?(["A1", "B2", "C3"])).to be(true)
  expect(board.coordinate_order?(["A1", "C2", "A3"])).to be(false)
  expect(board.coordinate_order?(["A1", "A2", "A3"])).to be(true)
  expect(board.coordinate_order?(["A1", "A3", "A2"])).to be(false)
  end

  it "cannot be diagonal" do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  expect(board.horizontal_or_vertical?(["A1", "B2", "C3"])).to be(false)
  expect(board.horizontal_or_vertical?(["A1", "A2", "A3"])).to be(true)
  expect(board.horizontal_or_vertical?(["A1", "B1", "C1"])).to be(true)
  end

  it 'is horizontal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.horizontal?(["A1", "A2", "A3"])).to eq (true)
    expect(board.horizontal?(["A1", "A2", "A4"])).to eq (false)
    expect(board.horizontal?(["A1", "B2", "C3"])).to be(false)

  end

  it 'is vertical' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.vertical?(["A1", "B1", "C1"])).to eq (true)
    expect(board.vertical?(["A1", "B1", "D1"])).to eq (false)
    expect(board.vertical?(["A1", "B2", "C3"])).to be(false)
  end

  it 'can be placed' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]

    #expect(board.place(cruiser, ["A1", "A2", "A3"])).to eq (true)
     expect(board.cells["A1"].ship).to eq (cruiser)
     expect(cell_1.ship).to eq (cruiser)
     expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)

     # board.place(submarine,["A1", "B1"])

  end

  it 'can render a game board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_1.fire_upon


     expect(board.render).to eq ("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    #expect(board.render(true)).to eq ("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(board.render).to eq ("  1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD . . . . \n")
  end


end
