require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/turn'
require './lib/player'

RSpec.describe Player do
  it 'exists' do
    player_1 = Player.new
    computer = Player.new

    expect(player_1).to be_a (Player)
    expect(computer).to be_a (Player)
  end
end