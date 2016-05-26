require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_formatter'
require './lib/dictionary'

class EnglishFormatterTest < Minitest::Test

  include Dictionary

  def test_accepts_input
    formatter = EnglishFormatter.new("stuff")
    assert_equal "stuff", formatter.english
  end

  def test_counts_english_words
    formatter = EnglishFormatter.new(["words", "stuff"])
    assert_equal 2, formatter.count(formatter.english)
  end

  def test_counts_english_letters
    formatter = EnglishFormatter.new(["w", "s", "r"])
    assert_equal 3, formatter.count(formatter.english)
  end
end
