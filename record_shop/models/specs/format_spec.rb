require('minitest/autorun')
require_relative('../format')

class TestFormat < MiniTest::Test

  def setup
    @format = Format.new('type' => 'CD')
  end

  def test_type()
    result = @format.type()
    assert_equal("CD", result)
  end

end
