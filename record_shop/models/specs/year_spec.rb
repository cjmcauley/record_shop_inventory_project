require('minitest/autorun')
require_relative('../year')

class TestYear < MiniTest::Test

  def setup
    @record_label = Year.new('year' => 1999)
  end

  def test_year()
    result = @record_label.year()
    assert_equal(1999, result)
  end

end
