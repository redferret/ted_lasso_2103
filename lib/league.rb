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
    teams.map do |team|
      team.captain
    end
  end

  def players_by_team
    players_by_team_hash = Hash.new {|hash, new_key| hash[new_key] = []}
    teams.each do |team|
      team.players.each do |player|
       players_by_team_hash[team] << player.name
      end
    end
    return players_by_team_hash
  end

end
