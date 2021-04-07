require './lib/league'
require './lib/team'
require './lib/player'
require 'rspec'

describe League do
  context '#initialize' do
    it 'exists' do
      league = League.new
      expect(league).to be_instance_of League
    end
  end
end
