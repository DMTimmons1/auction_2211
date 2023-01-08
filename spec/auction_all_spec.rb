require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
    describe "#initialize" do
        it "exists" do
            item1 = Item.new('Chalkware Piggy Bank')
            expect(item1).to be_instance_of(Item)
        end

        it "has readable attributes" do
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')

            expect(item1.name).to eq('Chalkware Piggy Bank')
            expect(item2.name).to eq('Bamboo Picture Frame')
        end
    end
end