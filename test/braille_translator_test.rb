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
    # @letter = ["I"]
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
end
