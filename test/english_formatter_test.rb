require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_formatter'
require './lib/dictionary'

include Dictionary
class EnglishFormatterTest < Minitest::Test
  attr_reader :english_formatter,
              :capital_braille,
              :number_braille
  def setup
    @capital_braille = [".0",".0","00"]
    @number_braille = ["..","..",".0"]
  end

  def test_capital_starts_false
    english_formatter = EnglishFormatter.new(capital_braille)
    assert_equal false, english_formatter.capital
  end

  def test_number_input_starts_false
    english_formatter = EnglishFormatter.new(number_braille)
    assert_equal false, english_formatter.number
  end

  def test_capital_does_not_start_true
    english_formatter = EnglishFormatter.new(capital_braille)
    refute_equal true, english_formatter.capital
  end

  def test_number_does_not_start_true
    english_formatter = EnglishFormatter.new(number_braille)
    refute_equal true, english_formatter.number
  end

  def test_checks_for_shift_key
    skip
    braille = [".0",".0","00"]
    english_formatter = EnglishFormatter.new(braille)
    result = english_formatter.check_for_special(english_formatter.characters)
    assert_equal "shift", result
  end

  def test_checks_for_capital_key
    skip
    braille = ["..","..",".0"]
    english_formatter = EnglishFormatter.new(braille)
    result = english_formatter.check_for_special(english_formatter.characters)
    assert_equal "#", result
  end
end
