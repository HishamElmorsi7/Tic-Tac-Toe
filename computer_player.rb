class ComputerPlayer
    attr_reader :mark

    def initialize(mark)
        @mark =  mark
    end

    def get_position(legal_positions)
        pick = legal_positions.sample
        puts "The computer #{@mark} chose #{pick}"
        pick
    end

end