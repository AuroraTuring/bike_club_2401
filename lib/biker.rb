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
    @rides.sort
    # A Biker can report its personal record for a specific ride. This is the lowest time recorded for a ride. This method will return false if the Biker hasn't completed the ride.
  end

end
