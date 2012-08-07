require 'minitest/autorun'
require './hw1_q1'

class PalindromeTest < MiniTest::Unit::TestCase
  def test_empty_string_is_palindrome
    assert_equal true, palindrome?("")
  end

  def test_one_letter_is_palindrome
    assert_equal true, palindrome?("f")
  end

  def test_non_palindrome_1
    assert_equal false, palindrome?("fo")
  end

  def test_non_palindrome_2
    assert_equal false, palindrome?("foo")
  end

  def test_non_palindrome_3
    assert_equal false, palindrome?("Abracadabra")
  end

  def test_palindrome_1
    assert_equal true, palindrome?("ff")
  end

  def test_palindrome_2
    assert_equal true, palindrome?("foof")
  end

  def test_palindrome_3
    assert_equal true, palindrome?("A man, a plan, a canal -- Panama")
    palindrome?("Madam, I'm Adam!")
  end

  def test_palindrome_4
    assert_equal true, palindrome?("Madam, I'm Adam!")
  end

  def test_check_is_case_insensitive
    assert_equal true, palindrome?("foO OoF")
  end

  def test_check_skips_non_words
    assert_equal true, palindrome?("foo-^+oof")
  end
end
