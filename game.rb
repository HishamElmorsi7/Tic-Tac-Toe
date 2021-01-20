require "./board.rb"
require "./human_player.rb"
require "./computer_player.rb"
class Game

    def initialize(board_size, players_hash)
        @players = []
        players_hash.each do |mark, is_computer|
            is_computer ? @players << ComputerPlayer.new(mark) : @players << HumanPlayer.new(mark)
        end
        @current_player = @players.first
        @board = Board.new(board_size)
    end

    def switch_turn
        @players.rotate!
        @current_player = @players.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position(@board.legal_positions)
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory, player #{@current_player.mark} won ;) "
                return
            else
                self.switch_turn
            end

        end

        puts "Game Over ;"
    end
    
end

