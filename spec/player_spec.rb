require './lib/player'
require 'rspec'

describe Player do
  context '#initialize' do
    it 'exists' do
      player = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
      expect(player).to be_instance_of Player
    end
  end
end
