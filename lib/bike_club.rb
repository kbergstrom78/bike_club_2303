require 'time'

class BikeClub
  attr_reader :name,
              :bikers

  def initialize(name)
    @name = name
    @bikers = []
    @rides = []
    @time = Time.now
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    @bikers.max_by do |biker|
      biker.total_logged_rides
    end
  end

  def best_time(ride)
    @bikers.min_by do |biker|
      biker.personal_record(ride)
    end
  end

  def bikers_eligible(ride)
    @bikers.select do |biker|
      biker.good_to_go(ride)
    end
  end

  # def record_group_ride(ride)
  #   start_time = @time
  #   finish_time = start_time
    
  #   group_ride = 
  #   { 
  #     start_time: start_time,
  #     ride: ride,
  #     members: []
  #   }
    
  #   bikers_eligible(ride).each do |biker|
  #     finish_time += rand(60..120)
  #     ride_time = ((finish_time - start_time)/60).to_i
  #   end
  # end
end