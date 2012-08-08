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

class CountWordsTest < MiniTest::Unit::TestCase
  def test_no_words_in_empty_string
    words = count_words("")
    assert_equal true, words.empty?
  end

  def test_one_word
    words = count_words("foo")
    assert_equal 1, words["foo"]
    assert_equal 1, words.size
  end

  def test_one_word_multiple_times
    words = count_words("foo FOO  foo&*&foo")
    assert_equal 4, words["foo"]
    assert_equal 1, words.size
  end

  def test_multiple_words
    words = count_words("foo \nbar.baz")
    assert_equal 1, words["foo"]
    assert_equal 1, words["bar"]
    assert_equal 1, words["baz"]
    assert_equal 3, words.size
  end
  
  def test_multiple_words_multiple_times
    words = count_words("foo \nbar.foo..Foo//baz baz")
    assert_equal 3, words["foo"]
    assert_equal 1, words["bar"]
    assert_equal 2, words["baz"]
    assert_equal 3, words.size
  end

  def test_text_1
    words = count_words("A man, a plan, a canal -- Panama")
    assert_equal 3, words["a"]
    assert_equal 1, words["man"]
    assert_equal 1, words["plan"]
    assert_equal 1, words["canal"]
    assert_equal 1, words["panama"]
    assert_equal 5, words.size
  end

  def test_text_2
    words = count_words("Doo bee doo bee doo")
    assert_equal 3, words["doo"]
    assert_equal 2, words["bee"]
    assert_equal 2, words.size
  end
end
