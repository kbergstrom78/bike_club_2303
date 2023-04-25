class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain
  
  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = Hash.new([])
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if @acceptable_terrain.include?(ride.terrain) && @max_distance >= ride.total_distance
      @rides[ride] += [time]
    end 
  end


  def personal_record(ride)
    if @rides.keys.include?(ride)
      @rides[ride].min
    else
      false
    end


  end

  # lowest time recorded for a ride
  # returns false if biker has completed the ride

end