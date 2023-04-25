class Ride
  attr_reader :name,
              :distance,
              :terrain,
              :loop

  def initialize(info)
    @name = info[:name]
    @distance = info[:distance]
    @terrain = info[:terrain]
    @loop = info[:loop]

  end

  def loop?
    @loop
  end
end