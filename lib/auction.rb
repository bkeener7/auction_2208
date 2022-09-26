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

    def bidders
        bidders = Array.new
        items_with_bids.each do |item|
            item.bids.keys.map { |bidder| bidders.push(bidder.name) }
        end
        bidders.uniq
    end

    def bidder_info
        bidders_hash = Hash.new
        items_with_bids.each do |item|
            item.bids.keys.map do |bidder| 
                bidders_hash[bidder] = Hash.new { |h,k| h[k] = [] }
            end
        end
        items_with_bids.each do |item|
            item.bids.keys.map do |bidder|
                bidders_hash[bidder][:budget] = bidder.budget
                if item.bids.include?(bidder)
                    bidders_hash[bidder][:items] << item
                end
            end
        end
        bidders_hash
    end

    def date
        Date.today.strftime("%d/%m/%Y").to_s
    end

    def close_auction
        high_bidder = Hash.new
        items.each do |item|
            if item.bids == {}
                high_bidder[item] = 'Not Sold'
            else  
                high_bidder[item] = item.bids.max_by { |bidder, bid| bid }.first
            end
        end
        high_bidder
    end
end