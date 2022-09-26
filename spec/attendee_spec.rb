require 'spec_helper'

RSpec.describe Attendee do
    let(:attendee1) {Attendee.new({name: 'Megan', budget: '$50'})}
    let(:attendee2) {Attendee.new({name: 'Bob', budget: '$75'})}
    let(:attendee3) {Attendee.new({name: 'Mike', budget: '$100'})}

    it '1. exists' do
        expect(attendee1).to be_an_instance_of(Attendee)
    end

    it '2. has a name' do
        expect(attendee1.name).to eq "Megan"
    end

    it '3. has a budget' do
        expect(attendee1.budget).to eq 50
    end
end