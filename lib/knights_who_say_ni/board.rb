module KnightsWhoSayNi
  class Board

    include Enumerable

    attr_reader :cols, :rows, :col_bounds, :row_bounds

    def initialize(args={})
      @cols = args.fetch(:cols)
      @rows = args.fetch(:rows)
      @col_bounds = 0 .. (cols - 1)
      @row_bounds = 0 .. (rows - 1)
    end

    def self.[](rows, cols)
      new(:rows => rows, :cols => cols)
    end

    def to_s
      "[#{rows} x #{cols}]"
    end

    def to_a
      [rows, cols]
    end

    def cover?(position)
      col_bounds === position.col &&
        row_bounds === position.row
    end

    def ===(position)
      cover?(position)
    end

    def positions
      row_bounds.to_a.product(col_bounds.to_a).map { |r, c|
        Position[r, c]
      }
    end

    def each(&blk)
      positions.each(&blk)
    end

  end
end
