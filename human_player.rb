class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark =  mark
    end

    def get_position(legal_positions)
        alphabits = ("a".."z").to_a
        puts "Player #{mark.to_s}, enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split(' ')
        while (!legal_positions.include? ( pos.map(&:to_i) ) ) || ( pos.any? { |i| alphabits.include?(i) } )
            puts "invalid_position Enter again"
            pos = gets.chomp.split(' ')
        end

        pos.map(&:to_i)
    end
end

