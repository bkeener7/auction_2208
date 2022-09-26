require 'spec_helper'

RSpec.describe Item do
    let(:attendee1) {Attendee.new({name: 'Megan', budget: '$50'})}
    let(:attendee2) {Attendee.new({name: 'Bob', budget: '$75'})}
    let(:attendee3) {Attendee.new({name: 'Mike', budget: '$100'})}
    let(:item1) {Item.new('Chalkware Piggy Bank')}
    let(:item2) {Item.new('Bamboo Picture Frame')}
    let(:item3) {Item.new('Homemade Chocolate Chip Cookies')}
    let(:item4) {Item.new('2 Days Dogsitting')}
    let(:item5) {Item.new('Forever Stamps')}
    
    it '1. exists' do
        expect(item1).to be_an_instance_of(Item)
    end

    it '2. has a name' do
        expect(item1.name).to eq "Chalkware Piggy Bank"
    end

    it '3. has no bids by default' do
        expect(item1.bids).to eq({})
    end

    it '4. can store bids' do
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)
        expect(item1.bids).to eq({
            attendee2 => 20,
            attendee1 => 22
        })
    end

    it '5. can return the highest bid' do
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)
        expect(item1.current_high_bid).to eq 22
    end

    it '6. can close to additional bids' do
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)
        item4.add_bid(attendee3, 50)
        item3.add_bid(attendee2, 15)
        expect(item1.bids).to eq ({
            attendee2 => 20,
            attendee1 => 22
        })
        
        item1.close_bidding
        item1.add_bid(@attendee3, 70)
        expect(item1.bids).to eq ({
            attendee2 => 20,
            attendee1 => 22
        }) 
    end
end