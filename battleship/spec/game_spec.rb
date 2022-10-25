require './lib/game'

RSpec.describe Game do
  it 'exists' do
    game = Game.new

    expect(game).to be_a (Game)
  end
end