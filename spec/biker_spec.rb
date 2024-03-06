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
  end

end
