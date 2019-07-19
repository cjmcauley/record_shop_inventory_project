require('minitest/autorun')
require_relative('../record_label')

class TestRecordLabel < MiniTest::Test

  def setup
    @record_label = RecordLabel.new('name' => 'PAN')
  end

  def test_name()
    result = @record_label.name()
    assert_equal("PAN", result)
  end

end
