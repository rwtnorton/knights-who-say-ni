require_relative File.join('..', 'common')
require 'ostruct'

test_class = KnightsWhoSayNi::Board

describe test_class do
  describe "given no constructor arguments" do
    it "barfs" do
      lambda {
        test_class.new
      }.must_raise KeyError
    end
  end

  describe "given required constructor arguments" do
    before do
      @rows = 3
      @cols = 4
      @board = test_class.new(:rows => @rows, :cols => @cols)
    end

    it "has the correct cols" do
      @board.cols.must_equal(@cols)
    end

    it "has the correct rows" do
      @board.rows.must_equal(@rows)
    end

    it "Array()-ifies correctly" do
      got = Array(@board)
      got[0].must_equal(@rows)
      got[1].must_equal(@cols)
    end

    it "splats correctly" do
      r, c = *@board
      r.must_equal(@rows)
      c.must_equal(@cols)
    end

    describe "#cover?" do
      it "returns true for position within its bounds" do
        pos = OpenStruct.new(:row => 1, :col => 2)
        @board.must_be :cover?, pos
      end

      it "returns false for position outside its cols bound" do
        pos = OpenStruct.new(:row => 100, :col => 0)
        @board.wont_be :cover?, pos
      end

      it "returns false for position outside its rows bound" do
        pos = OpenStruct.new(:row => 1, :col => 20)
        @board.wont_be :cover?, pos
      end
    end

    describe "#===" do
      it "returns true for position within bounds" do
        pos = OpenStruct.new(:row => 1, :col => 1)
        @board.must_be :===, pos
      end

      it "returns false for position outside bounds" do
        pos = OpenStruct.new(:row => 13, :col => 45)
        @board.wont_be :===, pos
      end
    end

    describe "#to_s" do
      it "stringifies to expected format" do
        expected = "[#{@rows} x #{@cols}]"
        @board.to_s.must_equal(expected)
      end
    end

    describe "#positions" do
      it "returns all positions" do
        expected = [
                    '[0, 0]',
                    '[0, 1]',
                    '[0, 2]',
                    '[0, 3]',
                    '[1, 0]',
                    '[1, 1]',
                    '[1, 2]',
                    '[1, 3]',
                    '[2, 0]',
                    '[2, 1]',
                    '[2, 2]',
                    '[2, 3]',
                    ].join("\n")
        @board.positions.map { |pos| "[#{pos.row}, #{pos.col}]" }.join("\n")
          .must_equal(expected)
      end
    end

    describe "#each" do
      it "yields positions by row then col" do
        actual = []
        @board.each do |pos|
          actual << "[#{pos.row}, #{pos.col}]"
        end
        expected = [
                    '[0, 0]',
                    '[0, 1]',
                    '[0, 2]',
                    '[0, 3]',
                    '[1, 0]',
                    '[1, 1]',
                    '[1, 2]',
                    '[1, 3]',
                    '[2, 0]',
                    '[2, 1]',
                    '[2, 2]',
                    '[2, 3]',
                    ].join("\n")
        actual.join("\n").must_equal expected
      end
    end

    describe "as an enumerable" do
      it "can select positions along main diagonal" do
        expected = [
                    '[0, 0]',
                    '[1, 1]',
                    '[2, 2]',
                   ].join("\n")
        @board.select { |pos| pos.row == pos.col }.map { |pos|
          "[#{pos.row}, #{pos.col}]" }.join("\n").must_equal expected
      end
    end
  end

  describe "regarding class method .[]" do
    it "requires cols and rows positional args" do
      lambda {
        test_class[]
      }.must_raise ArgumentError
    end

    it "generates correct board given required args" do
      board = test_class[7, 42]
      board.rows.must_equal(7)
      board.cols.must_equal(42)
    end
  end

end
