require_relative File.join('..', 'common')
require 'set'

test_class = KnightsWhoSayNi::Adjudicator

describe test_class do

  describe "given constructor with no arguments" do
    it "barfs" do
      lambda {
        test_class.new
      }.must_raise KeyError
    end
  end

  describe "given constructor with required arguments" do
    before do
      @board = KnightsWhoSayNi::Board[8, 8]
      @knight = KnightsWhoSayNi::Knight[3, 3]
      @adjudicator = test_class.new(:board => @board,
                                    :knight => @knight)
    end

    it "has the correct board" do
      @adjudicator.board.must_equal(@board)
    end

    it "has the correct knight" do
      @adjudicator.knight.must_equal(@knight)
    end

    it "generates legal knight moves on board" do
      expected = Set[
                     '[1, 2]',
                     '[1, 4]',
                     '[2, 1]',
                     '[2, 5]',
                     '[4, 1]',
                     '[4, 5]',
                     '[5, 2]',
                     '[5, 4]',
                    ]
      Set.new(@adjudicator.legal_moves.map { |move| "[#{move.row}, #{move.col}]" })
        .must_equal expected
    end
  end

  describe "given knight at origin on big board" do
    before do
      @board = KnightsWhoSayNi::Board[8, 8]
      @knight = KnightsWhoSayNi::Knight[0, 0]
      @adjudicator = test_class.new(:board => @board,
                                    :knight => @knight)
    end

    it "generates legal knight moves on board" do
      expected = Set[
                     '[2, 1]',
                     '[1, 2]',
                    ]
      Set.new(@adjudicator.legal_moves.map { |move| "[#{move.row}, #{move.col}]" })
        .must_equal expected
    end
  end

  describe "given knight at origin on narrow board" do
    before do
      @board = KnightsWhoSayNi::Board[2, 8]
      @knight = KnightsWhoSayNi::Knight[0, 0]
      @adjudicator = test_class.new(:board => @board,
                                    :knight => @knight)
    end

    it "generates legal knight moves on board" do
      expected = Set[
                     '[1, 2]',
                    ]
      Set.new(@adjudicator.legal_moves.map { |move| "[#{move.row}, #{move.col}]" })
        .must_equal expected
    end
  end

  describe "given knight at origin on flat board" do
    before do
      @board = KnightsWhoSayNi::Board[8, 2]
      @knight = KnightsWhoSayNi::Knight[0, 0]
      @adjudicator = test_class.new(:board => @board,
                                    :knight => @knight)
    end

    it "generates legal knight moves on board" do
      expected = Set[
                     '[2, 1]',
                    ]
      Set.new(@adjudicator.legal_moves.map { |move| "[#{move.row}, #{move.col}]" })
        .must_equal expected
    end
  end

  describe "given knight at origin on miniscule board" do
    before do
      @board = KnightsWhoSayNi::Board[2, 2]
      @knight = KnightsWhoSayNi::Knight[0, 0]
      @adjudicator = test_class.new(:board => @board,
                                    :knight => @knight)
    end

    it "generates legal knight moves on board" do
      expected = Set[]
      Set.new(@adjudicator.legal_moves.map { |move| "[#{move.row}, #{move.col}]" })
        .must_equal expected
    end
  end

end
