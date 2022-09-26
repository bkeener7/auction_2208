require 'spec_helper'

RSpec.describe Item do
    let(:item1) {Item.new('Chalkware Piggy Bank')}
    let(:item2) {Item.new('Bamboo Picture Frame')}
    
    it '1. exists' do
        expect(item1).to be_an_instance_of(Item)
    end

    it '2. has a name' do
        expect(item1.name).to eq "Chalkware Piggy Bank"
    end
end