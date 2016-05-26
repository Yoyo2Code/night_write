require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_formatter'
require './lib/dictionary'

class EnglishTranslatorTest < Minitest::Test

  include Dictionary

  def test_for_special_character_input
    translator = EnglishTranslator.new(["r", "w"])
    assert_equal ["r", "w"],translator.characters
  end

  def test_

  end

  def test_

  end

  def test_

  end
end
