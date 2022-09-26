class Attendee
        attr_reader :attendee_hash

    def initialize(attendee_hash)
        @attendee_hash = attendee_hash
    end

    def name
        attendee_hash[:name]
    end

    def budget
        attendee_hash[:budget][1..-1].to_i
    end
end