require './lib/ride'
require './lib/biker'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new({name: "Kool Kids Klub", bikers: []})
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
  end

  describe "#initialize" do
    it "has attributes" do

    end
  end


end
