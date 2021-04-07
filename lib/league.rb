class League
  attr_reader :name, :teams

  def initialize(name)
    @name = name
    @teams = []
  end
end
