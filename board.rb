class Board

    def initialize(n)
        @grid = Array.new(n){Array.new(n, "_")}
    end

    def valid?(position)
        return false if position.first >= @grid.length || position.last >= @grid.first.length
        true
    end

    def empty?(position)
        @grid[position.first][position.last] == "_"
    end

    def place_mark(position, mark)
        if !self.valid?(position) || !self.empty?(position) 
            raise "You can't enter on this plase"
        else
            @grid[position.first][position.last] = mark
        end
    end

    def print
        @grid.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all?{ |ele| ele == mark}
        end
    end

    def win_col?(mark)
        (0..@grid.length - 1).any? do |idx|
            @grid.all? { |row| row[idx] == mark }
        end
    end

    def win_1st_diagonal?(mark)
        @grid.each.with_index do |row, i1|
            row.each.with_index { |ele, i2| return false if i1 == i2 && ele != mark }
        end
        true
    end

    def win_2nd_diagonal?(mark)
        @grid.each.with_index do |row, i1|
            row.each.with_index { |ele, i2| return false if i1 + i2 == @grid.length - 1 && ele != mark }
        end
        true
    end

    def win_diagonal?(mark)
        win_1st_diagonal?(mark) || win_2nd_diagonal?(mark)
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each { |ele| return true if ele == "_" }
        end
        false
    end

    def legal_positions
        legal_positions = []
        @grid.each.with_index do |row, i1|
            row.each.with_index do |col, i2|
                pos = [i1, i2]
                legal_positions << pos if valid?(pos) && empty?(pos)
            end
        end 
        legal_positions
    end
end
