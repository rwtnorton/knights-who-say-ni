module KnightsWhoSayNi
  class Position

    attr_accessor :row, :col

    def initialize(args={})
      @row = args.fetch(:row)
      @col = args.fetch(:col)
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
