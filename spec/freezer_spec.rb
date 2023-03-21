require_relative '../lib/freezer'

describe 'A freezer' do
    describe '#initialize' do
        context 'when no capacity is provided' do
          it 'sets the default capacity to 100' do
            freezer = Freezer.new
            expect(freezer.capacity).to eq(100)
          end
        end
    
        context 'when a capacity is provided' do
          it 'sets the capacity to the provided value' do
            freezer = Freezer.new(200)
            expect(freezer.capacity).to eq(200)
          end
        end
    
        it 'sets the temperature to the room temperature' do
          freezer = Freezer.new
          expect(freezer.temperature).to eq(Freezer::ROOM_TEMPERATURE)
        end
    
        it 'sets the power to off' do
          freezer = Freezer.new
          expect(freezer.instance_variable_get(:@power)).to eq(:off)
        end
    
        it 'sets the contents to an empty array' do
          freezer = Freezer.new
          expect(freezer.instance_variable_get(:@contents)).to be_empty
        end
      end
    
      describe '#turn_on' do
        it 'changes the power to on' do
          freezer = Freezer.new
          freezer.turn_on
          expect(freezer.instance_variable_get(:@power)).to eq(:on)
        end
      end
    
      describe '#turn_off' do
        it 'changes the power to off' do
          freezer = Freezer.new
          freezer.turn_on
          freezer.turn_off
          expect(freezer.instance_variable_get(:@power)).to eq(:off)
        end
      end
    
      describe '#add' do
        it 'adds the item to the contents' do
          freezer = Freezer.new
          pizza = Item.new('Leftover Pizza', 5)
          freezer.add(pizza)
          expect(freezer.instance_variable_get(:@contents)).to include(pizza)
        end
      end
    
      describe '#remaining_capacity' do
        it 'returns the remaining capacity' do
          freezer = Freezer.new(50)
          pizza = Item.new('Leftover Pizza', 5)
          dreamsicle = Item.new('Dreamsicle', 1)
          freezer.add(pizza)
          expect(freezer.remaining_capacity).to eq(45)
          freezer.add(dreamsicle)
          expect(freezer.remaining_capacity).to eq(44)
        end
      end
    
      describe '#set_level' do
        it 'sets the temperature based on the level' do
          freezer = Freezer.new
          freezer.set_level(1)
          expect(freezer.temperature).to eq(60)
          freezer.set_level(2)
          expect(freezer.temperature).to eq(50)
        end
      end
end
