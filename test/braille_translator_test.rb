require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_translator'

class BrailleTranslatorTest < Minitest::Test
  attr_reader :input
  def setup
    @input = ["H", "I"]
  end

  def test_input_into_translator
    skip
    braille = BrailleTranslator.new(input)
    assert_equal
  end

  def test_reader_reads_files
    skip
  end

  def test_capital_letters_outputs
    new_input = ["A", "A"]
    braille = BrailleTranslator.new(new_input)

    output = braille.translate_to_braille

    assert_equal [["..","..",".0"],
                  ["0.","..",".."],
                  ["..","..",".0"],
                  ["0.","..",".."]], output
  end

end














#
#
# Instead of smiley faces,
# we call it WTF moments
# Win, Tie, F***!
