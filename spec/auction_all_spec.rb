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

    describe "#add_items" do
        it "adds items to the auction" do
            auction = Auction.new

            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')

            auction.add_item(item1)
            auction.add_item(item2)

            expect(auction.items).to eq([item1, item2])
        end

        it "can list the names of the items from the acution class" do 
            auction = Auction.new

            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')

            auction.add_item(item1)
            auction.add_item(item2)
            
            expect(auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
        end
    end

    describe "#add_bid" do
        it "tests if there are no bids on the item" do
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')
            item3 = Item.new('Homemade Chocolate Chip Cookies')
            item4 = Item.new('2 Days Dogsitting')
            item5 = Item.new('Forever Stamps')

            attendee1 = Attendee.new(name: 'Megan', budget: '$50')
            attendee2 = Attendee.new(name: 'Bob', budget: '$75')
            attendee3 = Attendee.new(name: 'Mike', budget: '$100')

            auction = Auction.new

            auction.add_item(item1)
            auction.add_item(item2)
            auction.add_item(item3)
            auction.add_item(item4)
            auction.add_item(item5)

            expect(item1.bids).to eq({})
        end
        it "tests if attendees can bid on an item with a bid amount" do
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')
            item3 = Item.new('Homemade Chocolate Chip Cookies')
            item4 = Item.new('2 Days Dogsitting')
            item5 = Item.new('Forever Stamps')

            attendee1 = Attendee.new(name: 'Megan', budget: '$50')
            attendee2 = Attendee.new(name: 'Bob', budget: '$75')
            attendee3 = Attendee.new(name: 'Mike', budget: '$100')

            auction = Auction.new

            auction.add_item(item1)
            auction.add_item(item2)
            auction.add_item(item3)
            auction.add_item(item4)
            auction.add_item(item5)

            item1.add_bid(attendee2, 20)
            item1.add_bid(attendee1, 22)

            expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
        end
    end
    describe "#current_high_bid" do 
        it "can tell what the current hishest bid is" do
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')
            item3 = Item.new('Homemade Chocolate Chip Cookies')
            item4 = Item.new('2 Days Dogsitting')
            item5 = Item.new('Forever Stamps')

            attendee1 = Attendee.new(name: 'Megan', budget: '$50')
            attendee2 = Attendee.new(name: 'Bob', budget: '$75')
            attendee3 = Attendee.new(name: 'Mike', budget: '$100')

            auction = Auction.new

            auction.add_item(item1)
            auction.add_item(item2)
            auction.add_item(item3)
            auction.add_item(item4)
            auction.add_item(item5)

            item1.add_bid(attendee2, 20)
            item1.add_bid(attendee1, 22)

            expect(item1.current_high_bid).to eq(22)
        end
    end
    describe "#unpopular_items" do
        it "can tell what the unpopular items are based on the ammount of bids" do
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')
            item3 = Item.new('Homemade Chocolate Chip Cookies')
            item4 = Item.new('2 Days Dogsitting')
            item5 = Item.new('Forever Stamps')

            attendee1 = Attendee.new(name: 'Megan', budget: '$50')
            attendee2 = Attendee.new(name: 'Bob', budget: '$75')
            attendee3 = Attendee.new(name: 'Mike', budget: '$100')

            auction = Auction.new

            auction.add_item(item1)
            auction.add_item(item2)
            auction.add_item(item3)
            auction.add_item(item4)
            auction.add_item(item5)

            item1.add_bid(attendee2, 20)
            item1.add_bid(attendee1, 22)
            item4.add_bid(attendee3, 50)

            expect(auction.unpopular_items).to eq([item2, item3, item5])
        end
    end
    describe "#potential_revenue" do
        it "can tell what the potental revenue is based on the ammount of bids" do
            item1 = Item.new('Chalkware Piggy Bank')
            item2 = Item.new('Bamboo Picture Frame')
            item3 = Item.new('Homemade Chocolate Chip Cookies')
            item4 = Item.new('2 Days Dogsitting')
            item5 = Item.new('Forever Stamps')

            attendee1 = Attendee.new(name: 'Megan', budget: '$50')
            attendee2 = Attendee.new(name: 'Bob', budget: '$75')
            attendee3 = Attendee.new(name: 'Mike', budget: '$100')

            auction = Auction.new

            auction.add_item(item1)
            auction.add_item(item2)
            auction.add_item(item3)
            auction.add_item(item4)
            auction.add_item(item5)

            item1.add_bid(attendee2, 20)
            item1.add_bid(attendee1, 22)
            item4.add_bid(attendee3, 50)
            item3.add_bid(attendee2, 15)

            expect(auction.potential_revenue).to eq(87)
        end
    end
end