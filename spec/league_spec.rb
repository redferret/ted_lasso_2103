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

  context '#add_team' do
    it 'adds a team to the league' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      league = League.new("Premier League")
      league.add_team(richmond)
      league.add_team(manchester)
      expected_teams = [richmond, manchester]

      expect(league.teams).to eq expected_teams
    end
  end

  context '#captains' do
    it 'returns the captain of each team' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      league = League.new("Premier League")
      league.add_team(richmond)
      league.add_team(manchester)

      expected_captains = [roy, fernandinho]

      expect(league.captains).to eq expected_captains
    end
  end

  context '#players_by_team' do
    it 'returns hash with team as key and player array as value' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      league = League.new("Premier League")
      league.add_team(richmond)
      league.add_team(manchester)

      expected_hash = {
        richmond => ["Roy Kent", "Sam Obisanya"]
        manchester => ["Jamie Tartt", "Fernandinho"]
      }

      expect(league.players_by_team).to eq expected_hash
    end
  end

end
