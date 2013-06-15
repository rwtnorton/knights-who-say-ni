require_relative File.join('..', 'common')

test_class = KnightsWhoSayNi::FieldMarshal

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
      @board = KnightsWhoSayNi::Board[2, 2]
      @marshal = test_class.new(:board => @board)
    end

    it "has the correct board" do
      @marshal.board.must_equal(@board)
    end
  end

  describe "regarding class method .[]" do
    it "builds correctly given rows and cols" do
      actual = test_class[2, 5]
      actual.board.rows.must_equal 2
      actual.board.cols.must_equal 5
    end
  end

  describe "#pairings" do
    it "has correct number of pairs for a 2x2" do
      test_class[2, 2].pairings.size.must_equal 12
    end

    # 36 possible pairings [ (2 * 3)**2 ]
    # - 6 coincident pairings
    # - 4 threatened pairings
    it "has correct number of pairs for a 2x3" do
      test_class[2, 3].pairings.size.must_equal 26
    end
  end

end
