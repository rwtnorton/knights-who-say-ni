require_relative File.join '..', 'common.rb'

test_class = KnightsWhoSayNi::Position

describe KnightsWhoSayNi::Position do

  describe "given no constructor arguments" do
    it 'barfs' do
      lambda {
        test_class.new
      }.must_raise KeyError
    end
  end

  describe "given required constructor arguments" do
    before do
      @row = 0
      @col = 0
      @position = test_class.new(:row => @row, :col => @col)
    end

    it 'has correct row' do
      @position.row.must_equal(@row)
    end

    it 'has correct col' do
      @position.col.must_equal(@col)
    end

    it 'can set row' do
      @position.row = 10
      @position.row.must_equal(10)
    end

    it 'can set col' do
      @position.col = 42
      @position.col.must_equal(42)
    end

    it 'converts to array via to_ary' do
      Array(@position).must_equal([@position.row, @position.col])
    end

    it 'unpacks correctly via splat' do
      values = *@position
      values.must_equal([@position.row, @position.col])
    end

    describe "#to_s" do
      it "has the expected format" do
        expected = "(#@row, #@col)"
        @position.to_s.must_equal(expected)
      end
    end

    describe 'regarding value equality' do
      it 'has same values as equal' do
        other = test_class.new(:row => @row, :col => @col)
        @position.must_equal(other)
      end

      it 'has differing values as not equal' do
        other = test_class.new(:row => 828282, :col => 8282)
        @position.wont_equal(other)
      end

      it 'hashes same values to same number' do
        other = test_class.new(:row => @row, :col => @col)
        @position.hash.must_equal(other.hash)
      end

      it 'hashes differing values to different numbers' do
        other = test_class.new(:row => 42, :col => 1337)
        @position.hash.wont_equal(other.hash)
      end
    end

  end

  describe "regarding class method .[]" do
    it "requires row and col args" do
      lambda {
        test_class[]
      }.must_raise ArgumentError
    end

    it "generates correct positions" do
      test_class[37, 97].must_equal(test_class.new(:row => 37, :col => 97))
    end
  end

end
