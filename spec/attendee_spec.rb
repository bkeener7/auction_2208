require 'spec_helper'

RSpec.describe Attendee do
    let(:attendee) {Attendee.new({name: 'Megan', budget: '$50'})}

    it '1. exists' do
        expect(attendee).to be_an_instance_of(Attendee)
    end

    it '2. has a name' do
        expect(attendee.name).to eq "Megan"
    end

    it '3. has a budget' do
        expect(attendee.budget).to eq 50
    end
end