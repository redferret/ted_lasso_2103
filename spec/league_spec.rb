require './lib/league'
require './lib/team'
require './lib/player'
require 'rspec'

describe League do

  before :each do
    @roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    @sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    @richmond = Team.new("AFC Richmond", "Ted Lasso", [@roy, @sam])

    @jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    @fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    @manchester = Team.new("Manchester City FC", "Pep Guardiola", [@jamie, @fernandinho])

    @league = League.new("Premier League")
    @league.add_team(@richmond)
    @league.add_team(@manchester)
  end

  context '#initialize' do
    it 'exists' do
      @league = League.new("Premier League")
      expect(@league).to be_instance_of League
      expect(@league.name).to eq "Premier League"
      expect(@league.teams).to eq []
    end
  end

  context '#add_team' do
    it 'adds a team to the league' do
      expected_teams = [@richmond, @manchester]
      expect(@league.teams).to eq expected_teams
    end
  end

  context '#captains' do
    it 'returns the captain of each team' do
      expected_captains = [@roy, @fernandinho]
      expect(@league.captains).to eq expected_captains
    end
  end

  context '#players_by_team' do
    it 'returns hash with team as key and player array as value' do
      expected_hash = {
        @richmond => ["Roy Kent", "Sam Obisanya"],
        @manchester => ["Jamie Tartt", "Fernandinho"]
      }

      expect(@league.players_by_team).to eq expected_hash
    end
  end

  context '#most_expensive_player' do
    it 'returns the most expensive player in the league' do

      most_expensive_player = @league.most_expensive_player
      expected_player = [@fernandinho]

      expect(most_expensive_player).to eq expected_player
    end
  end

  context '#players_by_salary_range' do
    it 'returns each players sorted by range in a hash' do

      expected_hash = {
       "Over 0M" => ["Sam Obisanya"],
       "Over 1M" => ["Roy Kent", "Jamie Tartt"],
       "Over 2M" => [],
       "Over 3M" => [],
       "Over 4M" => [],
       "Over 5M" => ["Fernandinho"],
     }

     players_by_salary_range_hash = @league.players_by_salary_range

     expect(players_by_salary_range_hash).to eq expected_hash
    end
  end

end
