require './lib/player'
require 'rspec'

describe Player do
  context '#initialize' do
    it 'exists' do
      player = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
      expect(player).to be_instance_of Player
      expect(player.name).to eq "Roy Kent"
      expect(player.position).to eq "Center Midfielder"
      expect(player.salary).to eq 1_000_000
    end
  end
end
