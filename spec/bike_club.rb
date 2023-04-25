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

  describe '#most_rides' do
    it 'returns biker with most logged rides' do
      @bike_club.add_biker(@biker)
      @bike_club.add_biker(@biker2)
  
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
  
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
    
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      
      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)
  
      expect(@bike_club.most_rides).to eq(@biker)
    end
  end

  describe '#best_time' do
    it 'returns biker with the fastest ride time' do
      @bike_club.add_biker(@biker)
      @bike_club.add_biker(@biker2)
  
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
  
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
    
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      
      @biker2.log_ride(@ride2, 65.0)
  
      expect(@bike_club.best_time(@ride2)).to eq(@biker)
    end
  end

  describe '#bikers_eligible' do
    it 'returns an array of bikers eligible for a specific ride' do
      @bike_club.add_biker(@biker)
      @bike_club.add_biker(@biker2)
  
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
  
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
    
      @biker2.log_ride(@ride2, 65.0)
  
      expect(@bike_club.bikers_eligible(@ride2)).to eq([@biker])
      
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)

      expect(@bike_club.bikers_eligible(@ride2)).to eq([@biker, @biker2])
    end
  end


end