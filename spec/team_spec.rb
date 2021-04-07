require './lib/team'
require './lib/player'
require 'rspec'

describe Team do
  context '#initialize' do
    it 'exists' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      team = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      expect(team).to be_instance_of Team
    end
  end

  context '#total_salary' do
    it 'returns the total salary of the team' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      team = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      total_salary = team.total_salary
      expected_total = 1_600_000
      expect(total_salary).to eq expected_total
    end

    it 'returns 0 when no players are present' do
      team = Team.new("AFC Richmond", "Ted Lasso", [])

      total_salary = team.total_salary
      expected_total = 0
      expect(total_salary).to eq expected_total
    end
  end

  context '#captain' do
    it 'returns the first player as captain' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      team = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      expect(team.captain).to eq roy
    end
  end
end
