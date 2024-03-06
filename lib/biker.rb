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

  # A Biker will not log a ride if the ride's terrain does not match their acceptable terrain. They also won't log a ride if the ride's total distance is greater than the Biker's max distance.
  def log_ride(ride, distance)
    return if !@acceptable_terrain.include?(ride.terrain)
    return if ride.total_distance > @max_distance
    @rides[ride] ||= []
    # @rides[ride] = [] if @rides[ride].nil?
    @rides[ride] << distance
  end

  # A Biker can report its personal record for a specific ride. This is the lowest time recorded for a ride. This method will return false if the Biker hasn't completed the ride.
  def personal_record(ride)
    @rides[ride] ||= []
    @rides[ride].sort.first || false
  end
end
