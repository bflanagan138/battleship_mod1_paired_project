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
end