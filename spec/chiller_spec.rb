require_relative '../lib/chiller'

describe 'A chiller' do

    describe '#initialize' do
        it 'sets the capacity to 100' do
          chiller = Chiller.new
          expect(chiller.capacity).to eq(100)
        end
    
        it 'sets the temperature to ROOM_TEMPERATURE' do
          chiller = Chiller.new
          expect(chiller.temperature).to eq(Chiller::ROOM_TEMPERATURE)
        end
    
        it 'sets the power to :off' do
          chiller = Chiller.new
          expect(chiller.instance_variable_get(:@power)).to eq(:off)
        end
    
        it 'sets the contents to an empty array' do
          chiller = Chiller.new
          expect(chiller.instance_variable_get(:@contents)).to eq([])
        end
    
        it 'sets the capacity to the given value' do
          chiller = Chiller.new(50)
          expect(chiller.capacity).to eq(50)
        end
      end
    
      describe '#turn_on' do
        it 'sets the power to on' do
          chiller = Chiller.new
          chiller.turn_on
          expect(chiller.instance_variable_get(:@power)).to eq(:on)
        end
      end
    
      describe '#turn_off' do
        it 'sets the power to off' do
          chiller = Chiller.new
          chiller.turn_on
          chiller.turn_off
          expect(chiller.instance_variable_get(:@power)).to eq(:off)
        end
      end
    
      describe '#add' do
        it 'adds an item to the contents array' do
          chiller = Chiller.new
          soda = Item.new('Dr. Pepper', 1)
          chiller.add(soda)
          expect(chiller.instance_variable_get(:@contents)).to include(soda)
        end
      end
    
      describe '#remaining_capacity' do
        it 'returns the remaining capacity' do
          chiller = Chiller.new
          soda = Item.new('Dr. Pepper', 1)
          watermelon = Item.new('Watermelon', 29)
          chiller.add(soda)
          chiller.add(watermelon)
          expect(chiller.remaining_capacity).to eq(70)
        end
      end
    
      describe '#set_level' do
        it 'sets the temperature based on the level' do
          chiller = Chiller.new
          chiller.set_level(2)
          expect(chiller.temperature).to eq(60)
        end
      end
end
