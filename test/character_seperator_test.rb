require 'minitest/autorun'
require 'minitest/pride'
require './lib/character_seperator'

class CharacterSeperatorTest < Minitest::Test
  attr_reader :text_one,
              :text_two,
              :text_three,
              :words

  def setup
    @text_one = "Hello"
    @text_two = "Hi!"
    @text_three = "HI"
    @words = "Hello World!"
  end

  def test_reads_plain_text
    seperator = CharacterSeperator.new(text_one)
    assert_equal ["H", "e", "l", "l", "o"], seperator.seperate_plain_text(seperator.plain)
  end

  def test_seperates_special_characters
    seperator = CharacterSeperator.new(text_two)
    assert_equal ["H", "i", "!",], seperator.seperate_plain_text(seperator.plain)
  end

  def test_all_caps
    seperator = CharacterSeperator.new(text_three)
    assert_equal ["H", "I"], seperator.seperate_plain_text(seperator.plain)
  end

  def test_seperate_plain_test
    seperator = CharacterSeperator.new(text_one)
    assert_equal ["H", "e", "l", "l", "o"], seperator.seperate_plain_text(seperator.plain)
  end

  def test_seperate_method
    seperator = CharacterSeperator.new(words)
    assert_equal ["H", "e", "l", "l", "o", " ", "W", "o", "r", "l", "d", "!"], seperator.seperate_plain_text(seperator.plain)
  end

  def test_three_lines_of_braille_on_one_line
    braille = ".000...000...000...000.."
    seperator = CharacterSeperator.new(braille)
    assert_equal [[".000...000...000...000.."]], seperator.three_lines_of_braille(seperator.plain)
  end
end
