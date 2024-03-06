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

  end

end
