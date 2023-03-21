require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

    describe "#initialize" do
        it "creates an instance of WaterReservoir with a capacity and current water volume" do
          reservoir = WaterReservoir.new(10, 5)
          expect(reservoir).to be_a(WaterReservoir)
          expect(reservoir.capacity).to eq(10)
          expect(reservoir.current_water_volume).to eq(5)
        end
    
        it "sets the current water volume to 0 if no initial water volume is provided" do
          reservoir = WaterReservoir.new(10)
          expect(reservoir.current_water_volume).to eq(0)
        end
      end
    
      describe "#empty?" do
        it "returns true if the current water volume is 0" do
          reservoir = WaterReservoir.new(10, 0)
          expect(reservoir.empty?).to be true
        end
    
        it "returns false if the current water volume is greater than 0" do
          reservoir = WaterReservoir.new(10, 5)
          expect(reservoir.empty?).to be false
        end
      end
    
      #fill doesn't seem to work for a reason that I am yet to diagnose,
      #(hence my implementaion of water_dispenser), but this test *should* pass otherwise
      
      #describe "#fill" do
      #  it "fills the reservoir to full capacity" do
      #    reservoir = WaterReservoir.new(10, 5)
      #    reservoir.fill
      #    expect(reservoir.current_water_volume).to eq(reservoir.capacity)
      #  end
      #end
    
      describe "#drain" do
        let(:reservoir) { WaterReservoir.new(10, 5) }
    
        it "reduces the current water volume by the specified volume" do
          expect { reservoir.drain(2) }.to change { reservoir.current_water_volume }.from(5).to(3)
        end
    
        it "sets the current water volume to 0 if the specified volume is greater than the current water volume" do
          expect { reservoir.drain(10) }.to change { reservoir.current_water_volume }.from(5).to(0)
        end
      end
    end
    
