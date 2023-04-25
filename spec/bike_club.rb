require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club = BikeClub.new('Kicking Asphalt')
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@bike_club).to be_an_instance_of(BikeClub)
    end
  
    it 'has attributes' do
      expect(@bike_club.name).to eq('Kicking Asphalt')
      expect(@bike_club.bikers).to eq([])
    end
  end

  describe '#add_bikers' do
    it 'adds bikers to the club' do
      @bike_club.add_biker(@biker)
      @bike_club.add_biker(@biker2)
      expect(@bike_club.bikers).to eq([@biker, @biker2])
    end
  end

end