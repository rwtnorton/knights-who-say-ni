module KnightsWhoSayNi
  class Board

    attr_reader :width, :height

    def initialize(args={})
      @width = args.fetch(:width)
      @height = args.fetch(:height)
    end

    def self.[](width, height)
      new(:width => width, :height => height)
    end

    def to_s
      "[#{width} x #{height}]"
    end

    def to_a
      [width, height]
    end

    def width_bounds
      0 .. (width - 1)
    end

    def height_bounds
      0 .. (height - 1)
    end

    def bounds
      [width_bounds, height_bounds]
    end

    def cover?(position)
      width_bounds === position.row &&
        height_bounds === position.col
    end

    def ===(position)
      cover?(position)
    end

  end
end
