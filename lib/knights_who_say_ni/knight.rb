require 'set'

module KnightsWhoSayNi
  class Knight

    include Enumerable

    ADJUSTMENTS = [
                   { :row =>  1, :col =>  2 },
                   { :row =>  1, :col => -2 },
                   { :row => -1, :col =>  2 },
                   { :row => -1, :col => -2 },
                   { :row =>  2, :col =>  1 },
                   { :row =>  2, :col => -1 },
                   { :row => -2, :col =>  1 },
                   { :row => -2, :col => -1 },
                  ]

    attr_reader :position

    def initialize(args={})
      @position = args.fetch(:position)
    end

    def moves
      Set.new(ADJUSTMENTS.map { |delta|
                Position[ position.row + delta[:row],
                          position.col + delta[:col] ]
              })
    end

    def each(&blk)
      moves.each(&blk)
    end

    def ==(other)
      position == other.position
    end

    def hash
      position.hash
    end

    def self.[](row, col)
      new(:position => Position[row, col])
    end

  end
end
