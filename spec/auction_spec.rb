require 'spec_helper'

RSpec.describe Auction do
    let(:auction) {Auction.new}
    let(:attendee1) {Attendee.new({name: 'Megan', budget: '$50'})}
    let(:attendee2) {Attendee.new({name: 'Bob', budget: '$75'})}
    let(:attendee3) {Attendee.new({name: 'Mike', budget: '$100'})}
    let(:item1) {Item.new('Chalkware Piggy Bank')}
    let(:item2) {Item.new('Bamboo Picture Frame')}
    let(:item3) {Item.new('Homemade Chocolate Chip Cookies')}
    let(:item4) {Item.new('2 Days Dogsitting')}
    let(:item5) {Item.new('Forever Stamps')}

    it '1. exists' do
        expect(auction).to be_an_instance_of(Auction)
    end

    it '2. has no items by default' do
        expect(auction.items).to eq []
    end

    it '3. can add items' do
        auction.add_item(item1)
        auction.add_item(item2)
        expect(auction.items).to eq [item1, item2]
        expect(auction.item_names).to eq ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
    end

    it '4. can list items with no bids' do
        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)
        item4.add_bid(attendee3, 50)
        expect(auction.unpopular_items).to eq [item2, item3, item5]
        item3.add_bid(attendee2, 15)
        expect(auction.unpopular_items).to eq [item2, item5]
    end

    it '5. can list items with bids' do
        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)
        item4.add_bid(attendee3, 50)
        item3.add_bid(attendee2, 15)
        expect(auction.items_with_bids).to eq [item1, item3, item4]
    end

   it '6 can determine potential revenue' do
        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)
        item4.add_bid(attendee3, 50)
        item3.add_bid(attendee2, 15)
        expect(auction.potential_revenue).to eq 87
    end

    it '7. can list bidders' do
        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)
        item4.add_bid(attendee3, 50)
        item3.add_bid(attendee2, 15)
        expect(auction.bidders).to include("Megan", "Bob", "Mike")
    end

    it '8. can return bidder info' do
        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)
        item3.add_bid(attendee2, 15)
        item4.add_bid(attendee3, 50)
        item1.close_bidding
        item1.add_bid(@attendee3, 70)
        
        expect(auction.bidder_info).to eq({
            attendee2 => 
            {
                :budget => 75,
                :items => [item1, item3]
            },
            attendee1 =>
            {
                :budget => 50,
                :items => [item1]
            },
            attendee3 =>
            {
                :budget => 100,
                :items => [item4]
            }
        })
    end
end