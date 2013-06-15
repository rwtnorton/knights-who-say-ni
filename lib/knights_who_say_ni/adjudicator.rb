require 'set'

module KnightsWhoSayNi
  class Adjudicator

    attr_reader :board, :knight

    def initialize(args={})
      @board = args.fetch(:board)
      @knight = args.fetch(:knight)
    end

    def legal_moves
      Set.new(knight.moves.select { |move| board.cover? move })
    end

  end
end
