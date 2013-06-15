require_relative File.join('..', 'common')
require 'ostruct'
require 'set'

test_class = KnightsWhoSayNi::Knight

describe test_class do
  describe "given constructor with no arguments" do
    it "barfs" do
      lambda {
        test_class.new
      }.must_raise KeyError
    end
  end

  describe "given constructor with required args" do
    before do
      @position = OpenStruct.new(:row => 4, :col => 3)
      @knight = test_class.new(:position => @position)
    end

    it "has the correct row position" do
      @knight.position.row.must_equal(@position.row)
    end

    it "has the correct col position" do
      @knight.position.col.must_equal(@position.col)
    end

    it "is equal to knight at same position" do
      @knight.must_equal(test_class.new(:position => @position))
    end

    it "is not equal to knight at different position" do
      position = OpenStruct.new(:row => 1, :col => 3)
      @knight.wont_equal(test_class.new(:position => position))
    end

    it "hashes to same value as knight at same position" do
      @knight.hash.must_equal(test_class.new(:position => @position).hash)
    end

    it "hashes to different value as knight at different position" do
      position = OpenStruct.new(:row => 1, :col => 3)
      @knight.hash.wont_equal(test_class.new(:position => position).hash)
    end

    describe "#moves" do
      it "generates correct set of positions" do
        expected = Set[
                    '[5, 5]',
                    '[5, 1]',
                    '[3, 5]',
                    '[3, 1]',
                    '[6, 4]',
                    '[6, 2]',
                    '[2, 4]',
                    '[2, 2]',
                   ]
        Set.new(@knight.moves.map { |pos| "[#{pos.row}, #{pos.col}]" })
          .must_equal expected
      end
    end

    describe "#each" do
      it "yields all possible move positions" do
        actual = Set.new
        @knight.each do |move|
          actual << "[#{move.row}, #{move.col}]"
        end
        expected = Set[
                    '[5, 5]',
                    '[5, 1]',
                    '[3, 5]',
                    '[3, 1]',
                    '[6, 4]',
                    '[6, 2]',
                    '[2, 4]',
                    '[2, 2]',
                   ]
        actual.must_equal expected
      end
    end

    describe "as an enumerable" do
      it "can select moves with even rows" do
        @knight.select { |move| move.row.even? }.wont_be :empty?
      end
    end
  end

  describe "regarding class method .[]" do
    it "builds knight at correct position" do
      test_class[2, 3].position.to_a.must_equal([2, 3])
    end
  end

end
