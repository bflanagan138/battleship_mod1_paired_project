require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do

  it 'exist' do
    board = Board.new

    expect(board).to be_a (Board)
  end

  it 'is a hash' do
    board = Board.new

    expect(board.cells).to be_a (Hash)
  end

  it 'has a length' do
    board = Board.new

    expect(board.cells.length).to eq (16)
  end

  it 'has cells that can be called' do
    board = Board.new


    expect(board.cells.values.first).to be_a (Cell)
    expect(board.cells.keys.first).to eq ("A1")
    expect(board.cells.keys[7]).to eq ("B4")
  end

  describe ('valid_coordinate?') do
    it 'is a invalid coordinate' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
      expect(board.valid_coordinate?( ["A1", "A5"])).to be (false)
      expect(board.valid_coordinate?( ["A1", "C1", "D22"])).to be (false)
    end


    it 'is a valid coordinate' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?( ["A1", "A2"])).to be (true)
      expect(board.valid_coordinate?( ["B1", "C1", "D1"])).to be (true)
    end
  end

  describe ('#coordinate_order?') do
    it "can sort by letter and number" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.coordinate_order?(["A1", "B2", "C3"])).to be(true)
      expect(board.coordinate_order?(["A1", "C2", "A3"])).to be(false)
      expect(board.coordinate_order?(["A1", "A2", "A3"])).to be(true)
      expect(board.coordinate_order?(["A1", "A3", "A2"])).to be(false)
    end
  end

  describe ('#letter_same?')do

    it 'has the same letter for all coordinates' do
      board = Board.new

      expect(board.letter_same?(["A1","A2"])).to eq (true)
      expect(board.letter_same?(["A1","B1"])).to eq (false)
      end
  end

  describe ('#number_same?') do

    it 'has the same number for all coordinates' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

    expect(board.number_same?(["A1","B1"])).to eq (true)
    expect(board.number_same?(["A1","A2"])).to eq (false)
    end
  end

  describe ('#horizontal?') do
    it 'is horizontal' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.horizontal?(["A1", "A2", "A3"])).to eq (true)
      expect(board.horizontal?(["A1", "A2"])).to eq (true)
      expect(board.horizontal?(["D2", "D3", "D4"])).to be(true)
    end
  end

  describe ('#vertical?') do
    it 'is vertical' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.vertical?(["A1", "B1", "C1"])).to eq (true)
      expect(board.vertical?(["C3", "D3"])).to eq (true)
      expect(board.vertical?(["B3", "C3", "D3"])).to be(true)
    end
  end

  describe ('#horizontal_or_vertical?') do

    it "cannot be diagonal" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.horizontal_or_vertical?(["A1", "B2", "C3"])).to be(false)
      expect(board.horizontal_or_vertical?(["B1", "A2", "A3"])).to be(false)
      expect(board.horizontal_or_vertical?(["D1", "C2", "B3"])).to be(false)
    end
  end

  describe ('#valid_placement?') do
    it 'is a valid placement' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to be (true)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be (true)
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to be (true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be (true)
    end

    it 'is an invalid placement' do
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
    end
  end

  describe ('#place') do
    it 'can be placed' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      cell_4 = board.cells["A4"]

      expect(board.cells["A1"].ship).to eq (cruiser)
      expect(cell_1.ship).to eq (cruiser)
    end

    it 'wont place if invalid' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      board.place(cruiser, ["A1", "A2", "A4"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      cell_4 = board.cells["A4"]

      expect(board.cells["A1"].ship).to eq (nil)
      expect(cell_1.ship).to eq (nil)
    end
  end

  describe ('#render') do
    it 'can render a game board' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      cell_4 = board.cells["A4"]

      expect(board.render).to eq ("  1 2 3 4 \n" +
        "A . . . . \n" +
        "B . . . . \n" +
        "C . . . . \n" +
        "D . . . . \n")
      end

      it 'can render with hits' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = board.cells["A1"]
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]
        cell_4 = board.cells["A4"]
        cell_1.fire_upon

        expect(board.render).to eq ("  1 2 3 4 \n" +
          "A H . . . \n" +
          "B . . . . \n" +
          "C . . . . \n" +
          "D . . . . \n")
        end

        it 'can render a miss' do
          board = Board.new
          cruiser = Ship.new("Cruiser", 3)
          board.place(cruiser, ["A1", "A2", "A3"])
          cell_1 = board.cells["A1"]
          cell_2 = board.cells["A2"]
          cell_3 = board.cells["A3"]
          cell_4 = board.cells["A4"]
          cell_4.fire_upon

          expect(board.render).to eq("  1 2 3 4 \n" +
            "A . . . M \n" +
            "B . . . . \n" +
            "C . . . . \n" +
            "D . . . . \n")
          end

          it 'can render a sunk ship' do
            board = Board.new
            cruiser = Ship.new("Cruiser", 3)
            board.place(cruiser, ["A1", "A2", "A3"])
            cell_1 = board.cells["A1"]
            cell_2 = board.cells["A2"]
            cell_3 = board.cells["A3"]
            cell_4 = board.cells["A4"]
            cell_1.fire_upon
            cell_2.fire_upon
            cell_3.fire_upon

            expect(board.render).to eq("  1 2 3 4 \n" +
              "A X X X . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n")
            end

            it 'can render ships when the arguement is true' do
              board = Board.new
              cruiser = Ship.new("Cruiser", 3)
              board.place(cruiser, ["A1", "A2", "A3"])
              cell_1 = board.cells["A1"]
              cell_2 = board.cells["A2"]
              cell_3 = board.cells["A3"]
              cell_4 = board.cells["A4"]

              expect(board.render(true)).to eq ("  1 2 3 4 \n" +
                "A S S S . \n" +
                "B . . . . \n" +
                "C . . . . \n" +
                "D . . . . \n")
              end
  end
end
