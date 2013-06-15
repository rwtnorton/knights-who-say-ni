module KnightsWhoSayNi
  class Board

    attr_reader :width, :height, :width_bounds, :height_bounds

    def initialize(args={})
      @width = args.fetch(:width)
      @height = args.fetch(:height)
      @width_bounds = 0 .. (width - 1)
      @height_bounds = 0 .. (height - 1)
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

    def cover?(position)
      width_bounds === position.row &&
        height_bounds === position.col
    end

    def ===(position)
      cover?(position)
    end

  end
end