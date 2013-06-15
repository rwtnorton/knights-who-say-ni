require 'set'

module KnightsWhoSayNi
  class FieldMarshal

    attr_reader :board

    def initialize(args={})
      @board = args.fetch(:board)
      @positions = Set.new(board.positions)
    end

    def pairings
      positions.map { |white_pos|
        legal_black_moves(white_pos).map { |black_pos|
          { :white => white_pos, :black => black_pos }
        }
      }.flatten.to_set
    end

    def self.[](rows, cols)
      new(:board => Board[rows, cols])
    end

private

    attr_reader :positions

    def adjudicator_for_knight(knight)
      Adjudicator.new(:board => board, :knight => knight)
    end

    def adjudicator_for_position(position)
      adjudicator_for_knight(knight_at(position))
    end

    def knight_at(position)
      Knight.new(:position => position)
    end

    def legal_white_moves(white_pos)
      adjudicator_for_position(white_pos).legal_moves
    end

    def legal_black_moves(white_pos)
      positions.difference(Set[white_pos])
        .difference(legal_white_moves(white_pos))
    end

  end
end
