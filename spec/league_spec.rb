require './lib/league'
require './lib/team'
require './lib/player'
require 'rspec'

describe League do
  context '#initialize' do
    it 'exists' do
      league = League.new("Premier League")
      expect(league).to be_instance_of League
      expect(league.name).to eq "Premier League"
      expect(league.teams).to eq []
    end
  end
end
