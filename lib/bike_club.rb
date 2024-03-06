class BikeClub
  attr_reader :name, :bikers

  def initialize(name, bikers)
    @name = name
    @bikers = bikers
  end

  def add_biker(biker)
    @bikers << biker
  end

  # which Biker has logged the most rides?
  def most_rides
    @bikers.sort_by do |biker|
      biker.rides.count
    end.last
    # sum/map over bikers for count of rides
    # sort and take the last value
  end
end
