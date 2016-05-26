require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_formatter'
require './lib/dictionary'

class EnglishFormatterTest < Minitest::Test

  include Dictionary

  def test_new_instance_of_English_formatter
    english_formatter = EnglishFormatter.new("stuff")
    assert_instance_of EnglishFormatter, english_formatter
  end

  def test_capital_defualts_as_false
    english_formatter = EnglishFormatter.new("stuff")
    assert_equal false, english_formatter.capital
  end

  def test_number_defaults_as_false
    english_formatter = EnglishFormatter.new("stuff")
    assert_equal false, english_formatter.number
  end

  def test_formatter_accepts_characters
    english_formatter = EnglishFormatter.new("stuff")
    assert_equal "stuff", english_formatter.characters
  end

  def test_for_special_characters
    skip
    english_formatter = EnglishFormatter.new([".0",".0","00"])
    assert_equal false, english_formatter.check_for_special(english_formatter)
  end
end
