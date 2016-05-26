require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_formatter'
require './lib/dictionary'

class EnglishFormatterTest < Minitest::Test
  attr_reader :english_formatter,
              :capital_braille,
              :number_braille
  def setup
    @capital_braille = [".0",".0","00"]
    @number_braille = ["..","..",".0"]

  end

  def test_capital_starts_false
    english_formatter = EnglishFormatter.new
    assert_equal false, english_formatter.capital
  end

  def test_number_input_starts_false
    english_formatter = EnglishFormatter.new
    assert_equal false, english_formatter.number
  end

  def test_capital_does_not_start_true
    english_formatter = EnglishFormatter.new
    refute_equal true, english_formatter.capital
  end

  def test_number_does_not_start_true
    english_formatter = EnglishFormatter.new
    refute_equal true, english_formatter.number
  end

  def test_checks_for_shift_key
    english_formatter = EnglishFormatter.new
    result = english_formatter.check_for_special(capital_braille)
    binding.pry
    assert_equal "#", result
  end
end
