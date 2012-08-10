require 'minitest/autorun'
require './hw1_q3'

class AnagramTest < MiniTest::Unit::TestCase
  def test_empty_input
    assert_equal [], combine_anagrams([])
  end

  def test_one_word
    assert_equal [["foo"]], combine_anagrams(["foo"])
  end

  def test_two_non_anagrams
    assert_equal [["foo"], ["bar"]].sort, combine_anagrams(["foo", "bar"]).sort
  end

  def test_two_anagrams
    assert_equal [["ofo", "foo"]], combine_anagrams(["foo", "ofo"])
  end

  def test_case_insensitive
    assert_equal [["ofo", "Foo"]], combine_anagrams(["Foo", "ofo"])
    assert_equal [["HeLLo", "hello"]], combine_anagrams(["hello", "HeLLo"])
  end

  def test_multiple_words
    assert_equal [["scar", "racs", "cars"], ["four"], ["for"], ["potatoes"], ["scream", "creams"]].sort,
      combine_anagrams(["cars", "for", "potatoes", "racs", "four", "scar", "creams", "scream"]).sort
  end
end
