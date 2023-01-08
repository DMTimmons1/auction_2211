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

RSpec.describe Attendee do
    describe "#initialize" do 
        it "exists" do
            attendee = Attendee.new(name: 'Megan', budget: '$50')
            expect(attendee).to be_instance_of(Attendee)
        end

        it "has readable attributes" do
            attendee = Attendee.new(name: 'Megan', budget: '$50')

            expect(attendee.name).to eq('Megan')
            expect(attendee.budget).to eq('$50')
        end
    end
end

RSpec.describe Auction do
    describe "#initialize" do 
        it "exists" do
            auction = Auction.new
            expect(auction).to be_instance_of(Auction)
        end
    end
end