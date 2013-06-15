require 'set'

module KnightsWhoSayNi
  class FieldMarshal

    attr_reader :board

    def initialize(args={})
      @board = args.fetch(:board)
    end

    def pairings
      result = Set.new
      positions = Set.new(board.positions)
      positions.each do |white_pos|
        legal_white_moves = adjudicator_for_position(white_pos).legal_moves
        legal_black_moves = positions.difference(Set[white_pos])
          .difference(legal_white_moves)
        legal_black_moves.each do |black_pos|
          result << { :white => white_pos, :black => black_pos }
        end
      end
      result
    end

    def self.[](rows, cols)
      new(:board => Board[rows, cols])
    end

private

    def adjudicator_for_knight(knight)
      Adjudicator.new(:board => board, :knight => knight)
    end

    def adjudicator_for_position(position)
      adjudicator_for_knight(knight_at(position))
    end

    def knight_at(position)
      Knight.new(:position => position)
    end

  end
end
