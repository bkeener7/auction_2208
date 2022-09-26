class Item
    attr_reader :name,
                :bids

    def initialize(name)
        @name = name
        @bids = {}
    end

    def add_bid(bidder, bid)
        unless bids.frozen?
            bids[bidder] = bid
        end
    end

    def current_high_bid
        bids.max_by { |bidder, bid| bid }.last
    end

    def close_bidding
        bids.freeze
    end
end