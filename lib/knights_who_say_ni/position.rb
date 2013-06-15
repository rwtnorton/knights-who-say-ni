module KnightsWhoSayNi
  class Position

    attr_reader :row, :col

    def initialize(args={})
      @row = args.fetch(:row)
      @col = args.fetch(:col)
    end

    def with_row(new_row)
      self.class.new(:row => new_row, :col => col)
    end

    def with_col(new_col)
      self.class.new(:row => row, :col => new_col)
    end

    # Supports splatting.
    def to_a
      [row, col]
    end

    def ==(other)
      row == other.row && col == other.col
    end

    def hash
      row.hash + col.hash
    end

    def to_s
      "(#{row}, #{col})"
    end

    def self.[](row, col)
      new(:row => row, :col => col)
    end

  end
end
