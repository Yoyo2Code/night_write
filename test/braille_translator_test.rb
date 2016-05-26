require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_translator'
require 'pry'

class BrailleTranslatorTest < Minitest::Test
  attr_reader :input,
              :letter,
              :number
              
  def setup
    @input = ["H", "I"]
    @letter = ["I"]
    @number = ["0"]
  end

  def test_input_into_translator
    braille = BrailleTranslator.new(input)
    assert_equal ["H", "I"], braille.characters
  end

  def test_capital_letter
    letter = "I"
    braille = BrailleTranslator.new(letter)
    assert_equal true, braille.capital_letter?(braille.characters)
  end

  def test_not_capital_letter
    etter = "i"
    braille = BrailleTranslator.new(letter)
    assert_equal false, braille.capital_letter?(braille.characters)
  end

  def test_translator_translates
    new_input = ["a", "a"]
    braille = BrailleTranslator.new(new_input)

    output = braille.english_to_braille

    assert_equal  [["0.","..",".."],
                  ["0.","..",".."]], output
  end

  def test_capital_letters_outputs
    new_input = ["A", "A"]
    braille = BrailleTranslator.new(new_input)

    output = braille.english_to_braille

    assert_equal  [["..","..",".0"],
                  ["0.","..",".."]],
                  [["..","..",".0"],
                  ["0.","..",".."]], output
  end

  def test_capital_letters_outputs
    new_input = ["A", "A"]
    braille = BrailleTranslator.new(new_input)

    output = braille.english_to_braille

    assert_equal  [["..","..",".0"],
                  ["0.","..",".."]],
                  [["..","..",".0"],
                  ["0.","..",".."]], output
  end

  def test_numbers
    new_input = ["1", "2"]
    braille = BrailleTranslator.new(new_input)

    output = braille.english_to_braille

    assert_equal  [[".0",".0","00"],
                  ["0.","..",".."],
                  ["0.","0.",".."]], output
  end

  def test_mixed_outputs
    new_input = ["1", "2", "u", "U",]
    braille = BrailleTranslator.new(new_input)

    output = braille.english_to_braille

    assert_equal  [[".0",".0","00"],
                  ["0.","..",".."],
                  ["0.","0.",".."],
                  ["0.","..","00"],
                  ["..","..",".0"],
                  ["0.","..","00"]], output
  end

  def test_random_test
    new_input = ["1", " ", ".", "A",]
    braille = BrailleTranslator.new(new_input)

    output = braille.english_to_braille

    assert_equal [[".0",".0","00"],
                  ["0.","..",".."],
                  ["..","..",".."],
                  ["..","00",".0"],
                  ["..","..",".0"],
                  ["0.","..",".."]], output
  end

  def test_inputting_numbers_starts_false
    braille = BrailleTranslator.new("I")
    assert_equal false, braille.inputting_numbers
  end

  def test_putting_numbers_changes_true
    braille = BrailleTranslator.new("1")
    braille.putting_numbers
    assert_equal true, braille.putting_numbers
  end

  def test_not_putting_numbers_returns_false
    braille = BrailleTranslator.new("1")
    braille.not_putting_in_numbers
    assert_equal false, braille.inputting_numbers
  end

  def test_braille_list_starts_empty
    braille = BrailleTranslator.new("I")
    assert_equal [], braille.braille
  end

  def test_capital_letter_returns_true
    braille = BrailleTranslator.new("I")
    assert_equal true, braille.capital_letter?(braille.characters)
  end

  def test_not_capital_letter_returns_false
    braille = BrailleTranslator.new("i")
    assert_equal false, braille.capital_letter?(braille.characters)
  end

  def test_no_signal_to_start_number
    braille = BrailleTranslator.new("1")
    assert_equal true, braille.start_numbers?(braille.characters)
  end
end
