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

    def to_ary
      [row, col]
    end
    alias_method :to_a, :to_ary # Supports splatting.

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
