require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  before(:each) do
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @bikers = [@biker1, @biker2]
    @bike_club1 = BikeClub.new("Kool Kids Klub", @bikers)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#initialize" do
    it "has attributes" do
      expect(@bike_club1.name).to eq("Kool Kids Klub")
    end
  end

  describe "#methods" do
    it "can tell which biker logged the most rides" do
      @biker1.learn_terrain!(:gravel)
      @biker1.learn_terrain!(:hills)

      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 91.1)
      @biker1.log_ride(@ride2, 60.9)
      @biker1.log_ride(@ride2, 61.6)
      @biker2.log_ride(@ride1, 73.4)

      expect(@bike_club1.most_rides).to eq(@biker1)
    end
  end
end
