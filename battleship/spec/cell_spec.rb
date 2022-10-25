require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new('B4')

    expect(cell).to be_a (Cell)
  end

  it 'has a coordinate' do
    cell = Cell.new('B4')

    expect(cell.coordinate).to eq ('B4')
  end

  describe '#ship' do
    it 'does not have a ship' do
      cell = Cell.new('B4')

      expect(cell.ship).to eq (nil)
    end

    it 'has a ship and returns the ship instance' do
      cell = Cell.new('B4')
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.ship).to eq (cruiser)
    end
  end

  describe '#empty' do 
    it 'is empty' do
      cell = Cell.new('B4')

      expect(cell.empty?).to eq (true)
    end

    it 'is not empty when a ship is placed on it' do
      cell = Cell.new('B4')
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.empty?).to eq (false)
    end
  end

  describe '#fired_upon?' do
    it 'is not fired upon' do
      cell = Cell.new('B4')
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.fired_upon?).to eq (false)
    end

    it 'has been fired upon' do
      cell = Cell.new('B4')
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      cell.fire_upon
      expect(cell.fired_upon?).to eq (true)
    end
  end

  describe '#ship.health' do
    it 'can show ship on the cell health' do
      cell = Cell.new('B4')
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.ship.health).to eq (3) 
    end

    it 'can show ship on the cell health goes down when fired upon' do
      cell = Cell.new('B4')
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.ship.health).to eq (3) 
      cell.fire_upon
      expect(cell.fired_upon?).to eq (true)
      expect(cell.ship.health).to eq (2)
    end
  end

  describe '#render' do
    it 'can be rendered when empty' do
      cell_1 = Cell.new('B4')

      expect(cell_1.render).to eq (' .')
    end

    it 'can be rendered to show a miss when it is empty and has been fired upon' do
      cell_1 = Cell.new('B4')

      cell_1.fire_upon
      expect(cell_1.render).to eq (' M')
    end
  
    it 'can be rendered when a ship is placed on it' do
      cell_1 = Cell.new('B4')
      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)

      expect(cell_1.render).to eq (' .')
    end

    it 'can be rendered to show a hit when a ship is placed on it and it has been fired upon' do
      cell_1 = Cell.new('B4')
      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)

      cell_1.fire_upon
      expect(cell_1.render).to eq (' H')
    end

    it 'can be rendered to show if a ship has been placed on it when an optional argument is passed in' do
      cell_1 = Cell.new('B4')
      cruiser = Ship.new("Cruiser", 3)

      cell_1.place_ship(cruiser)
      expect(cell_1.render(true)).to eq (' S')
    end

    it 'can be rendered to show when the ship placed on it has been sunk' do
      cell_1 = Cell.new('B4')
      cell_2 = Cell.new('C4')
      cell_3 = Cell.new('D4')
      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)
      cell_2.place_ship(cruiser)
      cell_3.place_ship(cruiser)

      cell_1.fire_upon
      cell_2.fire_upon
      cell_3.fire_upon
      expect(cruiser.sunk?).to eq (true)
      expect(cell_1.render).to eq (' X')
    end
  end
end