class Team
  attr_reader :name, :coach, :players

  def initialize(name, coach, players)
    @name = name
    @coach = coach
    @players = players
  end

  def total_salary
    players.inject(0) do |total, player|
      total + player.salary
    end
  end

  def captain
    players.first
  end

  def positions_filled
    players.map do |player|
      player.position
    end
  end
end
