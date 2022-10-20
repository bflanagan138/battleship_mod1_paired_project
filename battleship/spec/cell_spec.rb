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

  it 'does not have a ship' do
    cell = Cell.new('B4')

    expect(cell.ship).to eq (nil)
  end

  it 'is empty' do
    cell = Cell.new('B4')

    expect(cell.empty?).to eq (true)
  end

  it 'has a ship' do
    cell = Cell.new('B4')
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to eq (cruiser)
    expect(cell.empty?).to eq (false)
  end

  it 'may or may not be fired upon' do
    cell = Cell.new('B4')
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq (false)
    cell.fire_upon

    expect(cell.fired_upon?).to eq (true)
  end

  it 'can lose health when fired upon' do
    cell = Cell.new('B4')
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq (2)
    expect(cell.fired_upon?).to eq (true)

  end

  it 'can be rendered' do
    cell_1 = Cell.new('B4')

    expect(cell_1.render).to eq ('.')
    cell_1.fire_upon

    expect(cell_1.render).to eq ('M')

  end

  it 'can render a ship and be fired upon' do
    cell_1 = Cell.new('B4')
    cruiser = Ship.new("Cruiser", 3)
    cell_1.place_ship(cruiser)

    cell_1.fire_upon
    expect(cell_1.render).to eq ('H')
  end

  it 'can render a ship and reveal itself' do
    cell_1 = Cell.new('B4')
    cruiser = Ship.new("Cruiser", 3)
    cell_1.place_ship(cruiser)

    expect(cell_1.render(true)).to eq ('S')
  end

  it 'can sink ship' do
    cell_1 = Cell.new('B4')
    cruiser = Ship.new("Cruiser", 3)
    cell_1.place_ship(cruiser)

    expect(cruiser.sunk?).to eq (false)
    3.times do cruiser.hit
    end
    expect(cruiser.sunk?).to eq (true)
    expect(cell_1.render).to eq ('X')
  end
end
