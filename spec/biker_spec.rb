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

    it "logs a personal record" do
      expect(@biker1.personal_record(@ride1)).to eq(91.1)
      expect(@biker1.personal_record(@ride2)).to eq(60.9)

      @biker2.log_ride(@ride1, 97.0) #biker2 doesn't know this terrain yet
      @biker2.log_ride(@ride2, 67.0) #biker2 doesn't know this terrain yet

      expect(@biker2.rides). to eq({})

      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      @biker2.log_ride(@ride1, 95.0) # biker2 can't bike this distance
      @biker2.log_ride(@ride2, 65.0) # biker2 knows this terrain and can bike this distance

      expect(@biker2.rides).to eq({ @ride2 => [65.0] })
      expect(@biker2.personal_record(@ride2)).to eq(65.0)
      expect(@biker2.personal_record(@ride1)).to eq(false)
    end
  end

end
