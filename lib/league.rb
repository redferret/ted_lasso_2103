class League
  attr_reader :name, :teams

  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    @teams.map do |team|
      team.captain
    end
  end

  def players_by_team
    players_by_team_hash = Hash.new {|hash, new_key| hash[new_key] = []}
    @teams.each do |team|
      team.players.each do |player|
       players_by_team_hash[team] << player.name
      end
    end
    return players_by_team_hash
  end

  def most_expensive_player
    team_with_most_expensive_player = @teams.max do |team_a, team_b|
      team_a.captain.salary <=> team_b.captain.salary
    end
    return [team_with_most_expensive_player.captain]
  end

  def players_by_salary_range
    players_by_salary_range_hash = Hash.new {|hash, key| hash[key] = []}

    @teams.each do |team|
      6.times do |salary_range|
        players_in_range = team.players.find_all do |player|
          player.salary >= (salary_range * 1_000_000) and
          player.salary < ((salary_range + 1) * 1_000_000)
        end
        players_in_range = players_in_range.map do |player|
          player.name
        end

        players_by_salary_range_hash["Over #{salary_range}M"] += players_in_range
      end
    end
    return players_by_salary_range_hash
  end

end
