require 'minitest/autorun'
require './hw1_q6'

class CartesianProductTest < MiniTest::Unit::TestCase

  def test_both_empty
    c = CartesianProduct.new([], [])
    assert_equal [], c.map { |e1, e2| [e1, e2] }
  end

  def test_first_empty
    c = CartesianProduct.new([], [4, 5])
    assert_equal [], c.map { |e1, e2| [e1, e2] }
  end

  def test_second_empty
    c = CartesianProduct.new([4, 5], [])
    assert_equal [], c.map { |e1, e2| [e1, e2] }
  end

  def test_one_element_each
    c = CartesianProduct.new([:a], [4])
    assert_equal [[:a, 4]], c.map { |e1, e2| [e1, e2] }
  end

  def test_two_elements_each
    c = CartesianProduct.new([:a,:b], [4,5])
    assert_equal [[:a, 4], [:a, 5], [:b, 4], [:b, 5]], c.map { |e1, e2| [e1, e2] }
  end

end
