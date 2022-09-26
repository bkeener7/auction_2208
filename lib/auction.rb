class Auction
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(item)
        items.push(item)
    end

    def item_names
        items.map(&:name)
    end

    def unpopular_items
        @items.select { |item| item.bids.empty? }
    end

    def items_with_bids
        @items.select { |item| !item.bids.empty? }
    end

    def potential_revenue
        items_with_bids.map {|item| item.current_high_bid }.sum
    end
end