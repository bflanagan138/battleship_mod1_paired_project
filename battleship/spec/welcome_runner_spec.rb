require './lib/welcome'

RSpec.describe Welcome do
  it 'exists' do
    welcome = Welcome.new
    expect(welcome).to be_a Welcome
  end

  it '#start' do
    welcome = Welcome.new

    expect(welcome.start).to eq ("Welcome to BATTLESHIP\n" + "Enter p to play. Enter q to quit")
  end
end