class BikeClub
  attr_reader :name, :bikers


  def initialize(name, biker)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  # which Biker has logged the most rides?
  def most_rides
    # sum/map over bikers for count of rides
    # sort and take the last value
  end

end
