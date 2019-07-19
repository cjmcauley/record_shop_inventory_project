require('minitest/autorun')
require_relative('../product')

class TestProduct < MiniTest::Test

  def setup
    options = {'artist' => "Holly Herndon", 'title' => "Proto", 'quantity' => 5, 'cost_price' => 6, 'retail_price' => 12, 'img_url' => '/holly.jpg'}

    @product = Product.new(options)
  end

  def test_artist()
    result = @product.artist()
    assert_equal("Holly Herndon", result)
  end

  def test_title()
    result = @product.title()
    assert_equal("Proto", result)
  end

  def test_quantity()
    result = @product.quantity()
    assert_equal(5, result)
  end

  def test_cost_price()
    result = @product.cost_price()
    assert_equal(6.00, result)
  end

  def test_retail_price()
    result = @product.retail_price()
    assert_equal(12.00, result)
  end

  def test_img_url()
    result = @product.img_url()
    assert_equal('/holly.jpg', result)
  end

end
