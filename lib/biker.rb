class Biker
  attr_reader :name,
              :max_distance,
              :acceptable_terrain,
              :rides

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @acceptable_terrain = []
    @rides = {}
  end

  def learn_terrain!(type)
    @acceptable_terrain << type
  end

  def log_ride(ride, distance)
    @rides[ride] = [] if @rides[ride].nil?
    @rides[ride] << distance
  end

  def personal_record(ride)

  end

end
