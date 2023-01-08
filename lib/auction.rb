class Auction
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(item)
        items << item
    end

    def item_names
        names = []
        items.each do |item|
            names << item.name
        end
        names
    end

    def unpopular_items
        unpopular_items = []
        @items.each do |item|
            unpopular_items << item if item.bids.empty?
        end
        unpopular_items
    end

    def potential_revenue
        total_revenue = 0
        @items.each do |item|
            total_revenue += item.current_high_bid if item.current_high_bid
        end
        total_revenue
    end

    def bidders
        bidders = []
        @items.each do |item|
            bidders.concat(item.bids.keys)
        end
        bidders.uniq
    end
end