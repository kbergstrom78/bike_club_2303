require 'rspec'
require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe '#initialize' do  
    it 'exists' do
      expect(@biker).to be_an_instance_of(Biker)
    end
  
    it 'has attributes' do
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe '#learn_terrain' do
    it 'can learn terrain' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe '#log_ride' do
    it 'logs a ride with a time' do 
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expected = {
        @ride1 => [92.5, 91.1],
        @ride2 => [60.9, 61.6]
      }

      expect(@biker.rides).to eq(expected)
    end
  end

  describe '#personal_record' do
    it 'reports biker pr' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end
  end


end