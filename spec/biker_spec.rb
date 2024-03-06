require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
  end

  describe "#initialize" do
    it "exists" do
      expect(@biker1).to be_a(Biker)
    end
    it "has attributes" do
      expect(@biker1.name).to eq("Kenny")
      expect(@biker1.max_distance).to eq(30)
      expect(@biker1.rides).to eq({})
      expect(@biker1.acceptable_terrain).to eq([])
    end
  end

  describe "#methods" do
    it "adds acceptable terrains" do
      @biker1.learn_terrain!(:gravel)
      @biker1.learn_terrain!(:hills)

      expect(@biker1.acceptable_terrain).to eq([:gravel, :hills])
    end

    it "logs rides" do
      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 91.1)
      @biker1.log_ride(@ride2, 60.9)
      @biker1.log_ride(@ride2, 61.6)
      expect(@biker1.rides).to eq({
              @ride1 => [92.5, 91.1],
              @ride2 => [60.9, 61.6]
            })
    end
  end

end
