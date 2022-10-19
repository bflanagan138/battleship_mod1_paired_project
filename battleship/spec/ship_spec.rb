require 'rspec'
require './lib/ship'

RSpec.describe Ship do

  it 'exists and has attributes' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_a(Ship)
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
  end

  it 'loses health when hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    expect(cruiser.health).to eq(2)
    cruiser.hit
    expect(cruiser.health).to eq(1)
  end

  it 'it is not sunk' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
  end

  it 'it can sink when hit as many times as it is long' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
    end

end
