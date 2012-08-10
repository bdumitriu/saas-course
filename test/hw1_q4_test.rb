require 'minitest/autorun'
require './hw1_q4'

class DessertTest < MiniTest::Unit::TestCase
  def test_accessors
    dessert = Dessert.new "ice cream", 400
    assert_equal "ice cream", dessert.name
    assert_equal 400, dessert.calories
    dessert.name = "pumpkin pie"
    dessert.calories = 1000
    assert_equal "pumpkin pie", dessert.name
    assert_equal 1000, dessert.calories
  end

  def test_methods
    dessert = Dessert.new "ice cream", 400
    assert_equal true, dessert.delicious?
    assert_equal false, dessert.healthy?
    dessert.calories = 150
    assert_equal true, dessert.healthy?
  end

  def test_subclass
    dessert = JellyBean.new "foo", 100, "black licorice"
    assert_equal false, dessert.delicious?
    dessert.flavor = "blue licorice"
    assert_equal true, dessert.delicious?
  end
end
