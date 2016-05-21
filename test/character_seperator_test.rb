require 'minitest/autorun'
require 'minitest/pride'
require './lib/character_seperator'

class CharacterSeperatorTest < Minitest::Test
  attr_reader :text_one,
              :text_two,
              :text_three

  def setup
    @text_one = "Hello"
    @text_two = "Hi!"
    @text_three = "HI"
  end

  def test_reads_plain_text
    seperator = CharacterSeperator.new(text_one)
    assert_equal ["H", "e", "l", "l", "o",], seperator.seperate_plain_text
  end

  def test_seperates_special_characters
    seperator = CharacterSeperator.new(text_two)
    assert_equal ["H", "i", "!",], seperator.seperate_plain_text
  end

  def test_all_caps
    seperator = CharacterSeperator.new(text_three)
    assert_equal ["H", "I"], seperator.seperate_plain_text
  end
end
