Graded Items:

1. Create a Biker with attributes and a way to read that data
2. A Biker has a list of acceptable terrain and can learn new terrain
3. Bikers can log a ride with a time. The Biker can keep track of all of its previous rides and times for those rides.
4. A Biker will not log a ride if the ride's terrain does not match their acceptable terrain. They also won't log a ride if the ride's total distance is greater than the Biker's max distance.
5. A Biker can report its personal record for a specific ride. This is the lowest time recorded for a ride. This method will return false if the Biker hasn't completed the ride.


<!-- pry(main)> require './lib/ride'
# => true

pry(main)> require './lib/biker'
# => true

pry(main)> biker = Biker.new("Kenny", 30)
# => #<Biker:0x00007fc62ca41150...>

pry(main)> biker.name
# => "Kenny"

pry(main)> biker.max_distance
# => 30

pry(main)> biker.rides
# => {}

pry(main)> biker.acceptable_terrain
# => []

pry(main)> biker.learn_terrain!(:gravel)

pry(main)> biker.learn_terrain!(:hills)

pry(main)> biker.acceptable_terrain
# => [:gravel, :hills]

pry(main)> ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
# => #<Ride:0x00007fc62ca32a10...>

pry(main)> ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
# => #<Ride:0x00007fc62cb42ba8...>

pry(main)> biker.log_ride(ride1, 92.5)

pry(main)> biker.log_ride(ride1, 91.1)

pry(main)> biker.log_ride(ride2, 60.9)

pry(main)> biker.log_ride(ride2, 61.6)

pry(main)> biker.rides
# => {
#      #<Ride:0x00007fc62ca32a10...> => [92.5, 91.1],
#      #<Ride:0x00007fc62cb42ba8...> => [60.9, 61.6]
#    } -->

pry(main)> biker.personal_record(ride1)
=> 91.1

pry(main)> biker.personal_record(ride2)
=> 60.9

pry(main)> biker2 = Biker.new("Athena", 15)
=> #<Biker:0x00007fc62cb399e0...>

pry(main)> biker2.log_ride(ride1, 97.0) #biker2 doesn't know this terrain yet

pry(main)> biker2.log_ride(ride2, 67.0) #biker2 doesn't know this terrain yet

pry(main)> biker2.rides
# => {}

pry(main)> biker2.learn_terrain!(:gravel)

pry(main)> biker2.learn_terrain!(:hills)

pry(main)> biker2.log_ride(ride1, 95.0) # biker2 can't bike this distance

pry(main)> biker2.log_ride(ride2, 65.0) # biker2 knows this terrain and can bike this distance

pry(main)> biker2.rides
#=> { #<Ride:0x00007fc62cb42ba8...> => [65.0] }

pry(main)> biker2.personal_record(ride2)
#=> 65.0

pry(main)> biker2.personal_record(ride1)
#=> false
