require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
    describe "#initialize" do
        it "exists" do
            item1 = Item.new('Chalkware Piggy Bank')
            expect(item1).to be_instance_of(Item)
        end
    end
end