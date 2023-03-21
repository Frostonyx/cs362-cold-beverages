require_relative '../lib/item'

describe 'An item of food or a beverage' do
    describe "#initialize" do
        it "creates an instance of Item with a name and volume" do
          item = Item.new("Bottles of Beer", 99)
          expect(item).to be_a(Item)
          expect(item.name).to eq("Bottles of Beer")
          expect(item.volume).to eq(99)
        end
      end
end
