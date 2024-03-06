class Biker
  attr_reader :name,
              :max_distance,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @acceptable_terrain = []
  end

  def learn_terrain!(type)
    @acceptable_terrain << type
  end

end
