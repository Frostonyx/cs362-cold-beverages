require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
    it "empties the reservoir and then fills it" do
        water_reservoir = WaterReservoir.new
        water_dispenser = WaterDispenser.new(water_reservoir)
        reservoir = Vessel.new('liquid', 2)
        water_dispenser.dispense(reservoir)
        
        expect(water_reservoir.current_water_volume).to eq(water_reservoir.capacity)
    end
end