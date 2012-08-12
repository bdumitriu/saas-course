require 'minitest/autorun'
require './hw1_q5'

class Foo

  attr_accessor_with_history :bar

end

class Bar

  attr_accessor_with_history :foo
  attr_accessor_with_history :bar

end

class AttrAccessorWithHistoryTest < MiniTest::Unit::TestCase

  def test_one_accessor
    f = Foo.new
    f.bar = 3
    f.bar = :bar
    f.bar = 'boo!'
    assert_equal 'boo!', f.bar
    assert_equal [nil, 3, :bar, 'boo!'], f.bar_history
  end

  def test_two_accessors
    b = Bar.new
    b.foo = 1
    b.bar = 'a'
    b.foo = :bar
    assert_equal [nil, 1, :bar], b.foo_history
    assert_equal [nil, 'a'], b.bar_history
  end

  def test_two_instances
    f = Foo.new
    f.bar = 1
    f.bar = 2
    assert_equal [nil, 1, 2], f.bar_history
    f = Foo.new
    f.bar = 4
    assert_equal [nil, 4], f.bar_history
  end

end

class CurrencyConversionTest < MiniTest::Unit::TestCase

  def test_conversion_to_dollars
    assert_equal 10 * 0.019, 10.rupees.in(:dollars)
    assert_equal 10 * 1.292, 10.euros.in(:dollar)
    assert_equal 10 * 0.013, 10.yen.in(:dollars)
    assert_equal 10, 10.dollar.in(:dollar)
  end

  def test_conversion_from_dollars
    assert_equal 10 / 0.019, 10.dollars.in(:rupee)
    assert_equal 10 / 1.292, 10.dollar.in(:euros)
    assert_equal 10 / 0.013, 10.dollar.in(:yen)
    assert_equal 10, 10.dollars.in(:dollars)
  end

  def test_other_conversions
    assert_equal 10 * 0.013 / 0.019, 10.yens.in(:rupee)
    assert_equal 10 * 0.019 / 1.292, 10.rupees.in(:euros)
    assert_equal 10 * 1.292 / 0.019, 10.euro.in(:rupee)
  end

end

class PalindromeTest < MiniTest::Unit::TestCase

  def test_string_palindrome
    assert_equal true, "A man, a plan, a canal -- Panama".palindrome?
  end

  def test_list_palindrome
    assert_equal true, [1,2,3,2,1].palindrome?
  end

  def test_list_non_palindrome
    assert_equal false, [1,2,3,12,1].palindrome?
    assert_equal true, {5 => 'a'}.palindrome?
  end

  def test_iterator_palindrome
    assert_equal true, [1,2,3,2,1].each.palindrome?
  end

end
