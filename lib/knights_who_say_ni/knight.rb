require 'set'

module KnightsWhoSayNi
  class Knight

    include Enumerable

    ADJUSTMENTS = lambda do
      vs = [-2, -1, 1, 2]
      vs.product(vs).reject { |x, y| x.abs == y.abs }
    end.call

    attr_reader :position

    def initialize(args={})
      @position = args.fetch(:position)
    end

    def moves
      Set.new(ADJUSTMENTS.map { |row, col|
                Position[position.row + row,
                         position.col + col]
              })
    end

    def threaten?(piece)
      row = piece.position.row
      col = piece.position.col
      moves.member? Position[row, col]
    end

    def each(&blk)
      moves.each(&blk)
    end

    def ==(other)
      position == other.position
    end

    def eql?(other)
      position.eql? other.position
    end

    def hash
      position.hash
    end

    def self.[](row, col)
      new(:position => Position[row, col])
    end

  end
end
